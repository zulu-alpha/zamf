/*
	Description:
	Make sure the given object is hidden perpetually and can never be un-hidden.
	Must be executed on the server.

	Parameter(s):
	0: OBJECT - Object to force hiding for.

	Returns:
	Nothing
*/
if !(isServer) exitWith {};

_this spawn {
	params ["_unit"];
	while {alive _unit} do {
		sleep 0.1;
		if !(isObjectHidden _unit) then {
			_unit hideObjectGlobal true;
		};
	};
};
