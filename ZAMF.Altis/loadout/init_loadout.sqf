/*
	Author: Phoenix of Zulu-Alpha

	Description:
		A script for executing commands on named units at the start of the mission in place of their editor init fields.

		Various arrays of of string representations of unit variable names grouped by what their common init field command
		would be are exuecuted by the init.sqf process in order to execute those commands at start and for JIP.

		Executed on all clients but not on remote clients on JIP, thus use remoteExec and remoteExecCall for init field behaviour.

	Params:
		None

	Returns:
		(NUL)
*/

// Units
{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        [_obj, true] remoteExec ["hideObjectGlobal", 2];
        _obj allowDamage False;
        nul = [_obj] spawn zamf_fnc_spectateOptions;
        nul = [_obj, "zeus"] spawn zamf_fnc_gear;
    };

} count ["zamf_object_spect_1", "zamf_object_spect_2", "zamf_object_spect_3", "zamf_object_spect_4", "zamf_object_spect_5", "zamf_object_zeus_1", "zamf_object_zeus_2"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "officer", "Dragon'0"] call zamf_fnc_team;
    };

} count ["zamf_object_d0_1", "zamf_object_d0_2"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "grunt", "Dragon'0"] call zamf_fnc_team;
    };

} count ["zamf_object_d0_2", "zamf_object_d0_3", "eng_1", "eng_2"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "grunt", "Dragon'1"] call zamf_fnc_team;
    };

} count ["zamf_object_d1_1", "zamf_object_d1_2", "zamf_object_d1_3", "zamf_object_d1_4", "zamf_object_d1_5", "zamf_object_d1_6", "zamf_object_d1_7", "zamf_object_d1_8", "zamf_object_d1_9", "zamf_object_d1_10", "zamf_object_d1_11"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "grunt", "Dragon'2"] call zamf_fnc_team;
    };

} count ["zamf_object_d2_1", "zamf_object_d2_2", "zamf_object_d2_3", "zamf_object_d2_4", "zamf_object_d2_5", "zamf_object_d2_6", "zamf_object_d2_7", "zamf_object_d2_8", "zamf_object_d2_9", "zamf_object_d2_10", "zamf_object_d2_11"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "grunt", "Dragon'3'1"] call zamf_fnc_team;
    };

} count ["zamf_object_d31_1", "zamf_object_d31_2", "zamf_object_d31_3", "zamf_object_d31_4"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "grunt", "Dragon'3'2"] call zamf_fnc_team;
    };

} count ["zamf_object_d32_1", "zamf_object_d32_2", "zamf_object_d32_3"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "grunt", "Dragon'3'3"] call zamf_fnc_team;
    };

} count ["zamf_object_d33_1", "zamf_object_d33_2", "zamf_object_d33_3"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "grunt", "Dragon'4"] call zamf_fnc_team;
    };

} count ["zamf_object_d4_1", "zamf_object_d4_2", "zamf_object_d4_3", "zamf_object_d4_4"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "heli", "Ghostrider"] call zamf_fnc_team;
    };

} count ["eng_2", "eng_3", "eng_4", "eng_5"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "crew", "Badger'1"] call zamf_fnc_team;
    };

} count ["zamf_object_b1_1", "zamf_object_b1_2", "zamf_object_b1_3", "zamf_object_b1_4"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "crew", "Badger'2"] call zamf_fnc_team;
    };

} count ["zamf_object_b2_1", "zamf_object_b2_2", "zamf_object_b2_3", "zamf_object_b2_4"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "jet", "Reaper"] call zamf_fnc_team;
    };

} count ["eng_5", "eng_6"];


// Crates
{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "hq", "Dragon'0", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_d0", "zamf_object_crate_d0_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "squad", "Dragon'1", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_d1", "zamf_object_crate_d1_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "squad", "Dragon'2", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_d2", "zamf_object_crate_d2_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "mg_team", "Dragon'3'1", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_d31", "zamf_object_crate_d31_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "atgm_team", "Dragon'3'2", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_d32", "zamf_object_crate_d32_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "aa_team", "Dragon'3'3", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_d33", "zamf_object_crate_d33_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "fst", "Dragon'4", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_d4", "zamf_object_crate_d4_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "heli", "Ghostrider", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_g", "zamf_object_crate_g_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "crew", "Badger'1", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_b1", "zamf_object_crate_b1_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "crew", "Badger'2", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_b2", "zamf_object_crate_b2_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "jet", "Reaper", true] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_r", "zamf_object_crate_r_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "equipment", "Equipment", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_equip", "zamf_object_crate_equip_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "med", "Medical", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_med", "zamf_object_crate_med_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "explosives", "Explosives", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_expl", "zamf_object_crate_expl_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "para", "Paradrop", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_para", "zamf_object_crate_para_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = ["AmmoboxInit",[_obj,true]] spawn BIS_fnc_arsenal;
        [_obj, true, "Arsenal"] call ZAM_fnc_showNames_addDiscoverable;
    };

} count ["zamf_object_crate_arsenal", "zamf_object_crate_arsenal_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "ugv"] spawn zamf_fnc_crates;
    };

} count ["zamf_object_veh_1", "zamf_object_veh_2"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "squad_resupply", "Squad Resupply", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_res_squad_1", "zamf_object_crate_res_squad_2", "zamf_object_crate_res_squad_3"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "mg_team_resupply", "MG Resupply", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_res_mg", "zamf_object_crate_res_mg_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "aa_team_resupply", "AA Resupply", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_res_aa", "zamf_object_crate_res_aa_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "atgm_team_resupply", "ATGM Resupply", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_res_atgm", "zamf_object_crate_res_atgm_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "explosives", "Explosives Resupply", false] call zamf_fnc_crate;
    };

} count ["zamf_object_crate_res_expl", "zamf_object_crate_res_expl_1"];


{

    if !(isNil _x) then {
        _obj = missionNamespace getVariable _x;
        nul = [_obj, "repair", "", false] call zamf_fnc_crate;
    };

} count ["repair_1", "repair_2"];