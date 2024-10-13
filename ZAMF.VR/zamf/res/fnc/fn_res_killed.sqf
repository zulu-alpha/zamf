/*

	AUTHOR: Phoenix
	NAME: res_killed.sqf

	DESCRIPTION:
	Sets the save data to killed for the given player object.

	PARAMETER(S):
	0 : target unit

	RETURNS:
	Nothing

*/

private ["_player", "_player_uid", "_save_array", "_save_index", "_index"];

_player = _this select 0;

_player_uid = getPlayerUID _player;
diag_log format["ZAM - Resume: killed, player: %1", _player];
diag_log format["ZAM - Resume: killed, player_uid: %1", _player_uid];

_save_array = zamf_res_var_array;	// Where player data is stored
_save_index = zamf_res_var_index;	// An index to locate where player data is stored in _save_array using UID

_index = _save_index find _player_uid;

// If player uid in the index, then begin restore attempt
if (_index != -1) then {

	// Sets
	(_save_array select _index) set [1, false];

} else {
	diag_log format["ZAM - Resume: Failed to set %1 as dead", _player_uid];
};