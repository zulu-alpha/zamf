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
	_crate addaction [("<t color=""#FF9900"">" + ("Refill Crate") + "</t>"), "loadout\crates_refill.sqf",_loadout]
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

// backpacks
_backpack_lr = ["tf_rt1523g", "tf_rt1523g", "tf_rt1523g_bwmod"] select _index;
_backpack_lr_big = ["tf_rt1523g_big", "tf_rt1523g_big", "tf_rt1523g_big_bwmod"] select _index;

_backpack_2c = ["b_bergen_kampat_arid_2IC", "b_bergen_kampat_transitional_2IC", "b_bergen_kampat_woodland_2IC"] select _index;
_backpack_pl = ["b_bergen_kampat_arid_PL", "b_bergen_kampat_transitional_PL", "b_bergen_kampat_woodland_PL"] select _index;
_backpack_md = ["b_bergen_kampat_arid_MEDIC", "b_bergen_kampat_transitional_MEDIC", "b_bergen_kampat_woodland_MEDIC"] select _index;


switch (_loadout) do {

	case "limited_squad": {

		// MG Acc
		_crate addItemCargoGlobal ["ACE_SpareBarrel", 2];

		// R
		_crate addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag', 48];
		_crate addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red', 19];

		// Optics R
		{_crate addItemCargoGlobal [_x, 2]} count ["rhsusf_acc_compm4","optic_Hamr"];

		// AR
		_crate addMagazineCargoGlobal ['rhsusf_100Rnd_556x45_soft_pouch', 22];

		// 7.62 LMG
		_crate addWeaponCargoGlobal ["rhs_weap_m240B", 1];
		_crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 22];

		// Optics LMG\AR
		{_crate addItemCargoGlobal [_x, 1]} count ["rhsusf_acc_ELCAN"];

		// Launcher ammo
		_crate addMagazineCargoGlobal ['3Rnd_HE_Grenade_shell', 20];
		{_crate addMagazineCargoGlobal [_x, 6]} count ['1Rnd_Smoke_Grenade_shell','1Rnd_SmokeRed_Grenade_shell'];

		// RPG
		_crate addWeaponCargoGlobal ["rhs_weap_M136", 4];
		_crate addMagazineCargoGlobal ["rhs_m136_mag", 4];

		// ATGM
		_crate addWeaponCargoGlobal ["rhs_weap_fgm148", 1];
		_crate addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 4];

		// MANPAD
		_crate addWeaponCargoGlobal ["rhs_weap_fim92", 1];
		_crate addMagazineCargoGlobal ["rhs_fim92_mag", 4];

		// Pistol
		_crate addMagazineCargoGlobal ['16Rnd_9x21_Mag', 20];


		// Grenades
		_crate addMagazineCargoGlobal ['Chemlight_blue', 28];
		_crate addMagazineCargoGlobal ['Chemlight_green', 5];
		_crate addMagazineCargoGlobal ['SmokeShell', 26];
		_crate addMagazineCargoGlobal ['SmokeShellGreen', 32];
		_crate addMagazineCargoGlobal ['SmokeShellOrange', 20];
		_crate addMagazineCargoGlobal ['HandGrenade', 20];
		_crate addMagazineCargoGlobal ['rhs_mag_mk84', 36];
		_crate addMagazineCargoGlobal ["ACE_IR_Strobe_Item", 10];

		_crate addMagazineCargoGlobal ["ACE_HandFlare_Yellow", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_Green", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_Red", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_White", 4];


		// Explosives
		_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 8];
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 16];
		_crate addMagazineCargoGlobal ["ATMine_Range_Mag", 8];
		_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 8];
		_crate addItemCargoGlobal ["ACE_Clacker", 2];
		_crate addItemCargoGlobal ["ACE_M26_Clacker", 2];
		_crate addItemCargoGlobal ["ACE_DefusalKit", 2];
		//_crate addItemCargoGlobal ["ACE_DeadManSwitch", 2];
		//_crate addItemCargoGlobal ["ACE_Cellphone", 2];


		// Equipment
		_crate addWeaponCargoGlobal ["Laserdesignator", 1];
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 2];
		_crate addItemCargoGlobal ["ACE_CableTie", 40];
		_crate addItemCargoGlobal ["MineDetector", 2];
		_crate addItemCargoGlobal ["ToolKit", 2];
		_crate addItemCargoGlobal ["ACE_wirecutter", 2];
		_crate addItemCargoGlobal ["ACE_microDAGR", 8];
		_crate addItemCargoGlobal ["ACE_key_lockpick", 2];
		_crate addItemCargoGlobal ["ACE_ATragMX", 2];
		_crate addItemCargoGlobal ["ACE_key_west", 1];


		// BackPacks
		_crate addBackpackCargoGlobal [_backpack_lr, 2];
		_crate addBackpackCargoGlobal [_backpack_lr_big, 2];


		// DM
		_crate addWeaponCargoGlobal ["rhs_weap_m14ebrri", 1];
		_crate addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m993_Mag", 12];
		_crate addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 4];

		// DMR Optics
		_crate addItemCargoGlobal ["optic_AMS", 1];

		// DMR Bipod
		_crate addItemCargoGlobal ["rhsusf_acc_harris_bipod", 1];

	};

	case "limited_squad_resupply": {

		// Medical
		_crate addItemCargoGlobal ["ACE_fieldDressing", 120];
		_crate addItemCargoGlobal ["ACE_morphine", 40];
		_crate addItemCargoGlobal ["ACE_epinephrine", 20];
		_crate addItemCargoGlobal ["ACE_bloodIV", 6];
		_crate addItemCargoGlobal ["ACE_EarPlugs", 10];

		// MG Acc
		_crate addItemCargoGlobal ["ACE_SpareBarrel", 1];

		// R
		_crate addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag', 48];
		_crate addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red', 19];

		// AR
		_crate addMagazineCargoGlobal ['rhsusf_100Rnd_556x45_soft_pouch', 22];

		// 7.62 LMG
		_crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 22];

		// Launcher ammo
		_crate addMagazineCargoGlobal ['3Rnd_HE_Grenade_shell', 20];
		{_crate addMagazineCargoGlobal [_x, 6]} count ['1Rnd_Smoke_Grenade_shell','1Rnd_SmokeRed_Grenade_shell'];

		// RPG
		_crate addWeaponCargoGlobal ["rhs_weap_M136", 4];
		_crate addMagazineCargoGlobal ["rhs_m136_mag", 4];

		// ATGM
		_crate addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 4];

		// MANPAD
		_crate addMagazineCargoGlobal ["rhs_fim92_mag", 4];

		// Pistol
		_crate addMagazineCargoGlobal ['16Rnd_9x21_Mag', 20];


		// Grenades
		_crate addMagazineCargoGlobal ['Chemlight_blue', 28];
		_crate addMagazineCargoGlobal ['Chemlight_green', 5];
		_crate addMagazineCargoGlobal ['SmokeShell', 26];
		_crate addMagazineCargoGlobal ['SmokeShellGreen', 32];
		_crate addMagazineCargoGlobal ['SmokeShellOrange', 20];
		_crate addMagazineCargoGlobal ['HandGrenade', 20];
		_crate addMagazineCargoGlobal ['rhs_mag_mk84', 36];
		_crate addMagazineCargoGlobal ["ACE_IR_Strobe_Item", 10];

		_crate addMagazineCargoGlobal ["ACE_HandFlare_Yellow", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_Green", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_Red", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_White", 4];


		// Explosives
		_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 8];
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 16];
		_crate addMagazineCargoGlobal ["ATMine_Range_Mag", 8];
		_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 8];
		_crate addItemCargoGlobal ["ACE_Clacker", 2];
		_crate addItemCargoGlobal ["ACE_M26_Clacker", 2];
		_crate addItemCargoGlobal ["ACE_DefusalKit", 2];
		//_crate addItemCargoGlobal ["ACE_DeadManSwitch", 2];
		//_crate addItemCargoGlobal ["ACE_Cellphone", 2];


		// Equipment
		_crate addMagazineCargoGlobal ["Laserbatteries", 2];
		_crate addItemCargoGlobal ["ACE_CableTie", 40];
		_crate addItemCargoGlobal ["ToolKit", 2];

		// DM
		_crate addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m993_Mag", 12];
		_crate addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 4];

	};


	case "limited_fst": {

		// MG Acc
		_crate addItemCargoGlobal ["ACE_SpareBarrel", 1];

		// R
		_crate addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag', 24];
		_crate addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red', 10];

		// Optics R
		{_crate addItemCargoGlobal [_x, 2]} count ["rhsusf_acc_compm4"];

		// 7.62 LMG
		_crate addWeaponCargoGlobal ["rhs_weap_m240B", 1];
		_crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 12];

		// Optics LMG\AR
		{_crate addItemCargoGlobal [_x, 1]} count ["rhsusf_acc_ELCAN"];

		// RPG
		_crate addWeaponCargoGlobal ["rhs_weap_M136", 2];
		_crate addMagazineCargoGlobal ["rhs_m136_mag", 2];

		// ATGM
		_crate addWeaponCargoGlobal ["rhs_weap_fgm148", 1];
		_crate addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 4];

		// MANPAD
		_crate addWeaponCargoGlobal ["rhs_weap_fim92", 1];
		_crate addMagazineCargoGlobal ["rhs_fim92_mag", 4];

		// Pistol
		_crate addMagazineCargoGlobal ['16Rnd_9x21_Mag', 10];


		// Grenades
		_crate addMagazineCargoGlobal ['Chemlight_blue', 14];
		_crate addMagazineCargoGlobal ['Chemlight_green', 5];
		_crate addMagazineCargoGlobal ['SmokeShell', 13];
		_crate addMagazineCargoGlobal ['SmokeShellGreen', 16];
		_crate addMagazineCargoGlobal ['SmokeShellOrange', 10];
		_crate addMagazineCargoGlobal ['HandGrenade', 10];
		_crate addMagazineCargoGlobal ['rhs_mag_mk84', 18];
		_crate addMagazineCargoGlobal ["ACE_IR_Strobe_Item", 5];

		_crate addMagazineCargoGlobal ["ACE_HandFlare_Yellow", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_Green", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_Red", 4];
		_crate addMagazineCargoGlobal ["ACE_HandFlare_White", 4];


		// Explosives
		_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 4];
		_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 8];
		_crate addMagazineCargoGlobal ["ATMine_Range_Mag", 4];
		_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 4];
		_crate addItemCargoGlobal ["ACE_Clacker", 1];
		_crate addItemCargoGlobal ["ACE_M26_Clacker", 1];
		_crate addItemCargoGlobal ["ACE_DefusalKit", 1];
		//_crate addItemCargoGlobal ["ACE_DeadManSwitch", 1];
		//_crate addItemCargoGlobal ["ACE_Cellphone", 1];


		// Equipment
		_crate addWeaponCargoGlobal ["Laserdesignator", 1];
		_crate addMagazineCargoGlobal ["Laserbatteries", 1];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", 1];
		_crate addItemCargoGlobal ["ACE_CableTie", 20];
		_crate addItemCargoGlobal ["MineDetector", 1];
		_crate addItemCargoGlobal ["ToolKit", 1];
		_crate addItemCargoGlobal ["Alive_tablet", 1];
		_crate addItemCargoGlobal ["b_UAVTerminal", 1];
		_crate addItemCargoGlobal ["ACE_UAVBattery", 2];
		_crate addItemCargoGlobal ["ACE_wirecutter", 1];
		_crate addItemCargoGlobal ["ACE_microDAGR", 2];
		_crate addItemCargoGlobal ["ACE_key_lockpick", 2];
		_crate addItemCargoGlobal ["ACE_ATragMX", 2];
		_crate addItemCargoGlobal ["ACE_key_west", 1];

		_crate addItemCargoGlobal ["ACE_RangeTable_82mm", 2];


		// BackPacks
		_crate addBackpackCargoGlobal [_backpack_lr, 3];
		_crate addBackpackCargoGlobal [_backpack_lr_big, 1];


		// DM
		_crate addWeaponCargoGlobal ["rhs_weap_m14ebrri", 1];
		_crate addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m993_Mag", 12];
		_crate addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 4];

		// DMR Optics
		_crate addItemCargoGlobal ["optic_LRPS", 1];

		// DMR Bipod
		_crate addItemCargoGlobal ["rhsusf_acc_harris_bipod", 1];

	};

	case "med": {

		_crate addItemCargoGlobal ["ACE_fieldDressing", 500];
		_crate addItemCargoGlobal ["ACE_morphine", 60];
		_crate addItemCargoGlobal ["ACE_epinephrine", 50];
		_crate addItemCargoGlobal ["ACE_bloodIV", 30];
		_crate addItemCargoGlobal ["ACE_bodyBag", 30];
		_crate addItemCargoGlobal ["ACE_EarPlugs", 30];

	};

	case "items": {

		// Equipment
		_crate addWeaponCargoGlobal ["Binocular", _numItem];
		_crate addWeaponCargoGlobal ["ACE_Vector", _numItem];
		_crate addWeaponCargoGlobal ["Laserdesignator", _numItem];
		_crate addMagazineCargoGlobal ["Laserbatteries", _numAmmo];
		_crate addItemCargoGlobal ["FirstAidKit", _numItem];
		_crate addItemCargoGlobal ["ItemCompass", _numItem];
		_crate addItemCargoGlobal ["ItemGPS", _numItem];
		_crate addItemCargoGlobal ["ItemMap", _numItem];
		_crate addItemCargoGlobal ["ItemRadio", _numItem];
		_crate addItemCargoGlobal ["tf_microdagr", _numItem];
		_crate addItemCargoGlobal ["ItemWatch", _numItem];
		_crate addItemCargoGlobal ["Medikit", _numItem];


		_crate addWeaponCargoGlobal ["Laserdesignator", _numItem];
		_crate addMagazineCargoGlobal ["Laserbatteries", _numItem];
		_crate addItemCargoGlobal ["ACE_Kestrel4500", _numItem];
		_crate addItemCargoGlobal ["ACE_CableTie", _numItem];
		_crate addItemCargoGlobal ["MineDetector", _numItem];
		_crate addItemCargoGlobal ["ToolKit", _numItem];
		_crate addItemCargoGlobal ["ACE_wirecutter", _numItem];
		_crate addItemCargoGlobal ["ACE_microDAGR", _numItem];
		_crate addItemCargoGlobal ["ACE_key_lockpick", _numItem];
		_crate addItemCargoGlobal ["ACE_ATragMX", _numItem];
		_crate addItemCargoGlobal ["ACE_key_west", _numItem];

		_crate addItemCargoGlobal ["ACE_RangeTable_82mm", _numItem];


		_crate addItemCargoGlobal ["ACE_NVG_Gen1", _numItem];
		_crate addItemCargoGlobal ["ACE_NVG_Gen2", _numItem];
		_crate addItemCargoGlobal ["NVGoggles", _numItem];
		_crate addItemCargoGlobal ["ACE_NVG_Gen4", _numItem];
		_crate addItemCargoGlobal ["ACE_NVG_Wide", _numItem];

		_crate addItemCargoGlobal ["ToolKit", _numItem];
		_crate addItemCargoGlobal ["ACE_DefusalKit", _numItem];
		_crate addItemCargoGlobal ["b_UAVTerminal", _numItem];

		// Medical



		_crate addBackpackCargoGlobal ["tf_rt1523g", _numItem];
		_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F", _numWeapon];
		_crate addBackpackCargoGlobal ["B_rhsusf_B_BACKPACK", _numWeapon];
		_crate addItemCargoGlobal ["ACE_UAVBattery", _numItem];
		_crate addItemCargoGlobal ["ACE_SpareBarrel", _numItem];

		_crate addItemCargoGlobal ["ItemcTab", _numItem];
		_crate addItemCargoGlobal ["ItemAndroid", _numItem];
		_crate addItemCargoGlobal ["ItemcTabHCam", _numItem];
		_crate addItemCargoGlobal ["ItemMicroDAGR", _numItem];
		_crate addItemCargoGlobal ["ACE_microDAGR", _numItem];

		_crate addItemCargoGlobal ["Alive_tablet", _numItem];

	};

	case "ugv": {

		// UAV
		_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F", 1];

		// RQ-11
		_crate addBackpackCargoGlobal ["B_rhsusf_B_BACKPACK", 1];

		// Backpacks
		_crate addBackpackCargoGlobal ["B_HMG_01_weapon_F", 1];
		_crate addBackpackCargoGlobal ["B_HMG_01_support_F", 1];

		// Mortar
		_crate addBackpackCargoGlobal ["B_Mortar_01_support_F", 1];
		_crate addBackpackCargoGlobal ["B_Mortar_01_weapon_F", 1];
		_crate addItemCargoGlobal ["ACE_RangeTable_82mm", 1];

	};

	case "para": {

		_crate addBackpackCargoGlobal ["B_Parachute", 30];
		_crate addBackpackCargoGlobal ["ACE_NonSteerableParachute", 30];
		_crate addItemCargoGlobal ["ACE_Altimeter", 30];

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
		this addItemToBackpack "ACE_optic_Hamr_2D";
		this addItemToBackpack "ACE_optic_Hamr_PIP";
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