// Create a marker for the next block (according to the blockMarkers_var_block_index variable).
params ["_color", "_index", "_pos"];
private _name = call blockMarkers_fnc_getUniqueUserCreatedMarkerName;
private _block_letters = [_index] call blockMarkers_fnc_indexToLetters;
_mk = createMarkerLocal [_name, _pos, blockMarkers_var_marker_channel, player];
_mk setMarkerColorLocal _color;
_mk setMarkerTextLocal _block_letters;
_mk setMarkerType blockMarkers_var_block_marker_type;
