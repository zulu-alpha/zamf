/*
	Author: Phoenix of Zulu-Alpha

	Description:
		Gives the crate the given gear, labels the crate with the given name using ZAM-Shownames and
		optionally restricts access to the crate to anyone but members of the given name of it matches their group ID.

	Params:
		0 : OBJECT - The crate to apply gear and ID to.
		1 : STRING - The type of Gear to be outfitted (see zamf\loadout\crates.sqf for choices).
		2 : STRING - The name to label the crate with.
		3 : BOOLEAN - If True, then restrict access to members of the the team who's group ID matches the name.

	Returns:
		(NUL)
*/

private ["_crate", "_gear", "_nam", "_restrict", "_check"];

_crate = _this select 0;
_gear = _this select 1;
_nam = _this select 2;
_restrict = _this select 3;


[_crate, _gear] spawn zamf_fnc_crates;
[_crate, true, _nam] call ZAM_fnc_showNames_addDiscoverable;

// Apply restriction
if (_restrict) then {
	_crate addEventHandler ["ContainerOpened", {

		private ["_crate", "_player", "_crate_name", "_player_gid"];

		_crate = _this select 0;
		_player = _this select 1;

		_crate_name = _crate getVariable ["zam_showNames_name", ""];
		_player_gid = groupId (group _player);

		if (_crate_name != _player_gid) then {

			_crate_name spawn {
				waitUntil {!isnull (findDisplay 602)};
				(findDisplay 602) closeDisplay 2;
				hint format ["You must be a member of %1 to access this crate!, %2", _this];
			};

		};

	}];
};