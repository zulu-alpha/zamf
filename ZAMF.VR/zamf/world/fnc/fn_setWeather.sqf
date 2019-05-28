/*
	Description:
	Sets weather settings. Designed for use with params. 

	Parameter(s):
	0: STRING - Params class name for the Overcast level.
	1: STRING - Params class name for the Rain level.
	2: STRING - Params class name for the Waves level.
	3: STRING - Params class name for the Lightning level.
	4: STRING - Params class name for the Fog value level.
	5: STRING - Params class name for the Fog decay level.
	6: STRING - Params class name for the Fog base level.

	Returns:
	Nothing
*/
if (!isServer) exitWith {};

_this spawn {
	params [
		"_overcast_name", "_rain_name", "_waves_name", "_lightning_name",
		"_fogValue_name", "_fogDecay_name", "_fogBase_name"
	];
	private _overcast = [_overcast_name, -1] call BIS_fnc_getParamValue;
	private _rain = [_rain_name, -1] call BIS_fnc_getParamValue;
	private _waves = [_waves_name, -1] call BIS_fnc_getParamValue;
	private _lightning = [_lightning_name, -1] call BIS_fnc_getParamValue;
	private _fogValue = [_fogValue_name, -1] call BIS_fnc_getParamValue;
	private _fogDecay = [_fogDecay_name, -1] call BIS_fnc_getParamValue;
	private _fogBase = [_fogBase_name, -1] call BIS_fnc_getParamValue;

	if (_overcast > -1) then {
		_overcast = _overcast / 10;
		skipTime -24;
		86400 setOvercast _overcast;
		skipTime 24;
	};

	if (_rain > -1) then {
		_rain = _rain / 10;
		0 setRain _rain;
	};

	if (_waves > -1) then {
		_waves = _waves / 10;
		0 setWaves _waves;
	};

	if (_lightning > -1) then {
		_lightning = _lightning / 10;
		0 setLightnings _lightning;
	};

	if (_fogValue > -1) then {
		_fogValue = if (_fogValue != 0) then {_fogValue / 10} else {_fogValue};
		_fogDecay = if (_fogDecay != 0) then {_fogDecay / 100} else {_fogDecay};
		[_fogValue, _fogDecay, _fogBase] call BIS_fnc_setFog;
	};

	if (_overcast + _rain + _waves + _lightning + 
	    _fogValue + _fogDecay + _fogBase != -7) then {
		sleep 0.1;
		forceWeatherChange;
		sleep 0.1;
		simulWeatherSync;
	};
};
