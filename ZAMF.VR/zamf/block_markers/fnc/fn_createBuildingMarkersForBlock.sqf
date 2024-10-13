// Creates markers for all the buildings in a block.
params ["_enterables", "_color"];
private _mk_type = blockMarkers_var_building_marker_type;
private _markers = [];
{
private _building_number = _foreachIndex + 1;
private _name = call blockMarkers_fnc_getUniqueUserCreatedMarkerName;
_mk = createMarkerLocal [_name, getPos _x, blockMarkers_var_marker_channel, player];
_mk setMarkerColorLocal _color;
_mk setMarkerTextLocal (str _building_number);
_mk setMarkerType _mk_type;
_markers pushBack _mk;
} forEach _enterables;
_markers
