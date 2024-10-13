// Clear the briefing table, mark it as cleared and delete the marker.
[zebsBriefingHandler_var_table] remoteExec [
	"sebs_briefing_table_fnc_clearTable",
	0,
	false
];
zebsBriefingHandler_var_table setVariable [
	"zebsBriefingHandler_var_table_enabled",
	false,
	true
];
deleteMarker zebsBriefingHandler_var_marker_name;