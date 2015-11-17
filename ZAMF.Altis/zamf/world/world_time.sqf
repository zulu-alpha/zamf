//Time
private ["_hour", "_minute", "_day"];

_hour = _this select 0;
_minute = _this select 1;
_day = _this select 2;

if ((_hour <= -1) && {_minute <= -1} && {_day <= -1}) exitWith {};

if (_day <= -1) then {
	_day = date select 2;
};

if (_hour <= -1) then {
	_hour = date select 3;
};

if (_minute <= -1) then {
	_minute = date select 4;
};

waitUntil {time > 10};

setDate [(date select 0), (date select 1), _day, _hour , _minute + ( time /60)];