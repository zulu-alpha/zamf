// Takes an index and converts it to a color.
params ["_index"];
private _colors = blockMarkers_var_block_colors;
private _color = _colors select (_index mod (count _colors));
_color
