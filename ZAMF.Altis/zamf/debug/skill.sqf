{
	if !(isPlayer _x) then {
		//_x = _this;

		_a = _x skillFinal "aimingAccuracy";
		_a_o = _x skill "aimingAccuracy";

		_b = _x skillFinal "aimingShake";
		_b_o = _x skill "aimingShake";

		_c = _x skillFinal "aimingSpeed";
		_c_o = _x skill "aimingSpeed";

		_d = _x skillFinal "endurance";
		_d_o = _x skill "endurance";

		_e = _x skillFinal "spotDistance";
		_e_o = _x skill "spotDistance";

		_f = _x skillFinal "spotTime";
		_f_o = _x skill "spotTime";

		_g = _x skillFinal "courage";
		_g_o = _x skill "courage";

		_h = _x skillFinal "reloadSpeed";
		_h_o = _x skill "reloadSpeed";

		_i = _x skillFinal "commanding";
		_i_o = _x skill "commanding";

		_j = _x skillFinal "general";
		_j_o = _x skill "general";

		_k = _x getvariable ["tpwcas_originalaccuracy", "None"];
		_l = local _x;

		/*
		hint format ["
		aimingAccuracy: %1\n
		aimingShake: %2\n
		aimingSpeed: %3\n
		endurance: %4\n
		spotDistance: %5\n
		spotTime: %6\n
		courage: %7\n
		reloadSpeed: %8\n
		commanding: %9\n
		general: %10\n
		", _a,_b,_c,_d,_e,_f,_g,_h,_i,_j];
		*/

		diag_log text ""; 
		diag_log text format ["*** ZA Skill settings ***"];
		diag_log text format [" Skill values for %1:" , _x];
		diag_log text format [" (Original, Final)"];
		diag_log text format ["    aimingAccuracy  : %1, %2", _a_o, _a];
		diag_log text format ["    aimingShake     : %1, %2" , _b_o, _b];
		diag_log text format ["    aimingSpeed     : %1, %2" , _c_o, _c];
		diag_log text format ["    spotDistance    : %1, %2" , _e_o, _e];
		diag_log text format ["    spotTime        : %1, %2" , _f_o, _f];
		diag_log text format ["    courage         : %1, %2" , _g_o, _g];
		diag_log text format ["    reloadSpeed     : %1, %2" , _h_o, _h];
		diag_log text format ["    commanding      : %1, %2" , _i_o, _i];
		diag_log text format ["    general         : %1, %2" , _j_o, _j];
		diag_log text ""; 
		diag_log text format ["    TPWCAS Org Acc  : %1" , _k];
		diag_log text format ["    Is local        : %1" , _l];
		diag_log text ""; 
	};

} forEach allUnits;