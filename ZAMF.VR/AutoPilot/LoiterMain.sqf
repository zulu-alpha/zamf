// LoiterMain.sqf
// © v.2.0 June 2017 - Devastator_cm

#include "AutoPilotDefinitions.hpp"
#include "AutoPilotFunctions.sqf"

private _AirCraft 			= _this select 0;
private _ActionID 			= _AirCraft getVariable "DEVAS_LoiterActionID";
private _NewActionID 		= 0;
private _MinimumSpeed  		= ([(configFile >> "CfgVehicles" >> typeOf _AirCraft), "landingSpeed", 0] call BIS_fnc_returnConfigEntry) max MinimumSpeed;
private _Pitch				= 0;
private _ZVelocity			= 0;
private _DCM 				= [];
private _RPY 				= [];
private _HandsOff 			= false;
private _Velocity           = velocity _AirCraft;
private _LoiterOff          = false;


if(_AirCraft getVariable "DEVAS_Loiter") then
{
	_NewActionID = [_AirCraft, _ActionID, Loiter] call DEVAS_RemoveAction;
	["Loiter On"] call DEVAS_Switch;
	if (!alive _AirCraft OR speed _AirCraft < _MinimumSpeed OR speed _AirCraft > MaximumSpeed OR !local _AirCraft OR !isEngineOn _AirCraft OR !canmove _AirCraft OR _LoiterOff OR !local _AirCraft OR !(_AirCraft getVariable ["DEVAS_AutoPilot", true])) exitwith 
	{
		_NewActionID = [_AirCraft, _NewActionID, Loiter]  call DEVAS_RemoveAction;
		["Loiter Off"] call DEVAS_Switch;
	};
	call DEVAS_LoiterAdjust;
	while {!(_AirCraft getVariable "DEVAS_Loiter")} do
	{
		call DEVAS_LoiterStart;

		if (!alive _AirCraft OR speed _AirCraft < _MinimumSpeed OR speed _AirCraft > MaximumSpeed OR !local _AirCraft OR !isEngineOn _AirCraft OR !canmove _AirCraft OR _LoiterOff OR !local _AirCraft OR !(_AirCraft getVariable ["DEVAS_AutoPilot", true])) exitwith 
		{
			_NewActionID = [_AirCraft, _NewActionID, Loiter]  call DEVAS_RemoveAction;
		};
	};

	["Loiter Off"] call DEVAS_Switch;
}
else
{
	_NewActionID = [_AirCraft, _ActionID, Loiter] call DEVAS_RemoveAction;
};