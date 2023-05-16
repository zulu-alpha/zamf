// Creates a marker covering the area defined by the given marker, of which another must have been found before.
// Therefore, this function must be called at least twice for it to function once.
// This is becuase the first provided marker is the starting marker, and the second the
// final marker, which defines an area.
// Zebs Birefing Table will created on the table with the variable defined by zebsBriefingHandler_var_table.
params ["_final_marker"];

private _already_creted = zebsBriefingHandler_var_table getVariable ["zebsBriefingHandler_var_table_enabled", false];
if (_already_creted) exitWith {
	hint "Briefing table already set! Clear table first.";
};

zebsBriefingHandler_var_discovered_block_markers = zebsBriefingHandler_var_discovered_block_markers call zebsBriefingHandler_fnc_sanatizeMarkerArray;
zebsBriefingHandler_var_discovered_block_markers pushBackUnique _final_marker;
if ((count zebsBriefingHandler_var_discovered_block_markers) < 2) exitWith {};
private _area_def = zebsBriefingHandler_var_discovered_block_markers call zebsBriefingHandler_fnc_getAreaDefinition;
_area_def params ["_a", "_b", "_angle", "_center"];
{
	deleteMarker _x;
} forEach zebsBriefingHandler_var_discovered_block_markers;
zebsBriefingHandler_var_discovered_block_markers = [];
if ((_a > zebsBriefingHandler_var_max_area_length) or {_b > zebsBriefingHandler_var_max_area_length}) exitWith {
	hint (format ["Length of either side of area cannot exceed %1m", zebsBriefingHandler_var_max_area_length]);
};
[
	zebsBriefingHandler_var_marker_name,
	zebsBriefingHandler_var_marker_alpha,
	zebsBriefingHandler_var_marker_color,
	zebsBriefingHandler_var_marker_brush,
	_a / 2,
	_b / 2,
	_angle,
	_center,
	zebsBriefingHandler_var_marker_channel
] call zebsBriefingHandler_fnc_createBriefingAreaMarker;

zebsBriefingHandler_var_table setVariable ["zebsBriefingHandler_var_table_enabled", true, true];
[
	zebsBriefingHandler_var_table,
	zebsBriefingHandler_var_marker_name,
	30,
	2.3,
	true,
	true
] remoteExec ["sebs_briefing_table_fnc_createTable", 0, false];
