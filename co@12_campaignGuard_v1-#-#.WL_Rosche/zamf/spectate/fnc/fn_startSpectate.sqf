/*
	Description:
	Initiates the respawn script with ZA settings and enhancements.
	Enhancements are optionally attaching the player to the person they are spectating and
	disabling ACRE spectating in order to hear their direct speak and radios.

	Parameter(s):
	0: OBJECT - Player object to intiate spectating for. Must be local.
	1: BOOLEAN - Whether or not to use ACRE Spectating. If False, will give direct speak and radio spectating.
	2: BOOLEAN - Whether to force the interface (whether or not the player can exit).

	Returns:
	Nothing
*/
_this spawn {
	params ["_player", "_doAcreSpectate", "_force"];
	if !(hasInterface) exitWith{};
	if !(local _player) exitWith {};

	// https://ace3mod.com/wiki/framework/spectator-framework.html#41-change-the-local-players-spectator-status
	// If ACRE spectating is disbled, then stay visible
	[true, _force, !_doAcreSpectate] call ace_spectator_fnc_setSpectator;
	// https://ace3mod.com/wiki/framework/spectator-framework.html#42-whitelistblacklist-units-available-to-spectate
	[allUnits, [_player]] call ace_spectator_fnc_updateUnits;
	// https://ace3mod.com/wiki/framework/spectator-framework.html#43-addremove-sides-available-to-spectate
	[[west, east, independent], [civilian]] call ace_spectator_fnc_updateSides;
	// https://ace3mod.com/wiki/framework/spectator-framework.html#44-addremove-available-camera-modes
	[[0, 1, 2], []] call ace_spectator_fnc_updateCameraModes;
	// https://ace3mod.com/wiki/framework/spectator-framework.html#45-addremove-available-vision-modes
	[[-2, -1, 0, 1], [2, 3, 4, 5, 6, 7]] call ace_spectator_fnc_updateVisionModes;
	// https://ace3mod.com/wiki/framework/spectator-framework.html#46-set-the-camera-modefocusvisionpositiondirection
	[2] call ace_spectator_fnc_setCameraAttributes;

	if !(_doAcreSpectate) then {
		_player allowDamage false;
		private _orig_pos = getPos _player;

		setOrigPos = {
			params ["_player"];
			detach _player;
			_player setVelocity [0, 0, 0];
			_player setPos _orig_pos;
		};
		// http://acre.idi-systems.com/api/api_general.html#acre_api_fnc_setSpectator
		[false] call acre_api_fnc_setSpectator;

		// While the spectating is active.
		while {!(isNil "ace_spectator_isSet") and {ace_spectator_isSet}} do {
			sleep 0.2;
			// If there is a camera focus.
			if !(isNil "ace_spectator_camFocus") then {
				// If the spectate target changed.
				if (vehicle ace_spectator_camFocus != attachedTo _player) then {
					detach _player;
					// Jump in the air to trick ACE Stamina into disabling itself
					// make (isTouchingGround player == false).
					private _jump_pos = getPos _player;
					_jump_pos set [2, (_jump_pos select 2) + 1];
					_player setPos _jump_pos;
					_player attachTo [vehicle ace_spectator_camFocus, [0,0,2]];
				};
				// If there is no spectate target.
				if (isNull ace_spectator_camFocus) then {
					[_player] call setOrigPos;
				};
			};
		};
		// Cleanup for spectator system close.
		if !(isNull (attachedTo _player)) then { 
			[_player] call setOrigPos;
		};

	};
};
