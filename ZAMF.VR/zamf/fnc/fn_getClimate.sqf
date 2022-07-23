/*
	Author: Phoenix of Zulu-Alpha

	Description:
		Determines the climate type from a list of hardcoded islands.
		Returns the climate type as an int, increasing with the intensity of green

	Params:
		None

	Returns:
		(INT) - 0 (for Arid), 1 (for Transitional), 2 (for Woodland) or 3 (for Snow)

*/

// World uniform type matching
// Make sure you add new terrains in lower-case
private _arid = ["farkhar", "mcn_aliabad", "clafghan", "desert_e", "desert_island", "dya", "fallujah", "mcn_hazarkot", "isladuala3", "kidal", "lythium", "porto", "reshmaan", "shapur_baf", "takistan", "mountains_acr", "zargabad", "kunduz", "fata", "tem_kujari"];
private _tran = ["vr", "altis", "abel", "malden", "provinggrounds_pmc", "intro", "sara", "saralite", "stratis", "uhao", "sara_dbe1"];
private _wood = ["bootcamp_acr", "cain", "woodland_acr", "chernarus", "eden", "noe", "kapaulio", "chernarus_summer", "tanoa", "utes", "bornholm", "pja305", "panthera3", "anim_helvantis_v2", "tem_ihantala","rof_mok","WL_Rosche", "vt7"];
private _snow = ["chernarus_winter"];

private _world = toLower worldName;

// Index number representing unifrom choice is determined by world type
private _index = call {
	if (_world in _arid) exitWith {0};
	if (_world in _tran) exitWith {1};
	if (_world in _wood) exitWith {2};
	if (_world in _snow) exitWith {3};
	1
};

_index
