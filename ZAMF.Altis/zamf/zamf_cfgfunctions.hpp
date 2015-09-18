class ZAMF
{
	tag = "ZAMF";
	class init
	{
		class preInit {
			file = "zamf\zamf_preInit.sqf";
			preInit = 1;
			description = "Runs code that needs to be executed extremely early";
		};

	};

	class loadout
	{
		class crates {
			file = "loadout\crates.sqf";
			description = "Loads crates out.";
		};
		class gear {
			file = "loadout\gear.sqf";
			description = "Loads gear out using aeroson's set_loadout function.";
		};
	};

	class functions
	{
		file = "zamf\fnc";
		class getLoadout {description = "Uses aeroson's get_loadout function.";};
		class setLoadout {description = "Uses aeroson's set_loadout function.";};
		class getClimate {description = "Returns the climate type as an int, increasing with the intensity of green";};
		class disableAI {description = "Disables the AI for all the crew of a specified unit."; file = "zamf\ai\disable_ai.sqf";};
		class team {description = "Sets the gear and group ID of a unit.";};
		class crate {description = "Sets the gear and group restrictions of a crate.";};
		class spectateOptions {description = "Gives the target player local only action menu options to spectate. Must be spawned.";};
		class zamf_init {
			file = "zamf\zamf_init.sqf";
			description = "Initializes many ZAMF functionality in their correct order.";
		};
	};

	class res
	{
		file = "zamf\res\fnc";
		class res_init{description = "Initializes the mod."; postInit = 1;};
		class res_loop{description = "Main save loop.";};
		class res_restore{description = "Restores player status from prfileNameSpace.";};
		class res_getData{description = "Saves player status to prfileNameSpace.";};
		class res_request{description = "This checks to see if the player is in the save data and restores if so.";};
		class res_killed{description = "Sets the save data to killed for the given player object.";};
	};
};