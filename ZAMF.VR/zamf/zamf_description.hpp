onLoadMissionTime = true;

// http://community.bistudio.com/wiki/Arma_3_Respawn
respawnVehicleDelay = 50;
respawnDialog=0;
respawnButton=1;
respawnTemplates[] = {"Base", "Tickets", "EndMission"};  // Hides respawn timer

respawn=3;
// RespawnType     Description
// 0 or "NONE"     No respawn
// 1 or "BIRD"     Respawn as a seagull
// 2 or "INSTANT"  Respawn just where you died.
// 3 or "BASE"     Respawn in base. Requires a marker named:
// 4 or "GROUP"    Respawn in your group (if there's no AI left, you'll become a seagull).
// 5 or "SIDE"     Respawn into an AI unit on your side (if there's no AI left, you'll become a seagull).
//
// Add markers named with the prefix 'respawn_west' with any suffix (eg: respawn_westABC, respawn_west1, respawn_west_2, etc) for multiple random respawn points. Similarly for east, guerrila and civilian.
// respawn_west
// respawn_east
// respawn_guerrila
// respawn_civilian
//
// Vehicle respawn in base requires a marker named:
// respawn_vehicle_west
// respawn_vehicle_east
// respawn_vehicle_guerrila
// respawn_vehicle_civilian

disabledAI= 1; // When 1, removes all playable units which do not have a human player. Disabling all the AI units will prevent JIP into playable units.
ShowGPS =1;
showCompass =1;
showWatch =1;
showMap =1;
showNotePad=1;
briefing=1;
debriefing=1;
AIkills = 0;

// Dangerous in MP
enableDebugConsole = 1;
// 0 = Default behavior, available only in editor
// 1 = Available in SP and for hosts / logged in admins
// 2 = Available for everyone

// ORBAT
#include "..\orbat.hpp"

// CBA Settings
cba_settings_hasSettingsFile = 1;
