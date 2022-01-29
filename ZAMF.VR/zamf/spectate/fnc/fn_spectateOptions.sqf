/*
	Author: Phoenix of Zulu-Alpha

	Description:
	Gives the target player local only action menu options to spectate.

	Params:
	0: OBJECT - The player to give options to.

	Returns:
	Nothing
*/
_this spawn {
	params ["_unit"];
	waitUntil {!(isNull _unit)};

	// Make sure addactions only appear to the player themselves.
	if !(local _unit) exitWith {};

	private _teleport_map_click = {
		onMapSingleClick "player setPos _pos; onMapSingleClick ''; hint ''";
		hintSilent "Open your map and left click on where you want to teleport to.";
	};

	_unit addAction ["Freecam", "zamf\spectate\freecam.sqf"];
	_unit addAction ["Spectate", {[player, false, false] call zamf_fnc_startSpectate;}];
	_unit addAction ["Teleport", _teleport_map_click];
};
