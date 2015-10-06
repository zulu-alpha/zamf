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
	waitUntil {(time > 0) && !(isNull player) && (name player != "Error: No vehicle")};
};

_unit = _this select 0;
if !(local _unit) exitWith {};
this = _unit; // Ease compatibility with BIS Arsenal export
_loadout = _this select 1;

// Get the camo type needed
_index = call zamf_fnc_getClimate;

//// Select the uniform and items used
_nv = "ACE_NVG_Gen4"; // nv
//["ACE_NVG_Gen1", "ACE_NVG_Gen2", "NVGoggles", "ACE_NVG_Gen4", "ACE_NVG_Wide"]
_radio_squad = "tf_anprc152";
_map_light = "ACE_Flashlight_MX991";

// head
_head_co = ["h_milcap_kampat_arid", "h_milcap_kampat_transitional", "h_milcap_kampat_transitional"] select _index;
_head_sl = ["h_canvashelmet_kampat_arid", "h_canvashelmet_kampat_transitional", "h_canvashelmet_kampat_transitional"] select _index;
_head_eng = _head_sl;
_head_md = _head_sl;
_head_r = _head_sl;
_head_ftl = _head_sl;
_head_g = _head_sl;
_head_ar = _head_sl;
_head_fst_a = _head_r;
_head_fst_w = _head_r;
_head_fst_u = _head_r;
_head_heli = ["H_PilotHelmetHeli_B", "H_PilotHelmetHeli_O", "H_PilotHelmetHeli_O"] select _index;
_head_heli_2 = ["h_booniehat_kampat_arid", "h_booniehat_kampat_transitional", "h_booniehat_kampat_transitional"] select _index;
_head_crew = "h_crewhelmet_kampat";
_head_ds = _head_co;
_head_ct = "";
_head_tm_at_tl = _head_sl;
_head_tm_at_at = _head_sl;
_head_tm_aa_tl = _head_sl;
_head_tm_aa_aa = _head_sl;
_head_tm_hmg_tl = _head_sl;
_head_tm_hmg_g = _head_sl;
_head_tm_hmg_ab = _head_sl;
_head_tm_gmg_tl = _head_sl;
_head_tm_gmg_g = _head_sl;
_head_tm_gmg_ab = _head_sl;

// uniform
_uniform_co = ["u_uniform3_kampat_arid", "u_uniform3_kampat_transitional", "u_uniform3_kampat_transitional"] select _index;
_uniform_sl = ["u_uniform2_kampat_arid", "u_uniform2_kampat_transitional", "u_uniform1_kampat_transitional"] select _index;
_uniform_eng = _uniform_sl;
_uniform_md = _uniform_sl;
_uniform_r = _uniform_sl;
_uniform_ftl = _uniform_sl;
_uniform_g = _uniform_sl;
_uniform_ar = _uniform_sl;
_uniform_fst_a = _uniform_sl;
_uniform_fst_w = _uniform_sl;
_uniform_fst_u = _uniform_sl;
_uniform_heli = _uniform_sl;
_uniform_crew = ["u_uniform1_kampat_arid", "u_uniform1_kampat_transitional", "u_uniform1_kampat_transitional"] select _index;
_uniform_ds = _uniform_co;
_uniform_ct = ["u_uniform1_kampat_arid", "u_uniform1_kampat_transitional", "u_uniform1_kampat_transitional"] select _index;
_uniform_tm_at_tl = _uniform_sl;
_uniform_tm_at_at = _uniform_sl;
_uniform_tm_aa_tl = _uniform_sl;
_uniform_tm_aa_aa = _uniform_sl;
_uniform_tm_hmg_tl = _uniform_sl;
_uniform_tm_hmg_g = _uniform_sl;
_uniform_tm_hmg_ab = _uniform_sl;
_uniform_tm_gmg_tl = _uniform_sl;
_uniform_tm_gmg_g = _uniform_sl;
_uniform_tm_gmg_ab = _uniform_sl;

