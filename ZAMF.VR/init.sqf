//// Process ZAMF init
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

// Adjust respawn via tickets here
[] spawn {
	if !(hasinterface) exitWith {};
	waitUntil {!(isNull player)};
	// Change number here
	[player, 1] call BIS_fnc_respawnTickets;  // https://community.bistudio.com/wiki/BIS_fnc_respawnTickets
};

// VCOM AI
[] execVM "VCOMAI\init.sqf"

//// Youre code here
