// Create a marker name that is user generated, using the given index.
params ["_new_blockMarkers_var_marker_index"];
private _channel_id = blockMarkers_var_marker_channel;
private _name = format ["_USER_DEFINED #%1/%2/%3", clientOwner, _new_blockMarkers_var_marker_index, _channel_id];
_name
