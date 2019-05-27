// Initializes many ZAMF functionality in their correct order.
// Takes as input an array of many strings that turn each component on. If the string is absent the feature wont be enabled. They can be provided in any order.

/* Example:
[
// Remove any of these strings to disable a feature. All of these must be in lowercase but can be in any order.

"disable_playable_ai",       // Makes the AI that takes a player slot effectively vacant (wont do anything).
"disable_playable_ai_speak", // Prevent the avatar that the player controls from shouting in game.
//"leave_group",             // Makes the player leave whatever group he/she starts in and join a new one alone.
"spectate_on_death",         // As soon as a player dies, he/she spectates (even if respawn is enabled).
"zam_res",                   // Enable ZAM Resume.
"zeusify",                   // Make sure that all units are detected by zeus.
"disable_chat_channels",     // Disables chat channels. Used here instead of description to allow them in map screen.
"towing"                     // Advanced towing.

] call ZAMF_fnc_zamf_init;
*/

// Time Parameter
["month", "day", "hour", "minute"] call zamf_fnc_setDateTime;

// View Distance Parameter
[
    "def_view_distance" call BIS_fnc_getParamValue
]  call zamf_fnc_setViewDistance;

// Weather Parameter
[
    "overcast" call BIS_fnc_getParamValue,
    "rain" call BIS_fnc_getParamValue,
    "waves" call BIS_fnc_getParamValue,
    "lightning" call BIS_fnc_getParamValue,
    "fogValue" call BIS_fnc_getParamValue,
    "fogDecay" call BIS_fnc_getParamValue,
    "fogBase" call BIS_fnc_getParamValue
] call zamf_fnc_setWeather;

// Disable AI for all playable units
if ("disable_playable_ai" in _this) then {execVM "zamf\player\disable_playable.sqf"};

// Disable Ai Speak for playable characters
if ("disable_playable_ai_speak" in _this) then {execVM "zamf\player\disable_ai_speak.sqf"};

// Player automatically leaves group at start
if ("leave_group" in _this) then {execVM "zamf\player\leave_grp.sqf"};

// Spectate on death
if ("spectate_on_death" in _this) then {[] execVM "zamf\spect\zamf_spect_init.sqf"};

// Add a key binding to exit EG Specator
[] execVM "zamf\spect\zamf_spect_key.sqf";

// Handle enabling or disabling of ZA Mods
zam_res_enabled = if ("zam_res" in _this) then {True} else {False};

// Disable radio channels
// 0 = Global
// 1 = Side
// 2 = Command
// 3 = Group (can't disable)
// 4 = Vehicle
// 5 = Direct
// 6 = System
if ("disable_chat_channels" in _this) then {
    [] spawn {
        waitUntil {sleep 0.1; time > 1};
        {
            _x enableChannel false;
        } count [0,1,2,5,6];
    };
};

// Zeusify all units
if ("zeusify" in _this) then {[] execVM "zamf\zeus\init.sqf"};

// Advanced Towing
if (("towing" in _this) and (isServer)) then {[] execVM "zamf\towing\fn_advancedTowingInit.sqf"};

// Finish world initialization before mission is launched.
finishMissionInit;
