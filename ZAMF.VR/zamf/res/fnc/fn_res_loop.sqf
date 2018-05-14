/*

	AUTHOR: Phoenix
	NAME: res_loop.sqf

	DOWNLOAD & PARTICIPATE:
	https://bitbucket.org/zulualpha/

	DESCRIPTION:
	Loops to continually save the player's state.

	PARAMETER(S):
	0 : Name of variable in player's profilenamespace
	1 : Game session ID the save is relevant to

	RETURNS:
	Nothing

*/
private ["_save_array", "_save_index"];

_save_array = _this select 0;	// Where player data is stored
_save_index = _this select 1;	// An index to locate where player data is stored in _save_array using UID

// Main loop
for "_i" from 0 to 1 step 0 do {

	private "_save_index_size";
	_save_index_size = count _save_index;

	// Loop through all playable units
	{

		// If a player, should be saved and is not null then save in _save_array
		if ( (isPlayer _x) && (_x getVariable ["zamf_res_saveMe", false]) ) then {
			private ["_x_uid", "_x_save", "_index"];
			_x_uid = getPlayerUID _x;							// Get UID (for index).
			_x_save = [_x] call zamf_fnc_res_getData;			// Get data.
			_index = _save_index find _x_uid;					// Get position in array to put data by using the index.
			if (_index == -1) then {							// If not in index (so probably not in array) then
				_index = _save_index_size;						// pick a new spot in the array.
				_save_index set [_index, _x_uid];				// Save UID to index.
			};
			_save_array set [_index, _x_save];					// Save data to array.
			sleep 0.1;											// Delay to smoothen out perfrmance
		};

	} count playableUnits;

	// Remove extra elements
	_save_array resize _save_index_size;

	// Publicize it for debug purposes
	//zamf_res_debug_array = _save_array;
	//publicVariable "zamf_res_debug_array";
	//zamf_res_debug_index = _save_index;
	//publicVariable "zamf_res_debug_index";

	// Iterate through all players every 5 to 60 seconds, depending on server FPS.
	sleep ((250 / diag_fpsmin) min 60);

};