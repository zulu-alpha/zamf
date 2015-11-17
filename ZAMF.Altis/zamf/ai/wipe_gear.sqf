_unit = _this select 0;

{
	removeallweapons _x;
	removeallitems _x;
	removeBackpack _x;
} foreach crew _unit;

/*
removeallweapons _unit;
removeallitems _unit;
removeBackpack _unit;
_dummy=[_unit, "ALL"] call ACE_fnc_RemoveGear ;
ace_sys_wounds_no_medical_gear = true;
*/