blockMarkers_var_block_colors = [
  "ColorBlue",
  "ColorRed",
  "ColorGreen",
  "ColorBlack",
  "ColorYellow",
  "ColorBrown",
  "ColorKhaki",
  "ColorOrange",
  "ColorPink"
];
blockMarkers_var_block_marker_type = "mil_join";
blockMarkers_var_building_marker_type = "mil_dot";
blockMarkers_var_block_command_text = "!b";
blockMarkers_var_block_index = -1;
blockMarkers_var_marker_channel = 1;
blockMarkers_var_marker_index = -1;
blockMarkers_var_max_area_size = 500 * 500;
blockMarkers_var_discovered_block_markers = [];

addMissionEventHandler ["MarkerCreated", {
	params ["_marker", "_channelNumber", "_owner", "_local"];
  if ((markerText _marker == blockMarkers_var_block_command_text) and (_owner == player)) then {
    [_marker] spawn blockMarkers_fnc_createAllBlockMarkersIfDefinedAreaBySavedAndGivenMarkers;
  };
}];
