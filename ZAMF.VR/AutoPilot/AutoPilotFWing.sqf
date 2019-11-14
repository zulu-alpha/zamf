// DEVAS_AutoPilotFWing.sqf
// © v.2.0 June 2017 - Devastator_cm

#include "AutoPilotDefinitions.hpp"

private _ZVelocityPrev  	= 0;

if(    inputAction "HeliCyclicLeft" == 0 AND inputAction "HeliCyclicForward" == 0 AND inputAction "HeliCyclicRight" == 0 AND inputAction "HeliCyclicBack" == 0 
   AND inputAction "heliCollectiveRaise" == 0 AND inputAction "heliCollectiveLower" == 0) then {_HandsOff = true;} else {_HandsOff = false;};

_DCM 			= [vectorDir _AirCraft, vectorUp _AirCraft] call DEVAS_VectorDirAndUp2DCM;
_RPY 			= [_DCM] call DEVAS_DCM2RPY;
_Pitch 			= _RPY select 1;

if (abs _Pitch > FWingPitchLimit) exitwith {_AutoPilotOFF = true;};

_Roll 			= _RPY select 0;
_AltitudeDiff 	= _Altitude - (getPosWorld  _AirCraft select 2);

if (_AltitudeDiff > 0) then
{
	_PitchRequired =  ((AutoPilotPitchMax min (_AltitudeDiff * PitchCoef)) max AutoPilotPitchMin);
}
else
{
	_PitchRequired =  ((-1*(AutoPilotPitchMax) max (_AltitudeDiff * PitchCoef)) min -1*(AutoPilotPitchMin));
};

if((_Pitch < _PitchRequired AND _AltitudeDiff > 0) OR (_Pitch < _PitchRequired AND _AltitudeDiff < 0)) then 
{
	_ZVelocityPrev 	= (velocity _AirCraft select 2);
	_ZVelocity 		= _ZVelocityPrev + 0.3;
};

if((_Pitch > _PitchRequired AND _AltitudeDiff > 0) OR (_Pitch > _PitchRequired AND _AltitudeDiff < 0)) then 
{
	_ZVelocityPrev 	= (velocity _AirCraft select 2);
	_ZVelocity 		= _ZVelocityPrev - 0.3;
};

if ((_Pitch < _PitchRequired AND _PitchRequired - _Pitch < 0.3) OR (_Pitch > _PitchRequired AND _Pitch - _PitchRequired < 0.3)) then {_ZVelocity = _ZVelocityPrev;};

if ((_AltitudeDiff < 10 and _AltitudeDiff > -10 and !_HandsOff) or (_HandsOff and _AltitudeDiff < 1 and _AltitudeDiff > -1) ) then
{ 
	_AirCraft setVelocity [(velocity _AirCraft select 0), (velocity _AirCraft select 1), 0];
}
else 
{	
	_AirCraft setVelocity [(velocity _AirCraft select 0), (velocity _AirCraft select 1), _ZVelocity];
};			

if(_HandsOff) then {sleep 0.01;} else {sleep 0.3;};