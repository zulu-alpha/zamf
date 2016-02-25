/*
	@file Version: v1
	@file name: gear.sqf
	@file Author: Phoenix of Zulu-Alpha
	@file Description: Loads out a units with gear (only for player units).
	@usage Call example (from unit init):
	@usage nul = [_unit, "west"] execVM "loadout\gear.sqf";
*/

if !(hasInterface) then {
	waitUntil {time > 5};
} else {
	waitUntil {(time > 0) && !(isNull player) && {name player != "Error: No vehicle"}};
};

_unit = _this select 0;
if !(local _unit) exitWith {};
this = _unit; // Ease compatibility with BIS Arsenal export
_loadout = _this select 1;

// Get the camo type needed
_index = call zamf_fnc_getClimate;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

switch (_loadout) do {

	case "officer": {

		comment "Add containers";
		_unit forceAddUniform (["u_uniform3_kampat_arid", "u_uniform3_kampat_transitional", "u_uniform3_kampat_transitional"] select _index);
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["v_platecarrier1_kampat_arid", "v_platecarrier1_kampat_transitional", "v_platecarrier1_kampat_transitional"] select _index);
		_unit addHeadgear (["h_milcap_kampat_arid", "h_milcap_kampat_transitional", "h_milcap_kampat_transitional"] select _index);
		_unit addGoggles "G_Lowprofile";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};


	case "grunt": {

		comment "Add containers";
		_unit forceAddUniform (["u_uniform2_kampat_arid", "u_uniform2_kampat_transitional", "u_uniform1_kampat_transitional"] select _index);
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["v_platecarrier2_kampat_arid", "v_platecarrier2_kampat_transitional", "v_platecarrier2_kampat_transitional"] select _index);
		_unit addHeadgear (["h_canvashelmet_kampat_arid", "h_canvashelmet_kampat_transitional", "h_canvashelmet_kampat_transitional"] select _index);
		_unit addGoggles "G_Combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};

	case "heli": {

		comment "Add containers";
		_unit forceAddUniform (["u_uniform2_kampat_arid", "u_uniform2_kampat_transitional", "u_uniform1_kampat_transitional"] select _index);
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["V_TacVestIR_blk", "V_TacVestIR_blk", "V_TacVestIR_blk"] select _index);
		_unit addHeadgear (["H_PilotHelmetHeli_B", "H_PilotHelmetHeli_O", "H_PilotHelmetHeli_O"] select _index);

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};

	case "jet": {

		comment "Add containers";
		_unit forceAddUniform "U_B_PilotCoveralls";
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addHeadgear "H_PilotHelmetFighter_B";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};

	case "crew": {

		comment "Add containers";
		_unit forceAddUniform (["u_uniform1_kampat_arid", "u_uniform1_kampat_transitional", "u_uniform1_kampat_transitional"] select _index);
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["v_tacticalvest_kampat_arid", "v_tacticalvest_kampat_transitional", "v_tacticalvest_kampat_transitional"] select _index);
		_unit addHeadgear "h_crewhelmet_kampat";
		_unit addGoggles "G_Balaclava_combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};

	case "candidate": {

		comment "Add containers";
		_unit forceAddUniform (["u_uniform1_kampat_arid", "u_uniform1_kampat_transitional", "u_uniform1_kampat_transitional"] select _index);
		_unit addItemToUniform "ACE_EarPlugs";

	};

	case "ds": {

		comment "Add containers";
		_unit forceAddUniform (["u_uniform3_kampat_arid", "u_uniform3_kampat_transitional", "u_uniform3_kampat_transitional"] select _index);
		_unit addItemToUniform "ACE_NVG_Gen4";
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_M84";};
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addHeadgear (["h_milcap_kampat_arid", "h_milcap_kampat_transitional", "h_milcap_kampat_transitional"] select _index);
		_unit addGoggles "G_Shades_Black";

		comment "Add weapons";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "tf_anprc152";
		_unit linkItem "ItemcTab";

	};

	case "zeus": {

		comment "Add containers";
		_unit forceAddUniform "U_Competitor";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addBackpack (["tf_rt1523g", "tf_rt1523g", "tf_rt1523g_bwmod"] select _index);
		_unit addHeadgear "H_MilCap_gry";
		_unit addGoggles "G_Goggles_VR";

		comment "Add weapons";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemGPS";
		_unit linkItem "ACE_NVG_Gen4";

	};

};

// For respawn support
if (_unit == player) then {
	// To make sure _unit is only added once and to the player
	if ( (isNil "zamf_var_gear_init") || {!zamf_var_gear_init} ) then {
		zamf_var_gear_init = true;
		// Restore loadout from saved one on respawn, otherwise use base loadout defined in this file.
		// Global variables are used so that the var is in the scope of the respawn event.
		zamf_var_gear_loadout = _loadout;
		player addEventHandler ["respawn", {
			if !(isNil "zamf_var_gear_loadout_saved") then {
				// Restore saved kit
				[_this select 0, zamf_var_gear_loadout_saved, ["ammo"]] call zamf_fnc_setLoadout;
				// Restore earplugs if installed
				if ( !(isNil "zamf_var_gear_loadout_saved_earplugs") and {zamf_var_gear_loadout_saved_earplugs} ) then {
					player setVariable ["ace_hasEarPlugsIn", true, true];
				};
			} else {
				[_this select 0, zamf_var_gear_loadout] spawn zamf_fnc_gear
			};
		}];
	};
};
