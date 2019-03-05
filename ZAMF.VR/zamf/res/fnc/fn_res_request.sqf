/*

	AUTHOR: Phoenix
	NAME: res_restore.sqf

	DOWNLOAD & PARTICIPATE:
	https://bitbucket.org/zulualpha/

	DESCRIPTION:
	This checks to see if the player is in the save data and restores if so.

	PARAMETER(S):
	0 : target unit

	RETURNS:
	Nothing

*/
params ["_player"];

private ["_player_uid", "_save_array", "_save_index", "_index"];

_player_uid = getPlayerUID _player;

_save_array = zamf_res_var_array;	// Where player data is stored
_save_index = zamf_res_var_index;	// An index to locate where player data is stored in _save_array using UID

_index = _save_index find _player_uid;

// If player uid in the index, then begin restore attempt
if (_index != -1) then {

	private ["_data", "_side", "_alive"];

	// Player data
	_data = _save_array select _index;

	// Check if the connected player is still on the same side and has the same type
	_side = _data select 0;
	_alive = _data select 1;
	if ( (side _player == _side) && (_alive) ) then {

		// Execute restore function on player machine
		diag_log hint format ["ZAM - Resume: Restoring state to: %1", name _player];
		[[_player, _data], "zamf_fnc_res_restore", _player, false] spawn BIS_fnc_MP;

	};

};

// Allow player to be saved
_player setVariable ["zamf_res_saveMe", true, true];