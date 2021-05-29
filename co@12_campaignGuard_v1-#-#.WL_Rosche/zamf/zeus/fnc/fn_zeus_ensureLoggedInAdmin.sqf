/*
	Description:
		Ensures that the currently logged in admin is assigned the given curator at all
		times and unassigned when no longer admin.

	Parameter(s):
		0: CURATOR - Curator to assign to whoever is logged in as admin.

	Returns:
		Nothing
*/
if !(isServer) exitWith {};

_this spawn {

	params ["_curator"];
	waitUntil {time > 5};

	if !(isDedicated) exitWith {
		player assignCurator _curator;
	};

	while {!(isNull _curator)} do {

		private _assignedUnit = getAssignedCuratorUnit _curator	;
		if (isNull _assignedUnit) then {
			{
				if (admin (owner _x) == 2) exitWith {
					_x assignCurator _curator;
				};
			} forEach allPlayers;
		} else {
			if (admin (owner _assignedUnit) != 2) then {
				unassignCurator _curator;
			};
		};

		sleep 7;
	};

};
