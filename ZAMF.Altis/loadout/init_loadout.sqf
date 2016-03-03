/*
	Author: Phoenix of Zulu-Alpha

	Description:
		A script for executing commands on untis based on their Role Description fields.

		Executed on all clients but not on remote clients on JIP, thus use remoteExec and remoteExecCall for init field behaviour.

	Params:
		None

	Returns:
		(NUL)
*/


{

    // Units

    if (["Spectator", roleDescription _x] call BIS_fnc_inString) then {
        [_x, true] remoteExec ["hideObjectGlobal", 2];
        _x allowDamage False;
        nul = [_x] spawn zamf_fnc_spectateOptions;
        nul = [_x, "zeus"] spawn zamf_fnc_gear;
    };


    if (["Zeus", roleDescription _x] call BIS_fnc_inString) then {
        [_x, true] remoteExec ["hideObjectGlobal", 2];
        _x allowDamage False;
        nul = [_x] spawn zamf_fnc_spectateOptions;
        nul = [_x, "zeus"] spawn zamf_fnc_gear;
    };


    if (["[CO]", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "officer", "Dragon'0"] call zamf_fnc_team;
    };


    if (["Dragon'0'E [Engineer]", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Dragon'0"] call zamf_fnc_team;
    };


    if (["[Platoon Medic]", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Dragon'0"] call zamf_fnc_team;
    };


    if (["Dragon'1", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Dragon'1"] call zamf_fnc_team;
    };


    if (["Dragon'2", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Dragon'2"] call zamf_fnc_team;
    };


    if (["Dragon'3'1", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Dragon'3'1"] call zamf_fnc_team;
    };


    if (["Dragon'3'2", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Dragon'3'2"] call zamf_fnc_team;
    };


    if (["Dragon'3'3", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Dragon'3'3"] call zamf_fnc_team;
    };


    if (["Dragon'4", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Dragon'4"] call zamf_fnc_team;
    };


    if (["Ghostrider", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "grunt", "Ghostrider"] call zamf_fnc_team;
    };


    if (["Badger'1", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "crew", "Badger'1"] call zamf_fnc_team;
    };


    if (["Badger'2", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "crew", "Badger'2"] call zamf_fnc_team;
    };


    if (["Reaper", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "jet", "Reaper"] call zamf_fnc_team;
    };


    // Crates

    if (["hq", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "hq", "Dragon'0", true] call zamf_fnc_crate;
    };


    if (["squad_1", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "squad", "Dragon'1", true] call zamf_fnc_crate;
    };


    if (["squad_2", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "squad", "Dragon'2", true] call zamf_fnc_crate;
    };


    if (["mg_team", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "squad", "Dragon'3'1", true] call zamf_fnc_crate;
    };


    if (["atgm_team", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "atgm_team", "Dragon'3'2", true] call zamf_fnc_crate;
    };


    if (["aa_team", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "aa_team", "Dragon'3'3", true] call zamf_fnc_crate;
    };


    if (["fst", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "fst", "Dragon'4", true] call zamf_fnc_crate;
    };


    if (["heli", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "heli", "Ghostrider", true] call zamf_fnc_crate;
    };


    if (["crew_1", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "crew", "Badger'1", true] call zamf_fnc_crate;
    };


    if (["crew_2", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "crew", "Badger'2", true] call zamf_fnc_crate;
    };


    if (["jet", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "jet", "Reaper", true] call zamf_fnc_crate;
    };


    if (["equipment", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "equipment", "Equipment", false] call zamf_fnc_crate;
    };


    if (["med", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "med", "Medical", false] call zamf_fnc_crate;
    };


    if (["explosives", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "explosives", "Explosives", false] call zamf_fnc_crate;
    };


    if (["para", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "para", "Paradrop", false] call zamf_fnc_crate;
    };


    if (["para", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "para", "Paradrop", false] call zamf_fnc_crate;
    };


    if (["arsenal", roleDescription _x] call BIS_fnc_inString) then {
        nul = ["AmmoboxInit", [_x, true]] spawn BIS_fnc_arsenal;
        [_x, true, "Arsenal"] call ZAM_fnc_showNames_addDiscoverable;
    };


    if (["ugv", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "ugv", "UGV", false] call zamf_fnc_crate;
    };


    if (["squad_resupply", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "squad_resupply", "Squad Resupply", false] call zamf_fnc_crate;
    };


    if (["mg_team_resupply", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "mg_team_resupply", "MG Resupply", false] call zamf_fnc_crate;
    };


    if (["atgm_team_resupply", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "atgm_team_resupply", "ATGM Resupply", false] call zamf_fnc_crate;
    };


    if (["aa_team_resupply", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "aa_team_resupply", "AA Resupply", false] call zamf_fnc_crate;
    };


    if (["explosives", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "explosives", "Explosives Resupply", false] call zamf_fnc_crate;
    };


    if (["repair", roleDescription _x] call BIS_fnc_inString) then {
        nul = [_x, "repair", "", false] call zamf_fnc_crate;
    };


} count (entities "man" + vehicles);
