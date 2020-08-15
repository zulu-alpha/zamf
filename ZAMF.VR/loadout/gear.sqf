/*
	@file Version: v1
	@file name: gear.sqf
	@file Author: Phoenix of Zulu-Alpha
	@file Description: Loads out a units with gear (only for player units).
	@usage Call example (from unit init):
	@usage nul = [_unit, "west"] execVM "loadout\gear.sqf";
*/

params ["_unit", "_loadout"];

if !(hasInterface) then {
	waitUntil {time > 5};
} else {
	waitUntil {(time > 0) && !(isNull player) && {name player != "Error: No vehicle"}};
};

if !(local _unit) exitWith {};
this = _unit; // Ease compatibility with BIS Arsenal export

// Get the camo type needed
private _index = call zamf_fnc_getClimate;
_index = if (_index == 3) then {1} else {_index};  // No woodland camo, Included now

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
		_unit forceAddUniform (["za_fat2_soldier_arid", "za_fat1_soldier_trans", "za_fat1_soldier_wood", "za_fat1_soldier_snow"] select _index);
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
				for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_tourniquet";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_splint";
		_unit addVest (["za_vst_carrierlite_arid", "za_vst_carrierlite_trans", "za_vst_carrierlite_wood","za_vst_carrierlite_snow"] select _index);
		_unit addHeadgear (["za_hel_enh_arid", "za_hel_enh_trans", "za_hel_enh_wood","za_hel_enh_snow"] select _index);
		_unit addGoggles "G_Combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};


	case "grunt": {

		comment "Add containers";
		_unit forceAddUniform (["za_fat2_soldier_arid", "za_fat1_soldier_trans", "za_fat1_soldier_wood", "za_fat1_soldier_snow"] select _index);
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
				for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_tourniquet";};
		_unit addItemToUniform "ACE_splint";
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["za_vst_carrier_arid", "za_vst_carrier_trans", "za_vst_carrier_wood", "za_vst_carrier_snow" ] select _index);
		_unit addHeadgear (["za_hel_enh_arid", "za_hel_enh_trans", "za_hel_enh_wood","za_hel_enh_snow"] select _index);
		_unit addGoggles "G_Combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};


	case "medic": {

		comment "Add containers";
		_unit forceAddUniform (["za_fat2_soldier_arid", "za_fat1_soldier_trans","za_fat1_soldier_wood", "za_fat1_soldier_snow"] select _index);
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
		_unit addVest (["za_vst_carrier_arid", "za_vst_carrier_trans", "za_vst_carrier_wood", "za_vst_carrier_snow" ] select _index);
		_unit addBackpack (["za_bag_carryallmedic_arid", "za_bag_carryallmedic_trans", "za_bag_carryallmedic_wood", "za_bag_carryallmedic_snow"] select _index);
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_adenosine";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 14 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_splint";};
		_unit addItemToBackpack "ACE_surgicalKit";
		_unit addHeadgear (["za_hel_enh_arid", "za_hel_enh_trans", "za_hel_enh_wood","za_hel_enh_snow"] select _index);
		_unit addGoggles "G_Combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};


	case "heli": {

		comment "Add containers";
		_unit forceAddUniform (["za_fat2_soldier_arid", "za_fat1_soldier_trans", "za_fat1_soldier_wood", "za_fat1_soldier_snow"] select _index);
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_tourniquet";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_splint";
		_unit addVest "V_TacVestIR_blk";
		_unit addHeadgear "za_hel_helihelmet_ghostrider";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};

	case "jet": {

		comment "Add containers";
		_unit forceAddUniform "U_B_PilotCoveralls";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_EarPlugs";
				for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_tourniquet";};
		_unit addItemToUniform "ACE_splint";
		_unit addHeadgear "H_PilotHelmetFighter_B";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};

	case "crew": {

		comment "Add containers";
		_unit forceAddUniform (["za_fat2_soldier_arid", "za_fat1_soldier_trans", "za_fat1_soldier_wood","za_fat1_soldier_snow" ] select _index);
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_EarPlugs";
				for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_tourniquet";};
		_unit addItemToUniform "ACE_splint";
		_unit addVest (["za_vst_carrierlite_arid", "za_vst_carrierlite_trans", "za_vst_carrierlite_wood","za_vst_carrierlite_snow"] select _index); //temp replacement as Modularlite vests are ugly
		//_unit addVest (["za_vst_modularlite_arid", "za_vst_modularlite_trans", "za_vst_modularlite_wood"] select _index);
		_unit addHeadgear "za_hel_crewhelmet_brown";
		_unit addGoggles "G_Balaclava_combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};

	case "candidate": {

		comment "Add containers";
		_unit forceAddUniform "za_fat1_soldier_candidate";
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};

	};

	case "ds": {

		comment "Add containers";
		_unit forceAddUniform "za_fat3_officer_brown";
		_unit addItemToUniform "ACRE_PRC152";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "SmokeShell";
		_unit addBackpack "za_bag_bergen_brown";
		_unit addItemToBackpack "ACRE_PRC343";
		_unit addItemToBackpack "ACE_NVG_Gen4";
		_unit addItemToBackpack "ACE_SpraypaintGreen";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_M84";};
		_unit addItemToBackpack "SmokeShell";
		_unit addHeadgear "za_hel_milcap_brown";
		_unit addGoggles "G_Shades_Black";

		comment "Add weapons";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemAndroid";

	};

	case "ds_grunt": {

		comment "Add containers";
		_unit forceAddUniform "za_fat2_soldier_brown";
		_unit addItemToUniform "ACRE_PRC152";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addVest "za_vst_carrierlite_brown";
		_unit addItemToVest "ACE_SpraypaintGreen";
		for "_i" from 1 to 4 do {_unit addItemToVest "ACE_M84";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack "za_bag_bergen_brown";
		_unit addItemToBackpack "ACRE_PRC343";
		_unit addItemToBackpack "ACE_NVG_Gen4";
		_unit addHeadgear "za_hel_Boonie_brown";
		_unit addGoggles "G_Shades_Black";

		comment "Add weapons";
		_unit addWeapon "arifle_SPAR_01_snd_F";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemAndroid";

	};

	case "zeus": {

		comment "Add containers";
		_unit forceAddUniform "U_Competitor";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addBackpack "za_bag_bergen_brown";
		_unit addItemToBackpack "ACRE_PRC117F";
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
		private _eh = player addEventHandler ["respawn", {
			diag_log "ZAMF gear.sqf: respawn event handler started.";
			if !(isNil "zamf_var_gear_loadout_saved") then {
				// Restore saved kit
				(_this select 0) setUnitLoadout zamf_var_gear_loadout_saved;
				diag_log "ZAMF gear.sqf: restored saved kit!";
				// Restore earplugs if installed
				if ( !(isNil "zamf_var_gear_loadout_saved_earplugs") and {zamf_var_gear_loadout_saved_earplugs} ) then {
					player setVariable ["ace_hasEarPlugsIn", true, true];
				};
			} else {
				[_this select 0, zamf_var_gear_loadout] spawn zamf_fnc_gear;
				diag_log format [
					"ZAMF gear.sqf: no saved loadout, so restoring using gear type: %1.",
					zamf_var_gear_loadout
				];
			};
		}];
		diag_log format ["ZAMF gear.sqf: respawn event handler added, ID: %1.", _eh];
	};
};
