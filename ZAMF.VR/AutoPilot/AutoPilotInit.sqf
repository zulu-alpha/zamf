// AutoPilotInit.sqf   SCRIPT VERSION
// © v.2.0 June 2017 - Devastator_cm
// Different by mod and script version

DEVAS_AutoPilotMain 		= Compile preprocessFileLineNumbers "AutoPilot\AutoPilotMain.sqf";
DEVAS_AutoPilot				= Compile preprocessFileLineNumbers "AutoPilot\AutoPilot.sqf";
DEVAS_DCM2RPY				= Compile preprocessFileLineNumbers "AutoPilot\Math\AutoPilotDCM2RPY.sqf";				
DEVAS_VectorDirAndUp2DCM	= Compile preprocessFileLineNumbers "AutoPilot\Math\AutoPilotVectorDirAndUp2DCM.sqf";	
DEVAS_MatrixMultiply		= Compile preprocessFileLineNumbers "AutoPilot\Math\AutoPilotMatrixMultiply.sqf";
DEVAS_AutoPilotHeli			= Compile preprocessFileLineNumbers "AutoPilot\AutoPilotHeli.sqf";
DEVAS_AutoPilotFWing		= Compile preprocessFileLineNumbers "AutoPilot\AutoPilotFWing.sqf";
DEVAS_Loiter				= Compile preprocessFileLineNumbers "AutoPilot\Loiter.sqf";
DEVAS_LoiterMain			= Compile preprocessFileLineNumbers "AutoPilot\LoiterMain.sqf";
DEVAS_LoiterStart			= Compile preprocessFileLineNumbers "AutoPilot\LoiterStart.sqf";
DEVAS_LoiterAdjust			= Compile preprocessFileLineNumbers "AutoPilot\LoiterAdjust.sqf";

{[_x] spawn DEVAS_AutoPilot;} foreach (entities [["Air"],   [], false, true]);
{[_x] spawn DEVAS_Loiter;}    foreach (entities [["Plane"], [], false, true]);