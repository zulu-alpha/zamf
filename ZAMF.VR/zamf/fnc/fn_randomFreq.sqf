/**
By Phoenix of Zulu-Apha
Randomizes default frequencies for ACRE for each side (currently only for Blufor and Opfor+Resistance)
Multiplayer, dedicated or not dedicated.
*/

if !isMultiplayer exitWith {};

// Server makes synchronized random arrays
if isServer then {
   private "_rand";

   // 4.82 Mhz Room for each channel to be randomized,
   // Blufor in first 2.3 Mhz and Opfor in last 2.3 Mhz,
   // With .1 Mhz spacing between each possibility range.

   // Blufor
   zamf_var_freqsLowBlue = [];
   for "_i" from 0 to 99 do {
      _rand = (floor (random 2301)) / 1000;
      zamf_var_freqsLowBlue set [count zamf_var_freqsLowBlue, 30 + (_i * 4.82) + _rand];
   };

   // Opfor
   zamf_var_freqsLowRed = [];
   for "_i" from 0 to 99 do {
      _rand = (floor (random 2301)) / 1000;
      zamf_var_freqsLowRed  set [count zamf_var_freqsLowRed , 30 + (_i * 4.82) + 2.4 + _rand];
   };

   // Since no device can scan High frequencies, it's set manually and only for West
   // Frequencies by Rambo2
   zamf_var_freqsHighBlue = [2401.5, 2402.5, 2403.5, 2404.5, 2405.5, 2406.5, 2407.5, 2408.5, 2409.5, 2410.5, 2411.5, 2412.5, 2413.5, 2414.5, 2415.5, 2416.5];

   // Brodcast Results (synchronized between clients)
   publicVariable "zamf_var_freqsLowBlue";
   publicVariable "zamf_var_freqsHighBlue";
   publicVariable "zamf_var_freqsLowRed";
};
   
   
// Now players set them
if hasInterface then {

   // Make sure player initializes
   waitUntil {(player == player) && !(isNull player)};

   // Make sure ACRE initializes
   waitUntil {
      sleep 1;
      private _radios = [] call acre_api_fnc_getCurrentRadioList;
      (count _radios) > 0
   };

   if (playerSide == west) then {

      // Wait for server to be done
      waitUntil {!isNil "zamf_var_freqsLowBlue" && !isNil "zamf_var_freqsHighBlue"};

      // Set default frequencies for ACRE
      ["ACRE_PRC148", zamf_var_freqsLowBlue] call acre_api_fnc_setDefaultChannels;
      ["ACRE_PRC148_UHF", zamf_var_freqsLowBlue] call acre_api_fnc_setDefaultChannels;
      ["ACRE_PRC117F", zamf_var_freqsLowBlue] call acre_api_fnc_setDefaultChannels;
      ["ACRE_PRC152", zamf_var_freqsLowBlue] call acre_api_fnc_setDefaultChannels;
      ["ACRE_PRC119", zamf_var_freqsLowBlue] call acre_api_fnc_setDefaultChannels;

      // High Frequency
      ["ACRE_PRC343", zamf_var_freqsHighBlue] call acre_api_fnc_setDefaultChannels;

   } else {

      // Wait for server to be done
      waitUntil {!isNil "zamf_var_freqsLowRed"};

      // Set default frequencies for ACRE
      ["ACRE_PRC148", zamf_var_freqsLowRed] call acre_api_fnc_setDefaultChannels;
      ["ACRE_PRC148_UHF", zamf_var_freqsLowRed] call acre_api_fnc_setDefaultChannels;
      ["ACRE_PRC117F", zamf_var_freqsLowRed] call acre_api_fnc_setDefaultChannels;
      ["ACRE_PRC152", zamf_var_freqsLowRed] call acre_api_fnc_setDefaultChannels;
      ["ACRE_PRC119", zamf_var_freqsLowRed] call acre_api_fnc_setDefaultChannels;

   };

   // Set default radio power to max for channel 1
   ["ACRE_PRC148", [5000]] call acre_api_fnc_setDefaultPowers;
   ["ACRE_PRC148_UHF", [5000]] call acre_api_fnc_setDefaultPowers;
   ["ACRE_PRC117F", [20000]] call acre_api_fnc_setDefaultPowers;
   ["ACRE_PRC152", [5000]] call acre_api_fnc_setDefaultPowers;
   ["ACRE_PRC119", [4000]] call acre_api_fnc_setDefaultPowers;

};