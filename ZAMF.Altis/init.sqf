// Adjust respawn via tickets here
[player, 2] call BIS_fnc_respawnTickets; // https://community.bistudio.com/wiki/BIS_fnc_respawnTickets

//// Process ZAMF init
[
// Remove any of these strings to disable a feature. All of these must be in lowercase but can be in any order.

"disable_playable_ai",       // Makes the AI that takes a player slot effectively vacant (wont do anything).
"disable_playable_ai_speak", // Prevent the avatar that the player controls from shouting in game.
//"leave_group",             // Makes the player leave whatever group he/she starts in and join a new one alone.
"spectate_on_death",         // As soon as a player dies, he/she spectates (even if respawn is enabled).
"tfar_config",               // ZA Specific config settings for TFAR, such as disabling auto microdagr and backpack radios.
"mcc_limit",                 // Limit MCC to Admins.
"zeusify",                   // Make sure that all units are detected by zeus.
"zam_res",                   // Enable ZAM Resume
"disable_chat_channels"      // Disables chat channels. Used here instead of description to allow them in map screen.

] call ZAMF_fnc_zamf_init;

// ACRE
["ACRE_PRC152", "default", 1, "label", "DRAGON"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 1, "label", "DRAGON"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 2, "label", "DRAGON-1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 2, "label", "DRAGON-1"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 3, "label", "DRAGON-2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 3, "label", "DRAGON-2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 4, "label", "DRAGON-3"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 4, "label", "DRAGON-3"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 5, "label", "DRAGON-4"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 5, "label", "DRAGON-4"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 6, "label", "DRAGON-5"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 6, "label", "DRAGON-5"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 7, "label", "BADGER"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 7, "label", "BADGER"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 8, "label", "LOGISTICS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 8, "label", "LOGISTICS"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 9, "label", "CAS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 9, "label", "CAS"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 10, "label", "FIRES"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 10, "label", "FIRES"] call acre_api_fnc_setPresetChannelField;

//// Youre code here
