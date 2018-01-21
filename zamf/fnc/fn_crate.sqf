/*
	Author: Phoenix of Zulu-Alpha

	Description:
		Gives the crate the given gear, labels the crate with the given name using ZAM-Shownames and
		optionally restricts access to the crate to anyone but members of the given name of it matches their group ID.

	Params:
		0 : OBJECT - The crate to apply gear and ID to.
		1 : STRING - The type of Gear to be outfitted (see zamf\loadout\crates.sqf for choices).
		2 : STRING - The name to label the crate with.
		3 : BOOLEAN - If True, then restrict access to members of the the team who's group ID matches the name.

	Returns:
		(NUL)
*/

params ["_crate", "_gear", "_name", "_restrict"];


[_crate, _gear] spawn zamf_fnc_crates;
[_crate, true, _name] call ZAM_fnc_showNames_addDiscoverable;

// Add option to save loadout for respawn
// Only add it if the right crate (not strictly necessary)
_crate addAction [
	("<t color=""#0000FF"">" + ("Save loadout") + "</t>"),
	{
		// Save kit
		zamf_var_gear_loadout_saved = [player, ["ammo"]] call zamf_fnc_getLoadout;
		// Save earplugs
		if ([player] call ace_Hearing_fnc_hasEarPlugsIn) then {
			zamf_var_gear_loadout_saved_earplugs = true;
		};
		// Notify player
		if !(isNil "zamf_var_gear_loadout_saved") then {
			hint "Loadout saved";
		} else {
			hint "Loadout failed to save";
		};
	},
	 nil,
	-15,
	true,
	true,
	"",
	"(_target getVariable [""zam_showNames_name"", """"]) == (groupId (group _this))"
];

// Apply restriction
if (_restrict) then {
	// Don't rely on ZAMF Shownames for crate access.
	_crate setVariable ["group_name_restriction", _name];

	_crate addEventHandler ["ContainerOpened", {

		private ["_crate", "_player", "_crate_name", "_player_gid"];

		_crate = _this select 0;
		_player = _this select 1;

		_crate_name = _crate getVariable ["group_name_restriction", ""];
		_player_gid = groupId (group _player);

		if (_crate_name != _player_gid) then {

			_crate_name spawn {
				waitUntil {!isnull (findDisplay 602)};
				(findDisplay 602) closeDisplay 2;
				hint format ["You must be a member of %1 to access this crate!", _this];
			};

		};

	}];
};
