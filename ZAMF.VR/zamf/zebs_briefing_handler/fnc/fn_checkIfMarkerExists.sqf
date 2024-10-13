// Check if the given marker exists.
params ["_marker"];
if (getMarkerColor _marker == "") exitWith {false};
true
