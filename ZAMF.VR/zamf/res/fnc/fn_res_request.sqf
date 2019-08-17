/*

	AUTHOR: Phoenix
	NAME: res_restore.sqf

	DESCRIPTION:
	This checks to see if the player is in the save data and restores if so.

	PARAMETER(S):
	0 : target unit

	RETURNS:
	Nothing

*/
params ["_player"];

private _player_uid = getPlayerUID _player;
private _save_array = zamf_res_var_array;	// Where player data is stored
private _save_index = zamf_res_var_index;	// An index to locate where player data is stored in _save_array using UID
private _index = _save_index find _player_uid;

// If player uid in the index, then begin restore attempt
if (_index != -1) then {

	// Player data
	private _data = _save_array select _index;
	_data params ["_side", "_alive", "_pos", "_dir", "_damage", "_loadout", "_captive",
                  "_anim", "_crew", "_type", "_earplugs", "_description"];

	// Check if the connected player is still on the same side, is fo the same type and 
	// description.
	if (
		(side _player == _side) and
		(_alive) and
		(typeOf _player == _type) and
		(roleDescription _player == _description)
	   ) then {

		// Execute restore function on player machine
		diag_log hint format ["ZAM - Resume: Restoring state to: %1", name _player];
		[[_player, _data], "zamf_fnc_res_restore", _player, false] spawn BIS_fnc_MP;
	};

};

// Allow player to be saved
_player setVariable ["zamf_res_saveMe", true, true];