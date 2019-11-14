// AutoPilotMain.sqf
// © v.2.0 June 2017 - Devastator_cm

#include "AutoPilotDefinitions.hpp"
#include "AutoPilotFunctions.sqf"

private _AirCraft 			= _this select 0;
private _ActionID 			= _AirCraft getVariable "DEVAS_AutoPilotActionID";
private _NewActionID 		= 0;
private _MinimumSpeed  		= ([(configFile >> "CfgVehicles" >> typeOf _AirCraft), "landingSpeed", 0] call BIS_fnc_returnConfigEntry) max MinimumSpeed;
private _Pitch				= 0;
private _PitchRequired		= 0;
private _Altitude     		= 0;
private _AltitudeDiff 		= 0;
private _ZVelocity			= 0;
private _DCM 				= [];
private _RPY 				= [];
private _HandsOff 			= false;
private _AutoPilotOFF       = false;
private _Velocity           = velocity _AirCraft;

if(_AirCraft getVariable "DEVAS_AutoPilot") then
{
	_Altitude 		= getPosWorld  _AirCraft select 2;
	_NewActionID 	= [_AirCraft, _ActionID, AltitudeFix] call DEVAS_RemoveAction;
	["Auto Pilot On"] call DEVAS_Switch;

	while {!(_AirCraft getVariable "DEVAS_AutoPilot")} do
	{
		if(_AirCraft isKindOf "Helicopter") then {call DEVAS_AutoPilotHeli;} else {call DEVAS_AutoPilotFWing;};

		if (!alive _AirCraft OR speed _AirCraft < _MinimumSpeed OR speed _AirCraft > MaximumSpeed OR !local _AirCraft OR !isEngineOn _AirCraft OR !canmove _AirCraft OR _AutoPilotOFF OR !local _AirCraft OR !(_AirCraft getVariable ["DEVAS_Loiter", true])) exitwith 
		{
			_NewActionID = [_AirCraft, _NewActionID, AltitudeFix]  call DEVAS_RemoveAction;
		};
	};

	["Auto Pilot Off"] call DEVAS_Switch;
}
else
{
	_NewActionID = [_AirCraft, _ActionID, AltitudeFix] call DEVAS_RemoveAction;
};