// LoiterStart.sqf
// © v.2.0 June 2017 - Devastator_cm

#include "AutoPilotDefinitions.hpp"

private _newX 				= 0;
private _newY 				= 0;
private _AngleAdjustment 	= (AngleAdjustment * LoiterCoef);
private _AircraftVDir 		= vectordir _Aircraft;
private _XVelocity 			= _AircraftVDir  select 0;
private _YVelocity 			= _AircraftVDir  select 1;
private _ZVelocity 			= _AircraftVDir  select 2;
private _Direction 			= 0;
private _Speed 				= 100;
private _SpeedDiff 			= 0;

_newX = _XVelocity * (cos _AngleAdjustment) - _YVelocity * (sin _AngleAdjustment);
_newY = _XVelocity * (sin _AngleAdjustment) + _YVelocity * (cos _AngleAdjustment);
_Velocity = velocity _Aircraft;	
_AirCraft setvectordir [_newX, _newY, _ZVelocity];
[_Aircraft, 0, BankAngle] call BIS_fnc_setPitchBank;
_AirCraft setVelocity [(_Velocity select 0), (_Velocity select 1), 0];
sleep 0.05;