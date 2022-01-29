/*
	Description:
		Ensures that the given unit is assigned to the given curator.

	Parameter(s):
		0: UNIT - Unti to assign the curator to.
		1: CURATOR - Curator to assign.

	Returns:
		Nothing
*/

if !(hasInterface) exitWith {};

_this spawn {

	params ["_unit", "_curator"];
	waitUntil {time > 5 and {!(isNull player)}};

	if (player != _unit) exitWith {};

	_curator remoteExec ["unassignCurator", 2, false];
	while {sleep 7; getAssignedCuratorUnit _curator != _unit} do {
		[_unit, _curator] remoteExec ["assignCurator", 2, false];
	};

};
