// Remove all deleted markers from the given array
private _markers = _this;
_markers select {[_x] call blockMarkers_fnc_checkIfMarkerExists}