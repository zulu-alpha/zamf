// AutoPilotVectorDirAndUp2DCM.sqf
// © v.2.0 June 2017 - Devastator_cm

private _v1 	= _this select 0;
private _v2 	= _this select 1;
private	_v3 	= _v1 vectorCrossProduct _v2;
private _V  	= [];
private _SInv 	= [];
private _DCM 	= [];

_V 		= [	[_v1 select 1, 		_v2 select 1, 		_v3 select 1],
	  		[_v1 select 0, 		_v2 select 0, 		_v3 select 0],
	  		[-1*(_v1 select 2), -1*(_v2 select 2), 	-1*(_v3 select 2)]];

_SInv 	= [	[1, 0, 0],
		 	[0, 0, -1],
		 	[0, 1, 0]];

_DCM = [_V, _SInv] call DEVAS_MatrixMultiply;

_DCM