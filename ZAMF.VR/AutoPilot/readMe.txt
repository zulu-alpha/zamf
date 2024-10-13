// © June 2017 - Devastator_cm
// Tested with Public Release 1.70


To use: 

1. Copy the AutoPilot folder into your mission directory.
2. Copy the code inside the Description.ext (under AutoPilot folder) into your Description.ext.
   In case you do not have any Description.ext, you can simply copy this file to your mission folder.
3. Copy the code inside the init.sqf (under AutoPilot folder) into your init.sqf. 
   After doing this you can delete the one provided by the script.
4. All objects under Air class inside mission will get the autopilot functionality at mission start automatically.
5. All objects under Plane class inside mission will get the loiter functionality at mission start automatically.
6. In case you are spawning airplanes during mission use below code to give them autopilot functionality if necessary.

Code:

  [this] spawn DEVAS_AutoPilot;

and in case it is an airplane and loiter is needed
  
  [this] spawn DEVAS_Loiter;


The parameters in the code are:

1. Object which needs the autopilot/loiter functionality


License:  These scripts are not to be altered or used for commercial or military purposes without the author's prior consent.
