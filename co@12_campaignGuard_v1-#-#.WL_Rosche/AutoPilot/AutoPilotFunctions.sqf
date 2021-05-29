// AutoPilotFunctions.sqf
// © v.2.0 June 2017 - Devastator_cm

DEVAS_Switch =
{
	titleText [_this select 0, "PLAIN", 1];
	titleFadeOut 3;
	playSound "Devas_click";
	sleep 0.5;
};

DEVAS_RemoveAction =
{
	private _AirCraft 		= _this select 0;
	private _ActionID 		= _this select 1;
	private _Type           = _this select 2;
	private _NewActionID 	= 0;

	_AirCraft removeAction (_ActionID);
	If(_Type == AltitudeFix) then {_NewActionID = [_AirCraft] call DEVAS_AutoPilot;};
	If(_Type == Loiter)      then {_NewActionID = [_AirCraft] call DEVAS_Loiter;};
	_NewActionID
};