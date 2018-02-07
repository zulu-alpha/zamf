/*
	@file Version: v1
	@file name: crates.sqf
	@file Author: Phoenix of Zulu-Alpha
	@file Description: Loads out a crate with an option to respawn.
	@usage Call example (from unit init):
	@usage nul = [this, "nato_guns"] call compile preprocessfilelinenumbers "loadout\crates.sqf";
	@usage Or: nul = [this, "nato_guns", "refill"] call compile preprocessfilelinenumbers "loadout\crates.sqf";
*/

private ["_crate","_loadout","_opt","_numWeapon","_numAmmo","_numMod","_numItem","_numBag","_cloth"];

_crate = _this select 0;
_loadout = _this select 1;
_opt = if (count _this > 2) then {_this select 2} else {"none"};

if (_opt == "refill") then {
	_crate addaction [("<t color=""#FF9900"">" + ("Refill Crate") + "</t>"), "loadout\crates_refill.sqf", _loadout]
};

if !isServer exitWith {};

clearweaponcargoGlobal _crate;
clearmagazinecargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

_numWeapon = 5;
_numAmmo = 15;
_numMod = 5;
_numItem = 20;
_numBag = 1;
_cloth = 5;

// Get the camo type needed
_index = call zamf_fnc_getClimate;
// Correct for arid camo being used for transitional terrain and there being no woodland camo.
if (_index > 0) then {_index = _index - 1};


