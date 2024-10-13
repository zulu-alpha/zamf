// Create a unique, user generated marker name.
private _index = call blockMarkers_fnc_getNextMarkerIndex;
private _name = [_index] call blockMarkers_fnc_createUserCreatedMarkerName;
while {[_name] call blockMarkers_fnc_checkIfMarkerExists} do {
_index = call blockMarkers_fnc_getNextMarkerIndex;
_name = [_index] call blockMarkers_fnc_createUserCreatedMarkerName;
};
_name
