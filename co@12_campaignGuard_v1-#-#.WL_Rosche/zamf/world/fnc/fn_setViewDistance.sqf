/*
	Description:
	Sets view distance. Designed for use with params. 

	Parameter(s):
	0: STRING - Params class name for the view disatance.

	Returns:
	Nothing
*/
_this spawn {
	params ["_distance_name"];
	private _distance = [_distance_name, -1] call BIS_fnc_getParamValue;
	if (_distance > -1) then {
		waitUntil {time > 5};
		setViewDistance _distance;
	};
};
