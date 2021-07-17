import os
from pathlib import Path
from typing import Generator
from sqf.parser import parse
from sqf.analyzer import analyze


ZAMF_PATH = Path(__file__).parent.parent / "ZAMF.VR"
# file or directory full paths with /, relative to ZAMF.VR
IGNORE = [
    "cba_settings.sqf",  # Doesn't like `force`
    "zamf/fnc/fn_getLoadout.sqf",  # Confused by advanced pre-processor
    "zamf/fnc/fn_setLoadout.sqf",  # TODO: Report incapability to parse
    "zamf/towing/fn_advancedTowingInit.sqf",  # TODO: Report parsing problem
    "zamf/spectate/fnc/fn_spectateOnDeath.sqf",  # TODO: False positive Local variable "_this"
    "AutoPilot",
    "preInit.sqf"
]


def to_ignore(relative_path: Path, ignore: list) -> bool:
    """Determines if the given file should be ignored, based on ignore list"""
    for path_str in ignore:
        try:
            relative_path.relative_to(Path(path_str))
            return True
        except ValueError:
            pass
    return False


def find_all_sqf(root_path: Path, ignore: list) -> Generator[Path, None, None]:
    """Yields all files in the given root path that have the sqf extention, if they are
    not in to be ignored.
    """
    for root, _, file_names in os.walk(root_path):
        for file_name in file_names:
            if file_name.endswith(".sqf"):
                full_path = Path(root, file_name)
                if not to_ignore(full_path.relative_to(root_path), ignore):
                    yield full_path


def test_lint_all_sqf():
    """Recurisvely serch for and lint all SQF files"""
    for path in find_all_sqf(ZAMF_PATH, IGNORE):
        with open(path, "r") as open_file:
            sqf = open_file.read()
            exceptions = analyze(parse(sqf)).exceptions
            assert not exceptions, f"{path.relative_to(ZAMF_PATH)} has errors:"
