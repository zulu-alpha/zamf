/*
	@file Version: v0.2
	@file name: crates_refill.sqf
	@file Author: Phoenix of Zulu-Alpha
	@file Description: Refills Crate.
	@usage Put in loadout folder with crates.sqf
*/

_target = _this select 0;
_loadout = _this select 3;

[[_target, _loadout], "zamf_fnc_crates", false, false] spawn BIS_fnc_MP;