// Disable respawn by adjusting the tickets in the line further below.
zamf_respawntimer = 5;

// Adjust respawn via tickets here
[player, 2] call BIS_fnc_respawnTickets; // https://community.bistudio.com/wiki/BIS_fnc_respawnTickets

//// Process ZAMF init
[
// Remove any of these strings to disable a feature. All of these must be in lowercase but can be in any order.

"disable_playable_ai",       // Makes the AI that takes a player slot effectively vacant (wont do anything).
"disable_playable_ai_speak", // Prevent the avatar that the player controls from shouting in game.
//"leave_group",             // Makes the player leave whatever group he/she starts in and join a new one alone.
"spectate_on_death",         // As soon as a player dies, he/she spectates (even if respawn is enabled).
"tfar_config",		     // ZA Specific config settings for TFAR, such as disabling auto microdagr and backpack radios.
"mcc_limit",		     // Limit MCC to Admins.
"zeusify",		     // Make sure that all units are detected by zeus.
"logistics",		     // Enable a logistics script
"zam_res"		     // Enable ZAM Resume

] call ZAMF_fnc_zamf_init;

//// Youre code here
