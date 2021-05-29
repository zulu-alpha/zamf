// Loiter.sqf
// © v.2.0 June 2017 - Devastator_cm

private  _AirCraft 		= _this select 0;
private  _NewActionID 	= 0;


if(_AirCraft getVariable ["DEVAS_Loiter", false]) then 
{	// Disable
	_AirCraft setVariable ["DEVAS_Loiter", false, false];
	_NewActionID = _AirCraft addAction  ["Loiter off", {[_this select 0 ,nil, _this select 2, _this select 3]  spawn DEVAS_LoiterMain;}, false, 6, false, false, "", "local _target", -1];
	_AirCraft setVariable ["DEVAS_LoiterActionID", _NewActionID, false];
} 
else 
{   // Enable
	_AirCraft setVariable ["DEVAS_Loiter", true, false];
	_NewActionID = _AirCraft addAction  ["Loiter on", {[_this select 0 ,nil, _this select 2, _this select 3]  spawn DEVAS_LoiterMain;}, true, 6, false, false, "", "isEngineOn _target && local _target", -1];
	_AirCraft setVariable ["DEVAS_LoiterActionID", _NewActionID, false];
};

_NewActionID