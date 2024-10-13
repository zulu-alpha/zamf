// Gets the center coordinates between 2 markers.
params ["_marker_1", "_marker_2"];
private _center = getmarkerpos _marker_1;
_center = _center vectorAdd (getmarkerpos _marker_2);
_center = _center vectorMultiply 0.5;
_center
