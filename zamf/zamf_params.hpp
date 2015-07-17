//////// Parameters ////////
// Only touch these if you want to change the default parameter settings.
// Simply uncomment a #define line and change it's value.
// This can be done in the description.ext, before this file is loaded.




////// Medical //////

//// Respawn Timer
// In seconds. must be 0 if using BTC. Use large number for effectively no respawn
//#define zamf_medical_params_respawntimer 10000




////// World //////
//// Hour
// options: 0 to 23 for hour
// default: -1 for value set it editor
//#define zamf_world_params_hour -1

//// Minute
// options: 0 to 55 for minutes (in 5 minute intervals)
// default: -1 for value set it editor
//#define zamf_world_params_minute -1

//// Day
// options: 1 to 31 for minutes (in 5 minute intervals)
// default: -1 for value set it editor
//#define zamf_world_params_day -1

//// View Distance (default)
// options 1000 to 12000 for meters
//#define zamf_world_params_world_def_view_distance 3000

//// Clouds
// options: -1, 0, 1, 2
// For: "Default","Clear","Overcast","Stormy"
// default: -1 for value set it editor
//#define zamf_world_params_clouds -1

//// Value for fog at base level
// options: Value for fog at base level from 0 to 10 (will be divided by 10)
// default: -1 for value set it editor
//#define zamf_world_params_fogValue -1

//// Decay of fog density with altitude
// options: Decay of fog density with altitude from 0 to 100 (will be divided by 100)
//#define zamf_world_params_fogDecay 0

//// Base altitude of fog (in meters)
// options: Base altitude of fog (in meters)
//#define zamf_world_params_fogBase 0

//// ZAMF Debug
// options: 1 for on, 0 for off
//#define zamf_world_params_debug 0




////// External //////
//// ZAM - Resume
// options: 1 for on, 0 for off
//#define zamf_external_params_zam_res_enabled 1

//// ZAM - Show Name
// options: 1 for on, 0 for off
//#define zamf_external_params_zam_showNamess_enabled 1





class Params {
        class medical_header {
        title = ":: Medical";
        values[]= {0};
        texts[]= {" "};
        default = 0;
        };

        #include "medical\medical_params.hpp" // Must be placed first in current state (for x39 module)

	class world_header {
        title = ":: World";
        values[]= {0};
        texts[]= {" "};
        default = 0;
	};

	#include "world\world_params.hpp"

	class external_header {
        title = ":: External";
        values[]= {0};
        texts[]= {" "};
        default = 0;
	};

	#include "external\external_params.hpp"

};