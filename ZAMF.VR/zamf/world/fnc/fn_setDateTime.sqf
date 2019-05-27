/*
	Description:
	Sets date and time. Designed for use with params. 

	Parameter(s):
	0: NUMBER - Month. -1 for no change.
	0: NUMBER - Day. -1 for no change.
	0: NUMBER - Hour. -1 for no change.
	0: NUMBER - Minute. -1 for no change.

	Returns:
	Nothing
*/
if (!isServer) exitWith {};

_this spawn {
	params ["_month", "_day", "_hour", "_minute"];

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

	waitUntil {time > 2};
	if !(_new_date isEqualTo date) then {
		[_new_date, true, false] call BIS_fnc_setDate;
	};
};
