// AutoPilotHeli.sqf
// © v.2.0 June 2017 - Devastator_cm

#include "AutoPilotDefinitions.hpp"

_DCM 	= [vectorDir _AirCraft, vectorUp _AirCraft] call DEVAS_VectorDirAndUp2DCM;
_RPY 	= [_DCM] call DEVAS_DCM2RPY;
_Pitch 	= _RPY select 1;
_Roll 	= _RPY select 0;

if(_HandsOff AND _Pitch > -HeliPitchAuto AND _Pitch < HeliPitchAuto) then
{
	if(_Pitch > HeliDefaultPitch) then {_Pitch  = _Pitch - PitchAdjust;};
	if(_Pitch < HeliDefaultPitch) then {_Pitch  = _Pitch + PitchAdjust};
	_ZVelocity = _Velocity select 2;
	if(_ZVelocity > 0) then {_ZVelocity  = _ZVelocity - 0.5};
	if(_ZVelocity < 0) then {_ZVelocity  = _ZVelocity + 0.5};
	if(_ZVelocity > -1 AND  _ZVelocity < 1) then {_ZVelocity = 0;};
	_Roll 	= _RPY select 0;
	[_Aircraft, _Pitch, _Roll] call BIS_fnc_setPitchBank;
	_AirCraft setVelocity [(_Velocity select 0), (_Velocity select 1), _ZVelocity];
	
};

if (abs _Pitch > HeliPitchLimit OR abs _Roll > HeliRollLimit OR inputAction "HeliRudderLeft" != 0 OR inputAction "HeliRudderRight" != 0) exitwith {_AutoPilotOFF = true;};

if(inputAction "heliCollectiveRaise" == 0 AND inputAction "heliCollectiveLower" == 0 AND inputAction "HeliCyclicForward" == 0 AND inputAction "HeliCyclicBack" == 0 AND inputAction "HeliCyclicRight" == 0 AND inputAction "HeliCyclicLeft" == 0) then 
{
	_HandsOff = true;
} 
else 
{
	_HandsOff = false;
	_Velocity = velocity _AirCraft;
};

if(_HandsOff) then {sleep 0.05;} else {sleep 0.8;};