// vest
_vest_co = ["v_platecarrier1_kampat_arid", "v_platecarrier1_kampat_transitional", "v_platecarrier1_kampat_transitional"] select _index;
_vest_sl = ["v_platecarrier2_kampat_arid", "v_platecarrier2_kampat_transitional", "v_platecarrier2_kampat_transitional"] select _index;
_vest_eng = _vest_sl;
_vest_md = _vest_sl;
_vest_r = _vest_sl;
_vest_ftl = _vest_sl;
_vest_g = _vest_sl;
_vest_ar = _vest_sl;
_vest_fst_a = _vest_sl;
_vest_fst_w = _vest_sl;
_vest_fst_u = _vest_sl;
_vest_heli = ["V_TacVestIR_blk", "V_TacVestIR_blk", "V_TacVestIR_blk"] select _index;
_vest_crew = ["v_tacticalvest_kampat_arid", "v_tacticalvest_kampat_transitional", "v_tacticalvest_kampat_transitional"] select _index;
_vest_ds = "";
_vest_ct = "";
_vest_tm_at_tl = _vest_sl;
_vest_tm_at_at = _vest_sl;
_vest_tm_aa_tl = _vest_sl;
_vest_tm_aa_aa = _vest_sl;
_vest_tm_hmg_tl = _vest_sl;
_vest_tm_hmg_g = _vest_sl;
_vest_tm_hmg_ab = _vest_sl;
_vest_tm_gmg_tl = _vest_sl;
_vest_tm_gmg_g = _vest_sl;
_vest_tm_gmg_ab = _vest_sl;

// backpack
_backpack_co = ["tf_rt1523g", "tf_rt1523g", "tf_rt1523g_bwmod"] select _index;
_backpack_sl = ["tf_rt1523g_big", "tf_rt1523g_big", "tf_rt1523g_big_bwmod"] select _index;
_backpack_md = ["b_bergen_kampat_arid_MEDIC", "b_bergen_kampat_transitional_MEDIC", "b_bergen_kampat_transitional_MEDIC"] select _index;
_backpack_r = ["b_bergen_kampat_arid", "b_bergen_kampat_transitional", "b_bergen_kampat_transitional"] select _index;
_backpack_ftl = ["b_bergen_kampat_arid", "b_bergen_kampat_transitional", "b_bergen_kampat_transitional"] select _index;
_backpack_g = ["b_bergen_kampat_arid", "b_bergen_kampat_transitional", "b_bergen_kampat_transitional"] select _index;
_backpack_eng = _backpack_g;
_backpack_ar = ["b_bergen_kampat_arid", "b_bergen_kampat_transitional", "b_bergen_kampat_transitional"] select _index;
_backpack_fst_a = _backpack_sl;
_backpack_fst_w = _backpack_sl;
_backpack_fst_u = "B_rhsusf_B_BACKPACK";
_backpack_heli = "";
_backpack_ds = "";
_backpack_ct = "";
_backpack_tm_at_tl = ["b_carryall_kampat_arid", "b_carryall_kampat_arid", "b_carryall_kampat_transitional"] select _index;
_backpack_tm_at_at = _backpack_g;
_backpack_tm_aa_tl = _backpack_tm_at_tl;
_backpack_tm_aa_aa = _backpack_g;
_backpack_tm_hmg_tl = "RHS_M2_Gun_Bag";
_backpack_tm_hmg_g = "RHS_M2_MiniTripod_Bag";
_backpack_tm_hmg_ab = "RHS_M2_Gun_Bag";
_backpack_tm_gmg_tl = "RHS_Mk19_Gun_Bag";
_backpack_tm_gmg_g = "RHS_Mk19_Tripod_Bag";
_backpack_tm_gmg_ab = "RHS_Mk19_Gun_Bag";


removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;



