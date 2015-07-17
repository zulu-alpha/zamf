/*
	Aurthor: Phoenix

	Purpose: To set object texture (0 position), taking into account respawn of vehicle midgame and JIP compatible

	Parameters:
		0: Array of vehicle class names to set
		1: Array of texture to set and position ([0,"zamf\vehicles\za_flag.paa"])

	Example:
		nul = [["kyo_MH47E_HC","kyo_MH47E_base","kyo_MH47E_Ramp"], [0,"zamf\vehicles\za_flag.paa"]] execVm "zamf\vehicles\zamf_setTexture.sqf"
*/

private ["_vehicles", "_texture", "_set_vehicles"];

if !isServer exitWith {};

_vehicles = _this select 0;
_texture = _this select 1;

_set_vehicles = [];

while {true} do {
	sleep 60;
	{
		if ( !(isNil "_x") && {!(isNull _x)} && {typeOf _x in _vehicles} && {!(_x in _set_vehicles)} ) then {
			_x setObjectTextureGlobal _texture;
			_set_vehicles set [count _set_vehicles, _x];
		}
	} count vehicles;
};