switch (_loadout) do {

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

	};

	case "suppressors": {

		_crate addItemCargoGlobal ["SMA_supp1BB_556", 40];
		_crate addItemCargoGlobal ["sma_gemtech_one_blk", 20];

	};
	
	case "surveillance": {

		_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F", 1];
		_crate addItemCargoGlobal ["ACE_UAVBattery", 5];
		
	};

	case "med": { // To be removed

		_crate addItemCargoGlobal ["ACE_fieldDressing", 500];
		_crate addItemCargoGlobal ["ACE_morphine", 100];
		_crate addItemCargoGlobal ["ACE_epinephrine", 50];
		_crate addItemCargoGlobal ["ACE_bloodIV", 30];
		_crate addItemCargoGlobal ["ACE_bodyBag", 30];
		_crate addItemCargoGlobal ["ACE_EarPlugs", 30];

	};

	case "explosives": {

		_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 8];
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 24];
		_crate addMagazineCargoGlobal ["ATMine_Range_Mag", 8];
		_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 8];
		_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 8];
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
		_crate addBackpackCargoGlobal [(["za_bag_bergen_arid", "za_bag_bergen_trans"] select _index), 2];

		// Vision
		_crate addItemCargoGlobal ["ACE_NVG_Gen4", 2];
		_crate addItemCargoGlobal ["Binocular", 1];
		_crate addItemCargoGlobal ["ACE_Vector", 1];


		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 2];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 2];
		_crate addItemCargoGlobal ["ACRE_PRC117F",1];
		_crate addItemCargoGlobal ["ACRE_PRC152", 2];
		_crate addItemCargoGlobal ["ItemcTab", 1];
		_crate addItemCargoGlobal ["ItemAndroid", 1];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 4];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 4];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 4];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 2];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 4];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 4];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiRed", 24];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiYellow", 8];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 2];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 2];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 4];
		_crate addMagazineCargoGlobal ["ACE_M84", 4];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["SMA_M4afg_SM", 2];

		_crate addItemCargoGlobal ["sma_spitfire_01_black", 2];
		_crate addItemCargoGlobal ["sma_spitfire_03_rds_black", 2];
		_crate addItemCargoGlobal ["SMA_SFPEQ_M4TOP_BLK", 2];
		
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 12];
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1_Tracer", 4];

		// Launcher


		// Sidearm
		_crate addWeaponCargoGlobal ["hgun_P07_F", 2];
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 8];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 8];
		_crate addItemCargoGlobal ["ALIVE_Tablet", 1];
		_crate addItemCargoGlobal ["ACE_key_west", 1];
		_crate addItemCargoGlobal ["ToolKit", 1];
		_crate addWeaponCargoGlobal ["ACE_VMM3", 1];
		_crate addItemCargoGlobal ["ACE_DefusalKit", 1];
		_crate addItemCargoGlobal ["ACE_wirecutter", 1];

		// Marking
		_crate addWeaponCargoGlobal ["Laserdesignator", 1];
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];

	};

	case "assault_squad": {

		// Attire
		_crate addBackpackCargoGlobal [(["za_bag_bergen_arid", "za_bag_bergen_trans"] select _index), 9];

		// Vision
		_crate addItemCargoGlobal ["ACE_NVG_Gen4", 9];
		_crate addItemCargoGlobal ["Binocular", 6];
		_crate addItemCargoGlobal ["ACE_Vector", 3];

		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 9];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 9];
		_crate addItemCargoGlobal ["ACRE_PRC117F",1];
		_crate addItemCargoGlobal ["ACRE_PRC152", 11];
		//_crate addItemCargoGlobal ["ItemMicroDAGR", 6];
		_crate addItemCargoGlobal ["ItemAndroid", 3];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 72];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 18];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 18];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 18];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 18];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 18];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 9];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 9];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 28];
		_crate addMagazineCargoGlobal ["ACE_M84", 14];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["SMA_M4afg_SM", 5];
		_crate addWeaponCargoGlobal ["LMG_03_F", 2];
		_crate addWeaponCargoGlobal ["SMA_M4_GL_SM", 2];

		_crate addItemCargoGlobal ["sma_spitfire_01_black", 9];
		_crate addItemCargoGlobal ["sma_spitfire_03_rds_black", 9];

		_crate addItemCargoGlobal ["SMA_SFPEQ_M4TOP_BLK", 7];
		_crate addItemCargoGlobal ["SMA_ANPEQ15_BLK", 2];

		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 66];
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1_Tracer", 16];
		_crate addMagazineCargoGlobal ["200Rnd_556x45_Box_Red_F", 16];

		_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 36];
		_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 4];
		_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", 12];

		_crate addWeaponCargoGlobal ["SMA_Mk17_16_black", 1];
		_crate addItemCargoGlobal ["SMA_ELCAN_SPECTER_RDS", 1];
		_crate addItemCargoGlobal ["CUP_optic_AN_PVS_10", 1];
		_crate addItemCargoGlobal ["SMA_ANPEQ15_BLK", 1];
		_crate addItemCargoGlobal ["bipod_01_F_blk", 1];
		_crate addItemCargoGlobal ["SMA_supp_762", 1];
		_crate addMagazineCargoGlobal ["SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range", 10];
		_crate addItemCargoGlobal ["ACE_Tripod", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 1];
		_crate addItemCargoGlobal ["ACE_RangeCard", 1];

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
		_crate addWeaponCargoGlobal ["hgun_P07_F", 9];
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 36];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 36];
		//_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 1];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];

		// Marking
		_crate addWeaponCargoGlobal ["Laserdesignator", 1];
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];

	};

	case "assault_squad_resupply": {

		// Attire


		// Vision


		// Medical
		_crate addItemCargoGlobal ["ACE_elasticBandage", 45];
		_crate addItemCargoGlobal ["ACE_packingBandage", 90];
		_crate addItemCargoGlobal ["ACE_quikclot", 45];
		_crate addItemCargoGlobal ["ACE_epinephrine", 9];
		_crate addItemCargoGlobal ["ACE_morphine", 9];
		_crate addItemCargoGlobal ["ACE_tourniquet", 9];

		// Navigation\tracking\communication


		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 72];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 18];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 18];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 18];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 18];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 18];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 9];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 9];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 28];
		_crate addMagazineCargoGlobal ["ACE_M84", 14];

		// Primary Weapon
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 56];
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1_Tracer", 14];
		_crate addMagazineCargoGlobal ["200Rnd_556x45_Box_Red_F", 12];

		_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 36];
		_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 4];
		_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", 12];

		_crate addMagazineCargoGlobal ["SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range", 10];

		// Launcher
		_crate addWeaponCargoGlobal ["tf47_at4_heat", 2];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEAT", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEDP", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HE", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_SMOKE", 6];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_ILLUM", 6];

		// Sidearm
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 40];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 36];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];

		// Marking
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];

		// Destroy crate
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];

	};

	case "weapons_squad": {

		// Attire
		_crate addBackpackCargoGlobal [(["za_bag_bergen_arid", "za_bag_bergen_trans"] select _index), 9];
		_crate addBackpackCargoGlobal [(["za_bag_carryall_arid", "za_bag_carryall_trans"] select _index), 1];

		// Vision
		_crate addItemCargoGlobal ["ACE_NVG_Gen4", 10];
		_crate addItemCargoGlobal ["Binocular", 4];
		_crate addItemCargoGlobal ["ACE_Vector", 6];

		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 10];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 10];
		_crate addItemCargoGlobal ["ACRE_PRC152", 12];
		_crate addItemCargoGlobal ["ACRE_PRC117F",1];
		//_crate addItemCargoGlobal ["ItemMicroDAGR", 5];
		_crate addItemCargoGlobal ["ItemAndroid", 5];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 80];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 20];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 20];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 20];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 20];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 20];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 10];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 10];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 32];
		_crate addMagazineCargoGlobal ["ACE_M84", 20];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["SMA_M4afg_SM", 8];
		_crate addWeaponCargoGlobal ["SMA_M4_GL_SM", 1];

		_crate addItemCargoGlobal ["sma_spitfire_03_rds_black", 10];
		_crate addItemCargoGlobal ["sma_spitfire_01_black", 10];
		_crate addItemCargoGlobal ["SMA_SFPEQ_M4TOP_BLK", 9];
		_crate addItemCargoGlobal ["acc_flashlight", 9];
		_crate addItemCargoGlobal ["ACE_acc_pointer_green", 9];

		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 60];
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1_Tracer", 14];

		_crate addWeaponCargoGlobal ["CUP_lmg_M240", 2];
		_crate addItemCargoGlobal ["SMA_ELCAN_SPECTER_RDS", 2];
		_crate addMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 22];
		_crate addItemCargoGlobal ["ACE_SpareBarrel", 2];

		_crate addWeaponCargoGlobal ["SMA_Mk17_16_black", 1];
		_crate addItemCargoGlobal ["SMA_ELCAN_SPECTER_RDS", 1];
		_crate addItemCargoGlobal ["CUP_optic_AN_PVS_10", 1];
		_crate addItemCargoGlobal ["SMA_ANPEQ15_BLK", 1];
		_crate addItemCargoGlobal ["bipod_01_F_blk", 1];
		_crate addItemCargoGlobal ["SMA_supp_762", 1];
		_crate addMagazineCargoGlobal ["SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range", 10];
		_crate addItemCargoGlobal ["ACE_Tripod", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 1];
		_crate addItemCargoGlobal ["ACE_RangeCard", 1];

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
		_crate addWeaponCargoGlobal ["hgun_P07_F", 10];
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 40];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 40];
		//_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 1];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];

		// Marking


		// Ammo Bearing
		_crate addBackpackCargoGlobal ["CUP_B_M2_Gun_Bag", 2];
		_crate addBackpackCargoGlobal ["CUP_B_M2_MiniTripod_Bag", 2];

	};

	case "weapons_squad_resupply": {

		// Attire


		// Vision


		// Medical
		_crate addItemCargoGlobal ["ACE_elasticBandage", 50];
		_crate addItemCargoGlobal ["ACE_packingBandage", 100];
		_crate addItemCargoGlobal ["ACE_quikclot", 50];
		_crate addItemCargoGlobal ["ACE_epinephrine", 10];
		_crate addItemCargoGlobal ["ACE_morphine", 10];
		_crate addItemCargoGlobal ["ACE_tourniquet", 10];

		// Navigation\tracking\communication


		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 80];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 20];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 20];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 20];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 20];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 20];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 10];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 10];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 32];
		_crate addMagazineCargoGlobal ["ACE_M84", 20];

		// Primary Weapon
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 60];
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1_Tracer", 14];
		_crate addMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 22];
		_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag", 8];

		// Launcher
		_crate addMagazineCargoGlobal ["CUP_Stinger_M", 3];
		_crate addMagazineCargoGlobal ["CUP_Javelin_M", 3];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEAT", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HEDP", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_HE", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_SMOKE", 4];
		_crate addMagazineCargoGlobal ["tf47_m3maaws_ILLUM", 4];

		// Sidearm
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 44];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 40];
		//_crate addItemCargoGlobal ["ACE_HuntIR_M203", 2];

		// Marking


		// Ammo Bearing
		_crate addBackpackCargoGlobal ["CUP_B_M2_Gun_Bag", 2];

		// Destroy crate
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];

	};

	case "fst": {

		// Attire
		_crate addBackpackCargoGlobal [(["za_bag_bergen_arid", "za_bag_bergen_trans"] select _index), 2];


		// Vision
		_crate addItemCargoGlobal ["ACE_NVG_Gen4", 3];
		_crate addItemCargoGlobal ["ACE_Vector", 3];


		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 3];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 3];
		_crate addItemCargoGlobal ["ACRE_PRC117F",2];
		_crate addItemCargoGlobal ["ACRE_PRC152", 5];
		_crate addItemCargoGlobal ["ItemcTab", 2];
		_crate addItemCargoGlobal ["ItemAndroid", 1];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 24];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 6];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 6];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 6];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 3];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 3];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 6];
		_crate addMagazineCargoGlobal ["ACE_M84", 6];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["SMA_M4_GL_SM", 1];
		_crate addWeaponCargoGlobal ["SMA_M4afg_SM", 2];

		_crate addItemCargoGlobal ["sma_spitfire_03_rds_black", 3];
		_crate addItemCargoGlobal ["sma_spitfire_01_black", 3];

		_crate addItemCargoGlobal ["SMA_SFPEQ_M4TOP_BLK", 3];
		_crate addItemCargoGlobal ["acc_flashlight", 3];
		_crate addItemCargoGlobal ["ACE_acc_pointer_green", 3];

		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 18];
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1_Tracer", 6];

		_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 4];
		_crate addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 4];
		_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", 6];
		_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 8];
		_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", 12];

		_crate addWeaponCargoGlobal ["srifle_EBR_F", 1];
		_crate addItemCargoGlobal ["optic_SOS", 1];
		_crate addItemCargoGlobal ["optic_NVS", 1];
		//_crate addItemCargoGlobal ["CUP_acc_ANPEQ_15", 1];
		_crate addItemCargoGlobal ["bipod_01_F_blk", 1];
		_crate addItemCargoGlobal ["muzzle_snds_B", 1];
		_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag", 8];
		_crate addItemCargoGlobal ["ACE_Tripod", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 1];
		_crate addItemCargoGlobal ["ACE_RangeCard", 1];

		// Launcher


		// Sidearm
		_crate addWeaponCargoGlobal ["hgun_P07_F", 3];
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 12];

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

	};

	case "medical_team": {

		// Attire


		// Vision
		_crate addItemCargoGlobal ["ACE_NVG_Gen4", 5];
		_crate addItemCargoGlobal ["Binocular", 5];

		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 5];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 5];
		_crate addItemCargoGlobal ["ACRE_PRC152", 10];
		_crate addItemCargoGlobal ["ACRE_PRC117F",1];
		_crate addItemCargoGlobal ["ItemAndroid", 5];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 40];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 20];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 10];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 10];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 10];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 10];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 5];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 5];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 10];
		_crate addMagazineCargoGlobal ["ACE_M84", 10];

		// Primary Weapon
		_crate addWeaponCargoGlobal ["SMA_M4afg_SM", 5];

		_crate addItemCargoGlobal ["sma_spitfire_03_rds_black", 5];
		_crate addItemCargoGlobal ["sma_spitfire_01_black", 5];
		
		_crate addItemCargoGlobal ["SMA_SFPEQ_M4TOP_BLK", 5];
		_crate addItemCargoGlobal ["acc_flashlight", 5];
		_crate addItemCargoGlobal ["ACE_acc_pointer_green", 5];

		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 25];
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1_Tracer", 5];

		// Sidearm
		_crate addWeaponCargoGlobal ["hgun_P07_F", 5];
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 20];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 20];

	};

	case "medical_team_resupply": {

		// Attire


		// Vision


		// Medical
		_crate addItemCargoGlobal ["ACE_fieldDressing", 50];
		_crate addItemCargoGlobal ["ACE_elasticBandage", 100];
		_crate addItemCargoGlobal ["ACE_packingBandage", 100];
		_crate addItemCargoGlobal ["ACE_quikclot", 50];
		_crate addItemCargoGlobal ["ACE_atropine", 75];
		_crate addItemCargoGlobal ["ACE_epinephrine", 75];
		_crate addItemCargoGlobal ["ACE_morphine", 75];
		_crate addItemCargoGlobal ["ACE_tourniquet", 25];
		_crate addItemCargoGlobal ["ACE_salineIV_500", 25];
		_crate addItemCargoGlobal ["ACE_personalAidKit", 25];

		// Navigation\tracking\communication


		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 40];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 20];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 10];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 10];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 10];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 10];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 5];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 5];

		// Grenades
		_crate addMagazineCargoGlobal ["HandGrenade", 10];
		_crate addMagazineCargoGlobal ["ACE_M84", 10];

		// Primary Weapon
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 25];
		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1_Tracer", 5];

		// Sidearm
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 20];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_CableTie", 20];

		// Destroy crate
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];

	};

	case "heli": {

		// Attire
		_crate addItemCargoGlobal [(["za_hel_Boonie_arid", "za_hel_Boonie_trans"] select _index), 3];
		_crate addBackpackCargoGlobal ["B_AssaultPack_blk", 3];

		// Vision
		_crate addItemCargoGlobal ["ACE_NVG_Gen4", 3];


		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 3];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 3];
		_crate addItemCargoGlobal ["ACRE_PRC152", 3];
		_crate addItemCargoGlobal ["ACRE_PRC117F", 3];
		_crate addItemCargoGlobal ["ItemGPS", 3];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 12];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 6];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 6];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 6];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 3];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 3];

		// Grenades


		// Primary Weapon
		_crate addWeaponCargoGlobal ["SMA_M4afg_SM", 3];

		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 15];


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
		_crate addItemCargoGlobal [(["za_hel_Boonie_arid", "za_hel_Boonie_trans"] select _index), 1];
		_crate addBackpackCargoGlobal ["B_AssaultPack_sgg", 1];

		// Vision
		//_crate addItemCargoGlobal ["ACE_NVG_Gen4", 1];


		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 1];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 1];
		_crate addItemCargoGlobal ["ACRE_PRC152", 2];
		_crate addItemCargoGlobal ["ACRE_PRC117F", 1];
		_crate addItemCargoGlobal ["ItemGPS", 1];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 1];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 1];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 1];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 1];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 1];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 1];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 1];

		// Grenades


		// Primary Weapon


		// Launcher


		// Sidearm
		_crate addWeaponCargoGlobal ["hgun_P07_F", 1];
		_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 3];

		// Misc Equipment
		_crate addItemCargoGlobal ["ACE_key_west", 1];

		// Marking


		// UAV


		// Mortar


	};

	case "crew": {

		// Attire
		_crate addBackpackCargoGlobal [(["B_AssaultPack_ocamo", "B_AssaultPack_rgr"] select _index), 3];

		// Vision
		_crate addItemCargoGlobal ["ACE_NVG_Gen4", 3];
		_crate addItemCargoGlobal ["Binocular", 3];

		// Medical


		// Navigation\tracking\communication
		_crate addItemCargoGlobal ["ACE_MapTools", 3];
		_crate addItemCargoGlobal ["ACE_Flashlight_MX991", 3];
		_crate addItemCargoGlobal ["ACRE_PRC152", 6];
		_crate addItemCargoGlobal ["ACRE_PRC117F", 3];
		_crate addItemCargoGlobal ["ItemGPS", 3];

		// Signalling
		_crate addMagazineCargoGlobal ["SmokeShell", 12];
		_crate addMagazineCargoGlobal ["SmokeShellGreen", 6];
		_crate addMagazineCargoGlobal ["SmokeShellBlue", 6];
		_crate addMagazineCargoGlobal ["SmokeShellRed", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 6];
		_crate addMagazineCargoGlobal ["ACE_Chemlight_HiOrange", 6];
		_crate addItemCargoGlobal ["ACE_IR_Strobe_Item", 3];
		_crate addMagazineCargoGlobal ["B_IR_Grenade", 3];

		// Grenades


		// Primary Weapon
		_crate addWeaponCargoGlobal ["SMA_M4afg_SM", 3];

		_crate addMagazineCargoGlobal ["SMA_30Rnd_556x45_M855A1", 15];


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
		_crate addBackpackCargoGlobal [["za_bag_carryall_arid", "za_bag_carryall_trans"] select _index, 2];

	};

};


