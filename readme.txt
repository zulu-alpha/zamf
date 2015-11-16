Note that his readme is out of date and may be misleading.

===============================================================================================
BASIC USAGE:

1) Copy The contents of this foler into your mission folder.
2) You may delete the mission.sqm file or use it as a starting point for your new mission (template).

------------------
3) You can add your mission name in inverted commas in the descrition.ext for these lines:
   author = Author;
   onLoadName = Mission Name;
   onLoadMission = "Description";

------------------
4) To kit out a unit with gear, put in it's init field: nul = [this, "pl"] execVM "loadout\gear.sqf"; Or replace "pl" with a custom loadout specified in loadout\gear.sqf.

5a) To loadout a crate, put in it's init field: nul = [this, "nato_guns"] execVM "loadout\crates.sqf";
5b) Or: nul = [this, "nato_guns", "refill"] execVM "loadout\crates.sqf"; to allow for refilling of the crate.
5c) Replace "nato_guns" with any of the other crate loadouts specified in loadout\crates.sqf if you wish.

===============================================================================================
CUSTOMIZE:

1) Customize crates and gear loadouts by customizing loadout\crates.sqf and loadout\gear.sqf.
2) To customize a default parameter setting, such as View Distance for example, un-comment the line: //#define zamf_world_params_world_def_view_distance 3000 
in the description.ext so that it looks like this: #define zamf_world_params_world_def_view_distance 3000 and change the 3000 to whatever number you want.

