if ((isNil "zebsBriefingHandler_var_table") or {isNil "zebsBriefingHandler_var_interface"}) exitWith {
  if !(isDedicated) then {
    systemChat "Table or interface for zebs Briefing Table not present, therefore this system is disabled.";
  };
};

zebsBriefingHandler_var_block_command_text = "!zb";
zebsBriefingHandler_var_marker_channel = 1;
zebsBriefingHandler_var_marker_index = -1;
zebsBriefingHandler_var_max_area_length = 1000;
zebsBriefingHandler_var_marker_name = "zebsBriefingHandler_area";
zebsBriefingHandler_var_marker_alpha = 1;
// https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors
zebsBriefingHandler_var_marker_color = "ColorGreen";
// https://community.bistudio.com/wiki/setMarkerBrush
zebsBriefingHandler_var_marker_brush = "SolidBorder";
zebsBriefingHandler_var_discovered_block_markers = [];

addMissionEventHandler ["MarkerCreated", {
	params ["_marker", "_channelNumber", "_owner", "_local"];
  if ((markerText _marker == zebsBriefingHandler_var_block_command_text) and (_owner == player)) then {
    [_marker] spawn zebsBriefingHandler_fnc_createZebsBriefingTablebySavedAndGivenMarkers;
  };
}];

zebsBriefingHandler_var_interface addAction [
  "Clear briefing table",
  zebsBriefingHandler_fnc_clearBriefingTable,
  nil,
  1.5,
  true,
  true,
  "",
  "zebsBriefingHandler_var_table getVariable ['zebsBriefingHandler_var_table_enabled', false]"
];
