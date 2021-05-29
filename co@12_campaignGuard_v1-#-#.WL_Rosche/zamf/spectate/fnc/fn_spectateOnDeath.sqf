/*
	Description:
	Add event handlers that makes dead players spectate if they're respawn timer is longer
	than the given value, and end their spectator script when they respawn.

	Parameter(s):
	0: NUMBER - Number of seconds their respawn timer must be longer than.

	Returns:
	Nothing
*/
_this spawn {
	params ["_respawn_timer"];
	if !(hasInterface) exitWith{};
	waitUntil {!(isNull player)};

	// Can't think of a better way to transfer variables into event handler code.
	// Subtract one second as it takes a second before the EH code executes.
	zamf_var_minRespawnTimerForSpectate = _respawn_timer - 1;

	// Start the spectator script if the respawn counter is suitably long
	player addEventHandler ["killed", {
		_this spawn {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			private _side = side _unit;
			sleep 1;
			if (playerRespawnTime > zamf_var_minRespawnTimerForSpectate) then {
				// Start spectator.
				[_unit, true, true] call zamf_fnc_startSpectate;
			};
		};
	}];

	// End the spactator script when the player comes back alive
	player addEventHandler ["respawn", {
		[false] call ace_spectator_fnc_setSpectator;
	}];
};
