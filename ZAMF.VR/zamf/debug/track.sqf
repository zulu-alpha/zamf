/*

	Author: Phoenix of ZUlu-Alpha

	Description: Creates and keeps up to date local markers for all units and shows their names if
	players only while the bis old camera marker exists (so stops tracking when player exits bis debug camera).

	Params: None

	Returns: None

	Usage: nul = [] execVm "zamf\spect\spect_track.sqf";

*/

// Dont run if tracking is already running somewhere else (The marker array will already be defined)
if (!isNil "zamf_var_allUnitsPos") exitWith {};

while {"BIS_DEBUG_CAM_MARKER" in allMapMarkers} do {

	// Array that keeps track of the created markers (reinitialized on each loop)
	zamf_var_allUnitsPos = [];
	{

		// String representation of object
		private _object_str = str _x;

		// Create the marker and set it's type using the string reper of the object it's tracking
		createMarkerLocal [_object_str, getPosAtl _x];
		_object_str setMarkerTypeLocal "mil_dot";

		// Decide marker color depending on side
		private _color = call {
			if (side group _x == east) exitWith {"colorRed"};
			if (side group _x == west) exitWith {"colorBlue"};
			if (side group _x == civilian) exitWith {"colorCivilian"};
			if (side group _x == resistance) exitWith {"colorGreen"};
			"colorBlack"
		};

		// Set the color
		_object_str setMarkerColorLocal _color;

		// Give the marker the player's name if a player
		if (isPlayer _x) then {_object_str setMarkerTextLocal (name _x)};

		// Add to the marker array in order to delete later for refresh
		zamf_var_allUnitsPos set [count zamf_var_allUnitsPos, _object_str];

	} count allUnits;

	// Sleep timer
	sleep 1;

	// Delete all the previously created markers in order to refresh them
	if !(isNil "zamf_var_allUnitsPos") then {
		{deleteMarkerLocal _x} count zamf_var_allUnitsPos;
	};

};

// Destroy array to indicate that it is not running anymore
zamf_var_allUnitsPos = nil;