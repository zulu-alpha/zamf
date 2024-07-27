/*
	@file Version: v1
	@file name: crates.sqf
	@file Author: Phoenix of Zulu-Alpha
	@file Description: Loads out a crate with an option to respawn.
	@usage Call example (from unit init):
	@usage nul = [this, "nato_guns"] call compile preprocessfilelinenumbers "loadout\crates.sqf";
	@usage Or: nul = [this, "nato_guns", "refill"] call compile preprocessfilelinenumbers "loadout\crates.sqf";
	@usage Or: nul = [this, "leave_kit"] call compile preprocessfilelinenumbers "loadout\crates.sqf"; to ignore kit.
*/

private ["_crate","_loadout","_opt"];

_crate = _this select 0;
_loadout = _this select 1;
_opt = if (count _this > 2) then {_this select 2} else {"none"};
if (_loadout != "leave_kit") then {
	if (_opt == "refill") then {
		_crate addaction [("<t color=""#FF9900"">" + ("Refill Crate") + "</t>"), "loadout\crates_refill.sqf", _loadout]
	};
};

if !isServer exitWith {};

if (_loadout != "leave_kit") then {
	clearweaponcargoGlobal _crate;
	clearmagazinecargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
};

// Get the camo type needed
private _index = call zamf_fnc_getClimate;


