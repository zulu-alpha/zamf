/*
	Description:
	Sets weather settings. Designed for use with params. 

	Parameter(s):
	0: NUMBER - Overcast level. -1 for no change.
	0: NUMBER - Rain level. -1 for no change.
	0: NUMBER - Waves level. -1 for no change.
	0: NUMBER - Lightning level. -1 for no change.
	0: NUMBER - Fog value level. -1 for no change.
	0: NUMBER - Fog decay level. Only used if Fog value level is not -1.
	0: NUMBER - Fog base level. Only used if Fog value level is not -1.

	Returns:
	Nothing
*/
if (!isServer) exitWith {};

_this spawn {
	params [
		"_overcast", "_rain", "_waves", "_lightning", "_fogValue", "_fogDecay", "_fogBase"
	];
	private _is_change = false;

	if (_overcast > -1) then {
		_is_change = true;
		_overcast = _overcast / 10;
		skipTime -24;
		86400 setOvercast _overcast;
		skipTime 24;
		sleep 0.1;
		simulWeatherSync;
	};

	if (_rain > -1) then {
		_is_change = true;
		_rain = _rain / 10;
		0 setRain _rain;
	};

	if (_waves > -1) then {
		_is_change = true;
		_waves = _waves / 10;
		0 setWaves _waves;
	};

	if (_lightning > -1) then {
		_is_change = true;
		_lightning = _lightning / 10;
		0 setLightnings _lightning;
	};

	if (_fogValue > -1) then {
		_is_change = true;
		_fogValue = if (_fogValue != 0) then {_fogValue / 10} else {_fogValue};
		_fogDecay = if (_fogDecay != 0) then {_fogDecay / 100} else {_fogDecay};
		[_fogValue, _fogDecay, _fogBase] call BIS_fnc_setFog;
	};

	if (_is_change) then {
		sleep 0.1;
		forceWeatherChange;
	};
};