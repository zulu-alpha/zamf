/*
	Author: Phoenix of Zulu-Alpha

	Description:
		Gives the target player local only action menu options to spectate.
		Must be spawned

	Params:
		0 : OBJECT - The player to give options to.

	Returns:
		(NUL)
*/

private ["_unit"];

_unit = _this select 0;

waitUntil {!(isNull _unit) && {!(isNil "CSSA3_fnc_createSpectateDialog")}};

// Make sure addactions only appear to the player themselves.
if !(local _unit_) exitWith {};

_unit addAction ["Freecam", "zamf\debug\freecam.sqf"];
_unit addAction ["Spectate", {['forced', player] spawn CSSA3_fnc_createSpectateDialog}];