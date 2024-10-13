// AutoPilotDCM2RPY.sqf
// © v.2.0 June 2017 - Devastator_cm

private _DCM 		= _this select 0;
private _roll 		= ((_DCM select 2) select 1) atan2 ((_DCM select 2) select 2);
private _pitch 		= -1 * asin ((_DCM select 2) select 0);
private _yaw 		= ((_DCM select 1) select 0) atan2 ((_DCM select 0) select 0);

[_roll, _pitch, _yaw]