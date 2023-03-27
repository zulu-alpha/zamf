// Gets an area definition from two given markers.
params ["_marker_1", "_marker_2"];
private _markers_dir = (getmarkerpos _marker_1) getDir (getmarkerpos _marker_2);
private _markers_dist = (getmarkerpos _marker_1) distance (getmarkerpos _marker_2);
private _rectange_dir = [_marker_1, _marker_2] call blockMarkers_fnc_getDirectionOfAnyMarker;
private _angle = [_markers_dir, _rectange_dir] call blockMarkers_fnc_getAbsoluteDifferenceBetweenAngles;
private _side_a_length = [_angle, _markers_dist] call blockMarkers_fnc_getSideALength;
private _side_b_length = [_angle, _markers_dist] call blockMarkers_fnc_getSideBLength;
private _center = [_marker_1, _marker_2] call blockMarkers_fnc_getCenterCoordinatesBetweenTwoMarkers;
[_side_a_length, _side_b_length, _rectange_dir, _center]

