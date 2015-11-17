/*

	AUTHOR: Phoenix
	NAME: res_init.sqf

	DOWNLOAD & PARTICIPATE:
	https://bitbucket.org/zulualpha/

	DESCRIPTION:
	Initializes zamf_res and checks if there wasnt a previous save state and if its legal to use.

	PARAMETER(S):
	None

	RETURNS:
	Nothing

*/

// Multiplayer only
if !(isMultiplayer) exitWith {};

[] spawn
{
	waitUntil {time >= 5};

	// Check for alive player persistance and quit if found
	//if (count (allMissionObjects "ALiVE_sys_player") > 0) exitWith {diag_log "ZAM - Resume detected alive player persistance and halted."};


	//// Setting config settings if not defined by mission maker to userconfig setting if it exists, else hardcoded default.
	// Config defaults
	if (isNil "zamf_res_enabled") then {
		zamf_res_enabled = if !(isNil "zamf_res_conf_enabled") then {zamf_res_conf_enabled} else {true}
	};


	// Allow mod to be disabled
	if (!(isNil "zamf_res_enabled") && {!(zamf_res_enabled)}) exitwith {/*diag_log "res_init.sqf - Finished (disabled)";*/};

	// Safety sleep
	sleep 6;

	// Run on client
	if (hasInterface) then {
		// Set the player to dead when killed, as the object disappears from playableUnits and even allUnits.
		player addMPEventHandler ["mpkilled", { if (isServer) then {_this call zamf_fnc_res_killed} }];

		// Run if joining midgame (so probably need to resume)
		if (time > 30) then {
    		[[player], "zamf_fnc_res_request", false, false] spawn BIS_fnc_MP;
    	// Run if start of game (to tell the server to save player state)
    	} else {
    		player setVariable ["zamf_res_saveMe", true, true];
    	};
	};

	// Done with Client
	if !(isMultiplayer && isServer) exitWith {};

	// initialize global storage variables
	zamf_res_var_array = [];
	zamf_res_var_index = [];

	// Main Loop
	diag_log "ZAM - Resume: Started";
	[zamf_res_var_array, zamf_res_var_index] spawn zamf_fnc_res_loop;
};