switch (_loadout) do {

	case "co": {

		comment "Add containers";
		_unit forceAddUniform _uniform_co;
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ALIVE_Tablet";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "rhs_mag_mk84";
		_unit addItemToUniform "SmokeShellOrange";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_co;
		for "_i" from 1 to 6 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToVest "ACE_CableTie";};
		_unit addItemToVest "ACE_Kestrel4500";
		_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
		_unit addItemToVest "SmokeShellOrange";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "rhs_mag_mk84";
		_unit addItemToVest "Chemlight_green";
		_unit addBackpack _backpack_co;
		for "_i" from 1 to 6 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_epinephrine";};
		_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addHeadgear _head_co;
		_unit addGoggles "G_Lowprofile";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemcTab";
		_unit linkItem _nv;

	};

	case "eng": {

		comment "Add containers";
		_unit forceAddUniform _uniform_eng;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_eng;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		_unit addItemToVest "ACE_key_west";
		_unit addBackpack _backpack_eng;
		_unit addItemToBackpack "ToolKit";
		_unit addItemToBackpack "MineDetector";
		_unit addItemToBackpack "ACE_wirecutter";
		_unit addItemToBackpack "ACE_DefusalKit";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "Chemlight_red";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "Chemlight_yellow";};
		_unit addHeadgear _head_eng;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

	};

	case "sl": {

		comment "Add containers";
		_unit forceAddUniform _uniform_sl;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_sl;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_mk84";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_sl;
		_unit addItemToBackpack "ACE_HuntIR_monitor";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_HuntIR_M203";};
		_unit addItemToBackpack "ACE_MapTools";
		_unit addHeadgear _head_sl;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_m320";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemcTab";
		_unit linkItem _nv;

	};

	case "medic": {

		comment "Add containers";
		_unit forceAddUniform _uniform_md;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_md;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_md;
		for "_i" from 1 to 16 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 12 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 24 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
		_unit addHeadgear _head_md;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;


	};

	case "r": {

		comment "Add containers";
		_unit forceAddUniform _uniform_r;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_r;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_r;
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
		_unit addHeadgear _head_r;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

	};

	case "ftl": {

		comment "Add containers";
		_unit forceAddUniform _uniform_ftl;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_ftl;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_mk84";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_ftl;
		_unit addItemToBackpack "ACE_MapTools";
		_unit addHeadgear _head_ftl;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemAndroid";
		_unit linkItem _nv;

	};

	case "g": {

		comment "Add containers";
		_unit forceAddUniform _uniform_g;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {_unit addItemToUniform "1Rnd_SmokeRed_Grenade_shell";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_g;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
		_unit addItemToVest "SmokeShellOrange";
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
		_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
		for "_i" from 1 to 9 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_g;
		_unit addItemToBackpack "ACE_CableTie";
		for "_i" from 1 to 9 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
		_unit addItemToBackpack "Chemlight_green";
		_unit addItemToBackpack "SmokeShellGreen";
		_unit addItemToBackpack "SmokeShellOrange";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_mk84";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addHeadgear _head_g;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_m320";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

	};

	case "ar": {

		comment "Add containers";
		_unit forceAddUniform _uniform_ar;
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform "HandGrenade";
		_unit addItemToUniform "SmokeShellGreen";
		_unit addItemToUniform "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_blue";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_ar;
		_unit addItemToVest "HandGrenade";
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		_unit addItemToVest "SmokeShellGreen";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_ar;
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
		_unit addHeadgear _head_ar;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m249_pip_S";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
		_unit addWeapon "hgun_P07_F";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

	};

	case "fst_a": {

		comment "Add containers";
		_unit forceAddUniform _uniform_fst_a;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_fst_a;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "ALIVE_Tablet";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_mk84";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_fst_a;
		_unit addItemToBackpack "B_UavTerminal";
		_unit addHeadgear _head_fst_a;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m16a4_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemcTab";
		_unit linkItem _nv;

	};

	case "fst_w": {

		comment "Add containers";
		_unit forceAddUniform _uniform_fst_w;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_fst_w;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "ALIVE_Tablet";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_mk84";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_fst_w;
		_unit addHeadgear _head_fst_w;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m16a4_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemcTab";
		_unit linkItem _nv;

	};

	case "fst_u": {

		comment "Add containers";
		_unit forceAddUniform _uniform_fst_w;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_fst_w;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_mk84";};
		_unit addBackpack _backpack_fst_u;
		_unit addHeadgear _head_fst_u;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m16a4_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemAndroid";
		_unit linkItem _nv;

	};

	case "tm_at_tl": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_at_tl;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_at_tl;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_mk84";};
		_unit addBackpack _backpack_tm_at_tl;
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_fgm148_magazine_AT";};
		_unit addHeadgear _head_tm_at_tl;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemAndroid";
		_unit linkItem _nv;

	};

	case "tm_at_at": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_at_at;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_at_at;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_tm_at_at;
		_unit addItemToBackpack "rhs_fgm148_magazine_AT";
		_unit addHeadgear _head_tm_at_at;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "rhs_weap_fgm148";
		_unit addItemToBackpack "rhs_fgm148_magazine_AT";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

	};

	case "tm_aa_tl": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_aa_tl;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_aa_tl;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_mk84";};
		_unit addBackpack _backpack_tm_aa_tl;
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_fim92_mag";};
		_unit addHeadgear _head_tm_aa_tl;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemAndroid";
		_unit linkItem _nv;

	};

	case "tm_aa_aa": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_aa_aa;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_aa_aa;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_tm_aa_aa;
		_unit addItemToBackpack "rhs_fim92_mag";
		_unit addItemToBackpack "rhs_fim92_mag";
		_unit addHeadgear _head_tm_aa_aa;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "rhs_weap_fim92";
		_unit addItemToBackpack "rhs_fim92_mag";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

	};

	case "tm_hmg_tl": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_hmg_tl;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_hmg_tl;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_mk84";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_tm_hmg_tl;
		_unit addHeadgear _head_tm_hmg_tl;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemAndroid";
		_unit linkItem _nv;

		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_Sandbag_empty";};
		for "_i" from 1 to 1 do {_unit addItemToVest "ACE_Sandbag_empty";};

	};

	case "tm_hmg_g": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_hmg_g;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_hmg_g;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_tm_hmg_g;
		_unit addHeadgear _head_tm_hmg_g;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_Sandbag_empty";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_Sandbag_empty";};

	};

	case "tm_hmg_ab": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_hmg_ab;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "ACE_RangeCard";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_20Rnd_762x51_m993_Mag";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_hmg_ab;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m993_Mag";};
		_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";
		_unit addBackpack _backpack_tm_hmg_ab;
		_unit addHeadgear _head_tm_hmg_ab;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "optic_SOS";
		_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_Sandbag_empty";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_Sandbag_empty";};

	};

	case "tm_gmg_tl": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_gmg_tl;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_gmg_tl;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "ACE_CableTie";
		_unit addItemToVest "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_mk84";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_tm_gmg_tl;
		_unit addHeadgear _head_tm_gmg_tl;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemAndroid";
		_unit linkItem _nv;

		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_Sandbag_empty";};
		for "_i" from 1 to 1 do {_unit addItemToVest "ACE_Sandbag_empty";};

	};

	case "tm_gmg_g": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_gmg_g;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_gmg_g;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addBackpack _backpack_tm_gmg_g;
		_unit addHeadgear _head_tm_gmg_g;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_EOTECH";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_Sandbag_empty";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_Sandbag_empty";};

	};

	case "tm_gmg_ab": {

		comment "Add containers";
		_unit forceAddUniform _uniform_tm_gmg_ab;
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_CableTie";};
		_unit addItemToUniform "ACE_RangeCard";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_mk84";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_20Rnd_762x51_m993_Mag";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_tm_gmg_ab;
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m993_Mag";};
		_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";
		_unit addBackpack _backpack_tm_gmg_ab;
		_unit addHeadgear _head_tm_gmg_ab;
		_unit addGoggles "G_Combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "optic_SOS";
		_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemMicroDAGR";
		_unit linkItem _nv;

		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_Sandbag_empty";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_Sandbag_empty";};

	};

	case "heli": {

		comment "Add containers";
		_unit forceAddUniform _uniform_heli;
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform _head_heli_2;
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "SmokeShellGreen";
		_unit addItemToUniform "SmokeShell";
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToUniform _map_light;
		_unit addVest _vest_heli;
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 3 do {_unit addItemToVest "ACE_fieldDressing";};
		_unit addItemToVest "ACE_IR_Strobe_Item";
		_unit addItemToVest "ACE_MapTools";
		_unit addItemToVest "6Rnd_GreenSignal_F";
		_unit addItemToVest "6Rnd_RedSignal_F";
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		_unit addItemToVest "SmokeShellGreen";
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToVest "ACE_key_west";
		_unit addHeadgear _head_heli;

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "hgun_Pistol_Signal_F";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemGPS";
		_unit linkItem _nv;

	};

	case "crew": {

		comment "Add containers";
		_unit forceAddUniform _uniform_crew;
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform _map_light;
		_unit addVest _vest_crew;
		_unit addItemToVest "16Rnd_9x21_Mag";
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		_unit addItemToVest "SmokeShellGreen";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		_unit addItemToVest "ACE_key_west";
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_blue";};
		_unit addItemToVest "Chemlight_green";
		_unit addHeadgear _head_crew;
		_unit addGoggles "G_Balaclava_combat";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemGPS";
		_unit linkItem _nv;

	};

	case "candidate": {

		comment "Add containers";
		_unit forceAddUniform _uniform_ct;
		_unit addItemToUniform "ACE_EarPlugs";

	};

	case "ds": {

		comment "Add containers";
		_unit forceAddUniform _uniform_ds;
		_unit addItemToUniform _nv;
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_M84";};
		_unit addItemToUniform _map_light;
		_unit addHeadgear _head_ds;
		_unit addGoggles "G_Shades_Black";

		comment "Add weapons";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem _radio_squad;
		_unit linkItem "ItemcTab";

	};

	case "zeus": {

		comment "Add containers";
		_unit forceAddUniform "U_Competitor";
		_unit addItemToUniform _map_light;
		_unit addBackpack _backpack_co;
		_unit addHeadgear "H_MilCap_gry";
		_unit addGoggles "G_Goggles_VR";

		comment "Add weapons";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemGPS";
		_unit linkItem _nv;

	};

};

// For respawn support
if (_unit == player) then {
	// To make sure _unit is only added once and to the player
	if ( (isNil "zamf_var_gear_init") || {!zamf_var_gear_init} ) then {
		zamf_var_gear_init = true;
		zamf_var_gear_loadout = _loadout; // Done so that the var is in the scope of the respawn event
		player addEventHandler ["respawn", {[_this select 0, zamf_var_gear_loadout] spawn zamf_fnc_gear}];
	};
};