/* ACE
		this addItemToBackpack "ACE_RangeTable_82mm";
		this addItemToBackpack "ACE_UAVBattery";

		this addItemToBackpack "ACE_key_lockpick";
		this addItemToBackpack "ACE_SpareBarrel";
		this addItemToBackpack "ACE_wirecutter";
		this addItemToBackpack "ACE_microDAGR";
		this addItemToBackpack "ACE_MapTools";
		this addItemToBackpack "ACE_ATragMX";
		this addItemToBackpack "ACE_IR_Strobe_Item";
		this addItemToBackpack "ACE_CableTie";
		this addItemToBackpack "ACE_EarPlugs";
		this addItemToBackpack "ACE_Kestrel4500";
		this addWeapon "ACE_Vector";
		this addItemToBackpack "ACE_Tripod";
		this addItemToBackpack "ACE_SpottingScope";
		this addItemToBackpack "ACE_RangeCard";
		this addItemToBackpack "ACE_Sandbag_empty";
		this addBackpack "ACE_TacticalLadder_Pack";

		this addMagazineToBackpack "ACE_HuntIR_M203";
		this addItemToBackpack "ACE_HuntIR_monitor";


		this addItemToBackpack "ACE_Flashlight_MX991";
		this addItemToBackpack "ACE_Flashlight_XL50";
		this addItemToBackpack "ACE_Flashlight_KSF1";

		this linkItem "ACE_NVG_Gen1";
		this linkItem "ACE_NVG_Gen2";
		this linkItem "NVGoggles";
		this linkItem "ACE_NVG_Gen4";
		this linkItem "ACE_NVG_Wide";

		this addItemToBackpack "ACE_Clacker";
		this addItemToBackpack "ACE_M26_Clacker";
		this addItemToBackpack "ACE_DefusalKit";
		this addItemToBackpack "ACE_DeadManSwitch";
		this addItemToBackpack "ACE_Cellphone";


		this addItemToBackpack "ACE_packingBandage";
		this addItemToBackpack "ACE_elasticBandage";
		this addItemToBackpack "ACE_tourniquet";
		this addItemToBackpack "ACE_atropine";
		this addItemToBackpack "ACE_plasmaIV";
		this addItemToBackpack "ACE_plasmaIV_500";
		this addItemToBackpack "ACE_plasmaIV_250";
		this addItemToBackpack "ACE_salineIV";
		this addItemToBackpack "ACE_salineIV_500";
		this addItemToBackpack "ACE_salineIV_250";
		this addItemToBackpack "ACE_quikclot";
		this addItemToBackpack "ACE_personalAidKit";
		this addItemToBackpack "ACE_surgicalKit";


		this addItemToBackpack "ACE_fieldDressing";
		this addItemToBackpack "ACE_morphine";
		this addItemToBackpack "ACE_epinephrine";
		this addItemToBackpack "ACE_bloodIV";
		this addItemToBackpack "ACE_bodyBag";



		this addItemToBackpack "ACE_M84";
		this addItemToBackpack "ACE_HandFlare_Yellow";
		this addItemToBackpack "ACE_HandFlare_Green";
		this addItemToBackpack "ACE_HandFlare_Red";
		this addItemToBackpack "ACE_HandFlare_White";


		this addItemToBackpack "ACE_key_west";


		this addItemToBackpack "ACE_acc_pointer_green";
		this addItemToBackpack "ACE_muzzle_mzls_H";
		this addItemToBackpack "ACE_muzzle_mzls_B";
		this addItemToBackpack "ACE_muzzle_mzls_L";
		this addItemToBackpack "ACE_muzzle_mzls_smg_01";
		this addItemToBackpack "ACE_muzzle_mzls_smg_02";
		this addItemToBackpack "ACE_muzzle_mzls_338";
		this addItemToBackpack "ACE_muzzle_mzls_93mmg";
		this addItemToBackpack "ACE_optic_ERCO_blk_F_2D";
		this addItemToBackpack "ACE_optic_ERCO_blk_F_PIP";
		this addItemToBackpack "ACE_optic_Arco_2D";
		this addItemToBackpack "ACE_optic_Arco_PIP";
		this addItemToBackpack "ACE_optic_MRCO_2D";
		this addItemToBackpack "ACE_optic_SOS_2D";
		this addItemToBackpack "ACE_optic_SOS_PIP";
		this addItemToBackpack "ACE_optic_LRPS_2D";
		this addItemToBackpack "ACE_optic_LRPS_PIP";


		this addBackpack "ACE_NonSteerableParachute";
		this linkItem "ACE_Altimeter";
		

*/
