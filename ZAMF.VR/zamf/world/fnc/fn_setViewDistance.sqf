/*
	Description:
	Sets view distance. Designed for use with params. 

	Parameter(s):
	0: NUMBER - View distance in meters. -1 for no change.

	Returns:
	Nothing
*/
_this spawn {
	params ["_distance"];
	if (_distance > -1) then {
		waitUntil {time > 10};
		setViewDistance _distance;
	};
};
