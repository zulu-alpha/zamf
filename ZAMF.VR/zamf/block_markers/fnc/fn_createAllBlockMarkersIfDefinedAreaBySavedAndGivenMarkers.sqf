// Creates markers for all the buildings in a block, using the given marker, of which another must have been found before.
// Therefore, this function must be called at least twice for it to function once.
// This is becuase the first provided marker is the starting marker, and the second the
// final marker, which defines an area.
params ["_final_marker"];
blockMarkers_var_discovered_block_markers = blockMarkers_var_discovered_block_markers call blockMarkers_fnc_sanatizeMarkerArray;
blockMarkers_var_discovered_block_markers pushBackUnique _final_marker;
if ((count blockMarkers_var_discovered_block_markers) < 2) exitWith {};
private _area_def = blockMarkers_var_discovered_block_markers call blockMarkers_fnc_getAreaDefinition;
_area_def params ["_a", "_b", "_angle", "_center"];
private _sorting_pos = getMarkerPos _final_marker;
{
deleteMarker _x;
} forEach blockMarkers_var_discovered_block_markers;
blockMarkers_var_discovered_block_markers = [];
if ((_a * _b) > blockMarkers_var_max_area_size) exitWith {
hint (format ["Area cannot exceed %1m^2", blockMarkers_var_max_area_size]);
};
private _index = call blockMarkers_fnc_getNextBlockIndex;
private _color = [_index] call blockMarkers_fnc_indexToColor;
private _enterables = [_a, _b, _angle, _center, _sorting_pos] call blockMarkers_fnc_getAllBuildingsInArea;
[_enterables, _color] call blockMarkers_fnc_createBuildingMarkersForBlock;
[_color, _index, _center] call blockMarkers_fnc_createBlockMarker;