switch (_loadout) do {

	case "leave_kit": {};

	case "equipment": {

		_crate addItemCargoGlobal ["ACE_CableTie", 100];
		_crate addItemCargoGlobal ["ACE_wirecutter", 6];
		_crate addItemCargoGlobal ["ACE_Sandbag_empty", 100];
		_crate addItemCargoGlobal ["ACE_EntrenchingTool", 10];
		_crate addItemCargoGlobal ["ACE_Flashlight_XL50", 43];

		//_crate addItemCargoGlobal ["ACE_NVG_Wide", 37];

		_crate addMagazineCargoGlobal ["ACE_HandFlare_Yellow", 20];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_Green", 20];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_Red", 20];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_White", 20];
		_crate addMagazineCargoGlobal ["Chemlight_blue", 50];
		_crate addMagazineCargoGlobal ["Chemlight_green", 50];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_IR", 50];

		_crate addItemCargoGlobal ["ACE_SpraypaintGreen", 10];
		_crate addItemCargoGlobal ["ACE_SpraypaintRed", 10];
		_crate addItemCargoGlobal ["ACE_SpraypaintBlue", 10];
		_crate addItemCargoGlobal ["ACE_SpraypaintBlack", 10];

		_crate addItemCargoGlobal ["ItemcTabHCam", 43];

		_crate addBackpackCargoGlobal ["ACE_TacticalLadder_Pack", 16];

		_crate addItemCargoGlobal ["ACRE_VHF30108SPIKE", 5];
		_crate addItemCargoGlobal ["AMP_Door_Wedge", 20];

		_crate addItemCargoGlobal ["ACE_WaterBottle", 60];
	};

	case "surveillance": {

		_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F", 1];
		_crate addItemCargoGlobal ["ACE_UAVBattery", 5];
		_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 2];
		_crate addMagazineCargoGlobal ["ACE_HuntIR_M203", 8];

	};

	case "explosives": {

		_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 8];
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 24];
		_crate addMagazineCargoGlobal ["ATMine_Range_Mag", 8];
		_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 16];
		_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 16];
		_crate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", 8];
		_crate addMagazineCargoGlobal ["ACE_FlareTripMine_Mag", 8];
		_crate addItemCargoGlobal ["ACE_Clacker", 4];
		_crate addItemCargoGlobal ["ACE_M26_Clacker", 4];

	};

	case "para": {

		_crate addBackpackCargoGlobal ["B_Parachute", 30];
		_crate addBackpackCargoGlobal ["ACE_NonSteerableParachute", 30];
		_crate addItemCargoGlobal ["ACE_Altimeter", 30];

	};

	case "hq": {

		// Attire
		_crate addBackpackCargoGlobal [(["za_bag_carryall_arid", "za_bag_carryall_trans", "za_bag_carryall_wood", "za_bag_carryall_snow"] select _index), 1];

		// Vision
		_crate addItemCargoGlobal [(["CUP_NVG_GPNVG_tan", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_GPNVG_green"] select _index), 3];
		_crate addItemCargoGlobal ["Binocular", 2];
		_crate addItemCargoGlobal ["ACE_Vector", 1];


		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 3];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 3];
		_crate addItemCargoGlobal ["ACRE_PRC117F", 2];
		_crate addItemCargoGlobal ["ACRE_PRC152", 3];
		_crate addItemCargoGlobal ["ACRE_PRC343", 3];
		_crate addItemCargoGlobal ["ItemcTab", 1];
		_crate addItemCargoGlobal ["ItemAndroid", 2];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 12];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 6];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 6];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 2];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiRed", 24];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiYellow", 10];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 3];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 3];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 6];
		_crate addMagazineCargoGlobal ["ACE_M84", 8];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_black", 3];

		_crate addItemCargoGlobal ["cup_optic_holodesert", 3];
		_crate addItemCargoGlobal ["CUP_optic_Elcan_SpecterDR_RMR", 3];
		_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15_Flashlight_Black_L", 3];
		
		_crate addItemCargoGlobal ["CUP_muzzle_snds_M16_coyote", 3];

		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 20];
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Tracer_Dim", 6];
		_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 6];

		// Launcher


		// Sidearm
		_crate addWeaponCargoGlobal ["CUP_hgun_M17_Black", 3];
		_crate addItemCargoGlobal ["optic_MRD_black", 3];
		_crate addItemCargoGlobal ["CUP_acc_CZ_M3X", 3];
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 12];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 12];
		_crate addItemCargoGlobal ["ALIVE_Tablet", 1];
		_crate addItemCargoGlobal ["ACE_key_west", 1];
		_crate addItemCargoGlobal ["ToolKit", 1];
		_crate addItemCargoGlobal ["MineDetector", 1];
		_crate addItemCargoGlobal ["ACE_DefusalKit", 1];
		_crate addItemCargoGlobal ["ACE_wirecutter", 1];

		// Marking
		_crate addWeaponCargoGlobal ["Laserdesignator", 1];
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];

	};

	case "assault_squad": {

		// Attire

		// Vision
		_crate addItemCargoGlobal [(["CUP_NVG_GPNVG_tan", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_GPNVG_green"] select _index), 9];
		_crate addItemCargoGlobal ["Binocular", 6];
		_crate addItemCargoGlobal ["ACE_Vector", 3];

		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 9];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 9];
		_crate addItemCargoGlobal ["ACRE_PRC117F",1];
		_crate addItemCargoGlobal ["ACRE_PRC152", 3];
		_crate addItemCargoGlobal ["ACRE_PRC343", 9];
		//_crate addItemCargoGlobal ["ItemMicroDAGR", 6];
		_crate addItemCargoGlobal ["ItemAndroid", 3];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 72];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 18];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 18];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 18];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 18];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 18];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 9];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 9];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 28];
		_crate addMagazineCargoGlobal ["ACE_M84", 36];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_black", 5];
		_crate addWeaponCargoGlobal ["CUP_lmg_m249_pip4", 2];
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_m203_black", 2];

		_crate addItemCargoGlobal ["cup_optic_holodesert", 9];
		_crate addItemCargoGlobal ["CUP_optic_Elcan_SpecterDR_RMR", 9];

		_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15_Flashlight_Black_L", 7];
		_crate addItemCargoGlobal ["CUP_acc_LLM_black", 2];
		_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", 2];

		_crate addItemCargoGlobal ["CUP_muzzle_snds_M16_coyote", 7];
		_crate addItemCargoGlobal ["ACE_muzzle_mzls_L", 2];

		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 66];
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Tracer_Dim", 16];
		_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 16];
		_crate addMagazineCargoGlobal ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249_Pouch", 16];
		_crate addItemCargoGlobal ["ACE_SpareBarrel", 2];

		_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 36];
		_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 4];
		_crate addMagazineCargoGlobal ["CUP_1Rnd_StarCluster_White_M203", 12];
		_crate addMagazineCargoGlobal ["ACE_40mm_Flare_ir", 12];
		_crate addMagazineCargoGlobal ["CUP_1Rnd_StarFlare_White_M203", 12];

		// DM
		_crate addWeaponCargoGlobal ["CUP_srifle_M110", 1];
		_crate addMagazineCargoGlobal ["CUP_20Rnd_762x51_B_M110", 10];
		_crate addItemCargoGlobal ["ACE_ATragMX", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 1];
		_crate addItemCargoGlobal ["CUP_muzzle_snds_M110", 1];
		_crate addItemCargoGlobal ["CUP_bipod_Harris_1A2_L_BLK", 1];
		_crate addItemCargoGlobal ["CUP_optic_LeupoldMk4_10x40_LRT_Desert", 1];
		_crate addItemCargoGlobal ["CUP_optic_AN_PVS_10", 1];
		_crate addItemCargoGlobal ["ACE_Tripod", 1];

		// Launcher
		_crate addWeaponCargoGlobal ["tf47_at4_heat", 2];
		_crate addWeaponCargoGlobal ["tf47_m3maaws", 2];
		_crate addItemCargoGlobal ["tf47_optic_m3maaws", 2];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEAT", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEDP", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HE", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_SMOKE", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_ILLUM", 6];

		// Sidearm
		_crate addWeaponCargoGlobal ["CUP_hgun_M17_Black", 9];
		_crate addItemCargoGlobal ["optic_MRD_black", 9];
		_crate addItemCargoGlobal ["CUP_acc_CZ_M3X", 9];
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 36];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 36];
		//_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 1];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];
		_crate addMagazineCargoGlobal ["AMP_Breaching_Charge_Mag", 9];

		// Marking
		_crate addWeaponCargoGlobal ["Laserdesignator", 1];
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];

	};

	case "assault_squad_resupply": {

		// Attire


		// Vision


		// Medical
		_crate addItemCargoGlobal ["ACE_elasticBandage", 45];
		_crate addItemCargoGlobal ["ACE_packingBandage", 45];
		_crate addItemCargoGlobal ["ACE_quikclot", 45];
		_crate addItemCargoGlobal ["ACE_fieldDressing", 45];
		_crate addItemCargoGlobal ["ACE_epinephrine", 9];
		_crate addItemCargoGlobal ["ACE_morphine", 9];
		_crate addItemCargoGlobal ["ACE_tourniquet", 36];
		_crate addItemCargoGlobal ["ACE_splint", 9];

		// Navigation\tracking\communication


		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 72];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 18];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 18];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 18];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 18];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 18];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 9];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 9];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 28];
		_crate addMagazineCargoGlobal ["ACE_M84", 36];

		// Primary Weapon
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 56];
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Tracer_Dim", 14];
		_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 14];
		_crate addMagazineCargoGlobal ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249_Pouch", 16];

		_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 36];
		_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 4];
		_crate addMagazineCargoGlobal ["CUP_1Rnd_StarCluster_White_M203", 12];
		_crate addMagazineCargoGlobal ["ACE_40mm_Flare_ir", 12];
		_crate addMagazineCargoGlobal ["CUP_1Rnd_StarFlare_White_M203", 12];

		// DM
		_crate addMagazineCargoGlobal ["CUP_20Rnd_762x51_B_M110", 10];

		// Launcher
		_crate addWeaponCargoGlobal ["tf47_at4_heat", 2];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEAT", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEDP", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HE", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_SMOKE", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_ILLUM", 6];

		// Sidearm
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 40];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 36];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];
		_crate addMagazineCargoGlobal ["AMP_Breaching_Charge_Mag", 9];

		// Marking
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];

		// Destroy crate
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];

	};

	case "weapons_squad": {

		// Attire

		// Vision
		_crate addItemCargoGlobal [(["CUP_NVG_GPNVG_tan", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_GPNVG_green"] select _index), 10];
		_crate addItemCargoGlobal ["Binocular", 4];
		_crate addItemCargoGlobal ["ACE_Vector", 6];


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 10];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 10];
		_crate addItemCargoGlobal ["ACRE_PRC152", 3];
		_crate addItemCargoGlobal ["ACRE_PRC343", 10];
		_crate addItemCargoGlobal ["ACRE_PRC117F",1];
		//_crate addItemCargoGlobal ["ItemMicroDAGR", 5];
		_crate addItemCargoGlobal ["ItemAndroid", 5];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 80];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 20];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 20];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 20];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 20];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 20];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 10];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 10];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 32];
		_crate addMagazineCargoGlobal ["ACE_M84", 40];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_black", 8];
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_m203_black", 1];

		_crate addItemCargoGlobal ["CUP_optic_Elcan_SpecterDR_RMR", 10];
		_crate addItemCargoGlobal ["cup_optic_holodesert", 10];
		_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15_Flashlight_Black_L", 9];
		_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", 1];

		_crate addItemCargoGlobal ["CUP_muzzle_snds_M16_coyote", 9];
		_crate addItemCargoGlobal ["ACE_muzzle_mzls_B", 2];

		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 60];
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Tracer_Dim", 14];
		_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 14];

		_crate addWeaponCargoGlobal ["CUP_lmg_Mk48", 2];
		_crate addItemCargoGlobal ["CUP_optic_ElcanM145", 2];
		_crate addMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 22];
		_crate addItemCargoGlobal ["ACE_SpareBarrel", 2];

		// DM
		_crate addWeaponCargoGlobal ["CUP_srifle_M110", 1];
		_crate addMagazineCargoGlobal ["CUP_20Rnd_762x51_B_M110", 10];
		_crate addItemCargoGlobal ["ACE_ATragMX", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 1];
		_crate addItemCargoGlobal ["CUP_muzzle_snds_M110", 1];
		_crate addItemCargoGlobal ["CUP_bipod_Harris_1A2_L_BLK", 1];
		_crate addItemCargoGlobal ["CUP_optic_LeupoldMk4_10x40_LRT_Desert", 1];
		_crate addItemCargoGlobal ["CUP_optic_AN_PVS_10", 1];
		_crate addItemCargoGlobal ["ACE_Tripod", 1];

		// Launcher
		_crate addWeaponCargoGlobal ["CUP_launch_FIM92Stinger", 1];
		_crate addMagazineCargoGlobal ["CUP_Stinger_M", 3];
		_crate addWeaponCargoGlobal ["CUP_launch_Javelin", 1];
		_crate addMagazineCargoGlobal ["CUP_Javelin_M", 3];
		_crate addWeaponCargoGlobal ["tf47_m3maaws", 1];
		_crate addItemCargoGlobal ["tf47_optic_m3maaws", 1];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEAT", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEDP", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HE", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_SMOKE", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_ILLUM", 4];

		// Sidearm
		_crate addWeaponCargoGlobal ["CUP_hgun_M17_Black", 10];
		_crate addItemCargoGlobal ["optic_MRD_black", 10];
		_crate addItemCargoGlobal ["CUP_acc_CZ_M3X", 10];
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 40];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 40];
		//_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 1];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];

		// Marking


		// Ammo Bearing
		_crate addBackpackCargoGlobal ["CUP_B_L111A1_Gun_Bag", 2];
		_crate addBackpackCargoGlobal ["CUP_B_L111A1_Tripod_Bag", 2];

	};

	case "weapons_squad_resupply": {

		// Attire


		// Vision


		// Medical
		_crate addItemCargoGlobal ["ACE_elasticBandage", 50];
		_crate addItemCargoGlobal ["ACE_packingBandage", 50];
		_crate addItemCargoGlobal ["ACE_quikclot", 50];
		_crate addItemCargoGlobal ["ACE_fieldDressing", 50];
		_crate addItemCargoGlobal ["ACE_epinephrine", 10];
		_crate addItemCargoGlobal ["ACE_morphine", 10];
		_crate addItemCargoGlobal ["ACE_tourniquet", 40];
		_crate addItemCargoGlobal ["ACE_splint", 10];

		// Navigation\tracking\communication


		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 80];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 20];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 20];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 20];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 20];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 20];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 10];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 10];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 32];
		_crate addMagazineCargoGlobal ["ACE_M84", 40];

		// Primary Weapon
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 60];
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Tracer_Dim", 14];
		_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 14];
		_crate addMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 22];
		// DM
		_crate addMagazineCargoGlobal ["CUP_20Rnd_762x51_B_M110", 10];

		// Launcher
		_crate addMagazineCargoGlobal ["CUP_Stinger_M", 3];
		_crate addMagazineCargoGlobal ["CUP_Javelin_M", 3];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEAT", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEDP", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HE", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_SMOKE", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_ILLUM", 4];

		// Sidearm
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 44];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 40];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];

		// Marking


		// Ammo Bearing
		_crate addBackpackCargoGlobal ["CUP_B_L111A1_Gun_Bag", 2];

		// Destroy crate
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];

	};

	case "fst": {

		// Attire

		// Vision
		_crate addItemCargoGlobal [(["CUP_NVG_GPNVG_tan", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_GPNVG_green"] select _index), 3];
		_crate addItemCargoGlobal ["ACE_Vector", 3];


		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 3];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 3];
		_crate addItemCargoGlobal ["ACRE_PRC117F", 2];
		_crate addItemCargoGlobal ["ACRE_PRC152", 6];
		_crate addItemCargoGlobal ["ACRE_PRC343", 3];
		_crate addItemCargoGlobal ["ItemcTab", 2];
		_crate addItemCargoGlobal ["ItemAndroid", 1];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 24];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 6];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 6];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 6];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 3];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 3];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 6];
		_crate addMagazineCargoGlobal ["ACE_M84", 6];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_m203_black", 1];
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_black", 2];

		_crate addItemCargoGlobal ["CUP_optic_Elcan_SpecterDR_RMR", 3];
		_crate addItemCargoGlobal ["cup_optic_holodesert", 3];

		_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15_Flashlight_Black_L", 2];
		_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", 1];
		
		_crate addItemCargoGlobal ["CUP_muzzle_snds_M16_coyote", 3];

		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 18];
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Tracer_Dim", 6];
		_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 6];

		_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 4];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 4];
		_crate addMagazineCargoGlobal ["CUP_1Rnd_StarCluster_White_M203", 6];
		_crate addMagazineCargoGlobal ["ACE_40mm_Flare_ir", 6];
		_crate addMagazineCargoGlobal ["CUP_1Rnd_StarFlare_White_M203", 6];
		_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 8];

		// DM
		_crate addWeaponCargoGlobal ["CUP_srifle_M110", 1];
		_crate addMagazineCargoGlobal ["CUP_20Rnd_762x51_B_M110", 10];
		_crate addItemCargoGlobal ["ACE_ATragMX", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 1];
		_crate addItemCargoGlobal ["CUP_muzzle_snds_M110", 1];
		_crate addItemCargoGlobal ["CUP_bipod_Harris_1A2_L_BLK", 1];
		_crate addItemCargoGlobal ["CUP_optic_LeupoldMk4_10x40_LRT_Desert", 1];
		_crate addItemCargoGlobal ["CUP_optic_AN_PVS_10", 1];
		_crate addItemCargoGlobal ["ACE_Tripod", 1];

		// Launcher


		// Sidearm
		_crate addWeaponCargoGlobal ["CUP_hgun_M17_Black", 3];
		_crate addItemCargoGlobal ["optic_MRD_black", 3];
		_crate addItemCargoGlobal ["CUP_acc_CZ_M3X", 3];
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 12];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 12];
		_crate addItemCargoGlobal ["B_UavTerminal", 2];
		_crate addItemCargoGlobal ["ALIVE_Tablet", 1];
		//_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 1];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];

		// Marking
		_crate addWeaponCargoGlobal ["Laserdesignator", 1];
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];

		// UAV


		// Mortar
		_crate addBackpackCargoGlobal ["B_Mortar_01_support_F", 1];
		_crate addBackpackCargoGlobal ["B_Mortar_01_weapon_F", 1];
		_crate addItemCargoGlobal ["ACE_RangeTable_82mm", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 1];
		_crate addItemCargoGlobal ["ACE_1Rnd_82mm_Mo_HE", 16];
		_crate addItemCargoGlobal ["ACE_1Rnd_82mm_Mo_Smoke", 16];
		_crate addItemCargoGlobal ["ACE_1Rnd_82mm_Mo_Illum", 16];

	};

	case "medical_team": {

		// Attire


		// Vision
		_crate addItemCargoGlobal [(["CUP_NVG_GPNVG_tan", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_GPNVG_green"] select _index), 5];
		_crate addItemCargoGlobal ["Binocular", 5];

		// Medical
		_crate addItemCargoGlobal ["ACE_personalAidKit", 5];
		_crate addItemCargoGlobal ["ACE_bodyBag", 30];
		_crate addItemCargoGlobal ["ACE_salineIV_250", 20];
		_crate addItemCargoGlobal ["ACE_salineIV_500", 20];

		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 5];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 5];
		_crate addItemCargoGlobal ["ACRE_PRC152", 5];
		_crate addItemCargoGlobal ["ACRE_PRC343", 5];
		_crate addItemCargoGlobal ["ACRE_PRC117F", 1];
		_crate addItemCargoGlobal ["ItemAndroid", 5];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 40];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 20];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 10];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 10];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 10];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 10];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 5];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 5];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 10];
		_crate addMagazineCargoGlobal ["ACE_M84", 10];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_black", 5];

		_crate addItemCargoGlobal ["CUP_optic_Elcan_SpecterDR_RMR", 5];
		_crate addItemCargoGlobal ["cup_optic_holodesert", 5];
		
		_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15_Flashlight_Black_L", 5];
		
		_crate addItemCargoGlobal ["CUP_muzzle_snds_M16_coyote", 5];

		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 25];
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Tracer_Dim", 5];
		_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 5];

		// Sidearm
		_crate addWeaponCargoGlobal ["CUP_hgun_M17_Black", 5];
		_crate addItemCargoGlobal ["optic_MRD_black", 5];
		_crate addItemCargoGlobal ["CUP_acc_CZ_M3X", 5];
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 20];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 20];

	};

	case "medical_team_resupply": {

		// Attire


		// Vision


		// Medical
		_crate addItemCargoGlobal ["ACE_fieldDressing", 100];
		_crate addItemCargoGlobal ["ACE_elasticBandage", 100];
		_crate addItemCargoGlobal ["ACE_packingBandage", 100];
		_crate addItemCargoGlobal ["ACE_quikclot", 100];
		_crate addItemCargoGlobal ["ACE_adenosine", 50];
		_crate addItemCargoGlobal ["ACE_epinephrine", 50];
		_crate addItemCargoGlobal ["ACE_morphine", 50];
		_crate addItemCargoGlobal ["ACE_tourniquet", 50];
		_crate addItemCargoGlobal ["ACE_salineIV_250", 20];
		_crate addItemCargoGlobal ["ACE_salineIV_500", 20];
		_crate addItemCargoGlobal ["ACE_salineIV", 35];
		_crate addItemCargoGlobal ["ACE_splint", 25];
		_crate addItemCargoGlobal ["ACE_personalAidKit", 5];
		_crate addItemCargoGlobal ["ACE_surgicalKit", 5];
		_crate addItemCargoGlobal ["ACE_bodyBag", 30];

		// Navigation\tracking\communication


		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 40];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 20];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 10];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 10];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 10];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 10];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 5];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 5];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 10];
		_crate addMagazineCargoGlobal ["ACE_M84", 10];

		// Primary Weapon
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 25];
		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Tracer_Dim", 5];
		_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 5];

		// Sidearm
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 20];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 20];

		// Destroy crate
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];

	};

	case "heli": {

		// Attire
		_crate addItemCargoGlobal [(["za_hel_Boonie_arid", "za_hel_Boonie_trans", "za_hel_Boonie_wood", "za_hel_Boonie_wood"] select _index), 3];
		_crate addBackpackCargoGlobal ["B_AssaultPack_blk", 3];

		// Vision
		_crate addItemCargoGlobal [(["CUP_NVG_GPNVG_tan", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_GPNVG_green"] select _index), 3];


		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 3];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 3];
		_crate addItemCargoGlobal ["ACRE_PRC152", 3];
		_crate addItemCargoGlobal ["ItemGPS", 3];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 12];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 6];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 6];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 6];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 3];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 3];

		// Grenades


		// Primary Weapon
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_black", 3];

		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 15];


		// Launcher


		// Sidearm


		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_key_west", 3];

		// Marking


		// UAV


		// Mortar


	};

	case "jet": {

		// Attire
		_crate addItemCargoGlobal [(["za_hel_Boonie_arid", "za_hel_Boonie_trans", "za_hel_Boonie_trans", "za_hel_Boonie_trans"] select _index), 1];
		_crate addBackpackCargoGlobal ["B_AssaultPack_sgg", 1];

		// Vision


		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 1];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 1];
		_crate addItemCargoGlobal ["ACRE_PRC152", 1];
		_crate addItemCargoGlobal ["ItemGPS", 1];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 1];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 1];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 1];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 1];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 1];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 1];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 1];

		// Grenades


		// Primary Weapon


		// Launcher


		// Sidearm
		_crate addWeaponCargoGlobal ["CUP_hgun_M17_Black", 1];
		_crate addItemCargoGlobal ["optic_MRD_black", 1];
		_crate addItemCargoGlobal ["CUP_acc_CZ_M3X", 1];
		_crate addMagazineCargoGlobal ["CUP_17Rnd_9x19_M17_Black", 3];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_key_west", 1];

		// Marking


		// UAV


		// Mortar


	};

	case "crew": {

		// Attire

		// Vision
		_crate addItemCargoGlobal [(["CUP_NVG_GPNVG_tan", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_GPNVG_green"] select _index), 3];
		_crate addItemCargoGlobal ["Binocular", 3];

		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 3];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 3];
		_crate addItemCargoGlobal ["ACRE_PRC152", 6];
		_crate addItemCargoGlobal ["ItemGPS", 3];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 12];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 6];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 6];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_UltraHiOrange", 6];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 3];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 3];

		// Grenades


		// Primary Weapon
		_crate addWeaponCargoGlobal ["CUP_arifle_mk18_black", 3];

		_crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_Mk318_mag", 15];


		// Launcher


		// Sidearm


		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_key_west", 3];
		_crate addItemCargoGlobal ["ACE_CableTie", 12];

		// Marking


		// UAV


		// Mortar


	};

	case "ugv": {

		// Controller
		_crate addItemCargoGlobal ["B_UavTerminal", 1];

	};

	case "repair": {

		_crate addItemCargoGlobal ["ToolKit", 2];
		_crate addBackpackCargoGlobal [(["za_bag_carryall_arid", "za_bag_carryall_trans", "za_bag_carryall_wood", "za_bag_carryall_snow"] select _index), 2];

	};

};
