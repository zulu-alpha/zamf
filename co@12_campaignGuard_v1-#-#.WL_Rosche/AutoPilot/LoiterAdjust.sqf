// LoiterAdjust.sqf
// © v.2.0 June 2017 - Devastator_cm

#include "AutoPilotDefinitions.hpp"

_Velocity  	= velocity _AirCraft;
_DCM 		= [vectorDir _AirCraft, vectorUp _AirCraft] call DEVAS_VectorDirAndUp2DCM;
_RPY 		= [_DCM] call DEVAS_DCM2RPY;
_Pitch 		= _RPY select 1;
_Roll 		= _RPY select 0;


while {round(_Roll) != BankAngle AND !(_AirCraft getVariable "DEVAS_Loiter")} do
{
	_DCM 	= [vectorDir _AirCraft, vectorUp _AirCraft] call DEVAS_VectorDirAndUp2DCM;
	_RPY 	= [_DCM] call DEVAS_DCM2RPY;
	_Pitch 	= _RPY select 1;
	_Roll 	= _RPY select 0;
	if(_Roll > BankAngle) then {_Roll = _Roll - PitchAdjust * 3;} else {_Roll = _Roll + PitchAdjust * 3;};
	_Velocity  = velocity _Aircraft;
	_ZVelocity = _Velocity select 2;
	if(_ZVelocity > 0) then {_ZVelocity = _ZVelocity - 1};
	if(_ZVelocity < 0) then {_ZVelocity = _ZVelocity + 1};
	[_Aircraft, _Pitch, _Roll] call BIS_fnc_setPitchBank;
    _AirCraft setVelocity [(_Velocity select 0), (_Velocity select 1), _ZVelocity];
	sleep 0.01;
};