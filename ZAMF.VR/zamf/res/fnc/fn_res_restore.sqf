/*

	AUTHOR: Phoenix
	NAME: res_restore.sqf

	DESCRIPTION:
	This restores the player's state

	PARAMETER(S):
	0 : target unit
	1 : Save array, containins all the details of the unit.

	RETURNS:
	Nothing

*/

params ["_player", "_save_array"];

private _pos = _save_array select 2;
private _dir = _save_array select 3;
private _damage = _save_array select 4;
private _loadout = _save_array select 5;
private _captive = _save_array select 6;
private _anim = _save_array select 7;
private _crew = _save_array select 8;
private _earplugs = _save_array select 10;
_crew params ["_vehicle", "_role"];

//// Do restoring
// Restore loadout
_player setUnitLoadout _loadout;

// Restore captive
_player setCaptive _captive;

// Restore damage
_player setDamage _damage;

// Restore earplugs
if (_earplugs) then {
	_player setVariable ["ace_hasEarPlugsIn", true, true];
};


//// Restore positional information
// Was in a vehicle that still exists
if ( (_role != "") && {!(isNil {_vehicle})} && {!(isNull _vehicle)} && {!(_vehicle isKindOf "Man")} ) then {

	call {

		// Driver
		if ((_role == "Driver") && {_vehicle emptyPositions _role != 0}) exitWith {
			_player moveInDriver _vehicle
		};

		// Gunner
		if ((_role == "Gunner") && {_vehicle emptyPositions _role != 0}) exitWith {
			_player moveInGunner _vehicle
		};

		// Commander
		if ((_role == "Commander") && {_vehicle emptyPositions _role != 0}) exitWith {
			_player moveInCommander _vehicle
		};

		// Cargo or if no space left in the other positions.
		if (_vehicle emptyPositions "Cargo" != 0) exitWith {
			_player moveInCargo _vehicle
		};

		// If no space anyhere, put at vehicle pos and set dir
		// Set to 0 height in case player was in the air.
		if (surfaceIsWater _pos) then {
			_player setPosASL [_pos select 0, _pos select 1, 0];
		} else {
			_player setPosATL [_pos select 0, _pos select 1, 0];
		};
		_player setDir _dir;

	};

// Was on foot
} else {
	_player setPosASL _pos;
	_player setDir _dir;
	// Only set anim if was not in vehicle
	if (_role == "") then {_player switchMove _anim};
};


//// Finished
hint "Your status has been restored";