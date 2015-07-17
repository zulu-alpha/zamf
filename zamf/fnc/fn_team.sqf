/*
	Author: Phoenix of Zulu-Alpha

	Description:
		Sets the unit to the given gear and Group ID

	Params:
		0 : OBJECT - The unit to apply gear and ID to.
		1 : STRING - The type of Gear to be outfitted (see zamf\loadout\gear.sqf for choices).
		2 : STRING - The Group ID of the player

	Returns:
		(NUL)
*/

private ["_unit", "_gear", "_gid"];

_unit = _this select 0;
_gear = _this select 1;
_gid = _this select 2;

[_unit, _gear] spawn zamf_fnc_gear;
_unit setGroupId [_gid];