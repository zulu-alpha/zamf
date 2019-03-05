// Give names to each element in Params Array
// #include "..\debug\debug.hpp"

for [{_i = 0},{_i < count(paramsArray)},{_i = _i + 1}] do {
	private "_i";
	call compile format ["PARAMS_%1 = %2",(configName ((missionConfigFile >> "Params") select _i)),(paramsArray select _i)];
};

/*
zamf_DEBUG("Hour: %1",[PARAMS_hour])
zamf_DEBUG("Weather: %1",[PARAMS_weather])
zamf_DEBUG("View Distance: %1",[PARAMS_def_view_distance])
*/