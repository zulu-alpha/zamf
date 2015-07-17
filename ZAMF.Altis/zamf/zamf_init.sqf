// Initializes many ZAM functions in their correct order.
// Takes as input an array of many strings that turn each component on. If the string is absent the feature wont be enabled. They can be provided in any order.

/* Example:
[
// Remove any of these strings to disable a feature. All of these must be in lowercase but can be in any order.

"hc_layer",                  // UPSMON and the execution of HC layer jobs
"disable_playable_ai",       // Makes the AI that takes a player slot effectively vacant (wont do anything)
"disable_playable_ai_speak", // Prevent the avatar that the player controls from shouting in game
"leave_group",               // Makes the player leave whatever group he/she starts in and join a new one alone
"spectate_on_death"          // As soon as a player dies, he/she spectates (even if respawn is enabled)

] call compile preprocessfilelinenumbers "zamf\zamf_init.sqf";
*/

// Shortens script calls
#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif

private ["_input"];
_input = _this;

// Define Paramaters for editor
if (isNil "paramsArray") then {
	execNow "zamf\params\params_editor.sqf";
};

// Name Paramaters for easy use
execNow "zamf\params\params_name.sqf";

// ZAM Debug
zamf_debug = !(isNil "PARAMS_zamf_debug") && {PARAMS_zamf_debug == 1};
#include "debug\debug.hpp"

// Set Respawn timer parameter
if !(isNil "PARAMS_respawntimer") then {
	[] spawn {
		waitUntil {sleep 1; time > 1};
		setPlayerRespawnTime PARAMS_respawntimer;
	};
};

// Time Parameter
[PARAMS_hour, PARAMS_minute, PARAMS_day] execVM "zamf\world\world_time.sqf";

// View Distance Parameter
PARAMS_def_view_distance execNow "zamf\world\world_view_distance.sqf";

// Weather Parameter
[PARAMS_clouds, PARAMS_fogValue, PARAMS_fogDecay, PARAMS_fogBase] execVM "zamf\world\world_weather.sqf";

// Disable AI for all playable units
if ("disable_playable_ai" in _input) then {execVM "zamf\player\disable_playable.sqf"};

// Disable Ai Speak for playable characters
if ("disable_playable_ai_speak" in _input) then {execVM "zamf\player\disable_ai_speak.sqf"};

// Player automatically leaves group at start
if ("leave_group" in _input) then {execVM "zamf\player\leave_grp.sqf"};

// Spectate on death
if (("spectate_on_death" in _input) && {PARAMS_respawntimer > 20}) then {
	[] execVM "CSSA3\CSSA3_init.sqf";
	zamf_var_spectondeath = true;
} else {
	zamf_var_spectondeath = false;
};

// TPWCAS
if ( !(isNil "PARAMS_tpwcas_minskill") && {PARAMS_tpwcas_minskill > 0} ) then { [PARAMS_tpwcas_minskill] execVM "zamf\external\tpwcas_minskilloverride.sqf" };

// Handle enabling or disabling of ZA Mods
if !(isNil "PARAMS_zam_res_enabled") then {zam_res_enabled = (PARAMS_zam_res_enabled == 1)};
if !(isNil "PARAMS_zam_tap_enabled") then {zam_tap_enabled = (PARAMS_zam_tap_enabled == 1)};
if !(isNil "PARAMS_zam_showNames_enabled") then {zam_showNames_enabled = (PARAMS_zam_showNames_enabled == 1)};

// Randomize ACRE default frequencies
//if ("acre_random_freq" in _input) then {execVM "zamf\fnc\fn_randomFreq.sqf"};


// ZA flag
if ("za_flag" in _input) then {[["kyo_MH47E_HC","kyo_MH47E_base"], [0,"zamf\vehicles\za_flag.paa"]] execVm "zamf\vehicles\zamf_setTexture.sqf"};

// TFAR Config
if ("tfar_config" in _input) then {
	tf_no_auto_long_range_radio = true;
	TF_give_microdagr_to_soldier = false;
};

// MCC Limits
//--------------------- Who can access MCC leave "all" for everbody --------------------------------
// Should be MCC_allowedPlayers = ["12321","1321123"];
// Host or server admin will always have access
if ("mcc_limit" in _input) then {MCC_allowedPlayers = [];};

// Zeusify all units
if ((isServer) && ("zeusify" in _input)) then {
	{
		nul = [_x, true] execVM "zamf\zeus\ADV_zeus.sqf";
	} count allCurators;
};

// Finish world initialization before mission is launched.
finishMissionInit;

zamf_DEBUG("finished",[])