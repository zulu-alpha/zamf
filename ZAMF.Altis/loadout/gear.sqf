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
		_unit forceAddUniform (["za_fatigues2_arid", "za_fatigues1_trans", "za_fatigues2_trans"] select _index);
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["za_vst_carrierlite_arid", "za_vst_carrierlite_trans", "za_vst_carrierlite_trans"] select _index);
		_unit addHeadgear (["za_hel_canvas_arid", "za_hel_canvas_trans", "za_hel_canvas_trans"] select _index);
		_unit addGoggles "G_Combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};


	case "grunt": {

		comment "Add containers";
		_unit forceAddUniform (["za_fatigues2_arid", "za_fatigues1_trans", "za_fatigues2_trans"] select _index);
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["za_vst_carrier_arid", "za_vst_carrier_trans", "za_vst_carrier_trans"] select _index);
		_unit addHeadgear (["za_hel_canvas_arid", "za_hel_canvas_trans", "za_hel_canvas_trans"] select _index);
		_unit addGoggles "G_Combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};


	case "medic": {

		comment "Add containers";
		_unit forceAddUniform (["za_fatigues2_arid", "za_fatigues1_trans", "za_fatigues2_trans"] select _index);
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
		_unit addVest (["za_vst_carrier_arid", "za_vst_carrier_trans", "za_vst_carrier_trans"] select _index);
		_unit addBackpack (["za_bag_carryall_arid", "za_bag_carryall_trans", "za_bag_carryall_trans"] select _index);
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_atropine";};
		for "_i" from 1 to 14 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 14 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_personalAidKit";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_packingBandage";};
		_unit addHeadgear (["za_hel_canvas_arid", "za_hel_canvas_trans", "za_hel_canvas_trans"] select _index);
		_unit addGoggles "G_Combat";

		comment "Add weapons";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";

	};


	case "heli": {

		comment "Add containers";
		_unit forceAddUniform (["za_fatigues2_arid", "za_fatigues1_trans", "za_fatigues2_trans"] select _index);
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["V_TacVestIR_blk", "V_TacVestIR_blk", "V_TacVestIR_blk"] select _index);
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
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
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
		_unit forceAddUniform (["za_fatigues2_arid", "za_fatigues1_trans", "za_fatigues2_trans"] select _index);
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addVest (["za_vst_modularlite_arid", "za_vst_modularlite_tran", "za_vst_modularlite_tran"] select _index);
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
		_unit forceAddUniform "za_fatigues1_brown";
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};

	};

	case "ds": {

		comment "Add containers";
		_unit forceAddUniform "za_officerfatigues_brown";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "ACE_epinephrine";
		_unit addItemToUniform "SmokeShell";
		_unit addBackpack "tf_rt1523g_bwmod";
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
		_unit linkItem "tf_anprc152_4";
		_unit linkItem "ItemAndroid";


	};

	case "ds_grunt": {

		comment "Add containers";
		_unit forceAddUniform "za_fatigues2_brown";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
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
		_unit addBackpack "tf_rt1523g_bwmod";
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
		_unit linkItem "tf_anprc152_4";
		_unit linkItem "ItemAndroid";

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
