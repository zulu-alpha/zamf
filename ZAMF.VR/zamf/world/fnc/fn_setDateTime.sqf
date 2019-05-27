/*
	Description:
	Sets date and time. Designed for use with params. 

	Parameter(s):
	0: STRING - Params class name for the Month.
	1: STRING - Params class name for the Day.
	2: STRING - Params class name for the Hour.
	3: STRING - Params class name for the Minute.

	Returns:
	Nothing
*/
if (!isServer) exitWith {};

_this spawn {
	params ["_month_name", "_day_name", "_hour_name", "_minute_name"];
	private _month = [_month_name, -1] call BIS_fnc_getParamValue;
	private _day = [_day_name, -1] call BIS_fnc_getParamValue;
	private _hour = [_hour_name, -1] call BIS_fnc_getParamValue;
	private _minute = [_minute_name, -1] call BIS_fnc_getParamValue;

	if (_month + _day + _hour + _minute == -4) exitWith {};

	private _new_date = date;

	if (_month > -1) then {
		_new_date set [1, _month];
	};

	if (_day > -1) then {
		_new_date set [2, _day];
	};

	if (_hour > -1) then {
		_new_date set [3, _hour];
	};

	if (_minute > -1) then {
		_new_date set [4, _minute];
	};

	waitUntil {time > 1};
	[_new_date, true, false] call BIS_fnc_setDate;
};
