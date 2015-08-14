/*
	Author: Phoenix of Zulu-Alpha

	Description:
		Determines the climate type from a list of hardcoded islands.
		Returns the climate type as an int, increasing with the intensity of green

	Params:
		None

	Returns:
		(INT) - 0 (for Arid), 1 (for Transitional) or 2 (for Woodland)

*/

// World uniform type matching
_arid = ["Altis", "Stratis", "Desert_E", "Shapur_BAF", "Takistan", "Zargabad", "IslaDuala3", "Porto", "Mountains_ACR", "Bornholm", "Kunduz"];
_tran = ["ProvingGrounds_PMC", "Sara", "SaraLite", "Sara_dbe1", "Intro"];
_wood = ["Chernarus", "utes", "Woodland_ACR", "Bootcamp_ACR", "pja305", "VR", "Chernarus_Summer", "Panthera3", "anim_helvantis_v2"];

_world = worldName;

// Index number representing unifrom choice is determined by world type
_index = call {
	if (_world in _arid) exitWith {0};
	if (_world in _tran) exitWith {1};
	if (_world in _wood) exitWith {2};
	1
};

_index