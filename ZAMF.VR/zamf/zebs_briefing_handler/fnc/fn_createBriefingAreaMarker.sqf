// Create an area marker for the briefing table.
params ["_name", "_alpha", "_color", "_brush", "_a", "_b", "_angle", "_center", "_channel"];

_mk = createMarkerLocal [_name, _center, _channel, player];
_mk setMarkerShapeLocal "RECTANGLE";
_mk setMarkerAlphaLocal _alpha;
_mk setMarkerColorLocal _color;
_mk setMarkerBrushLocal _brush;
_mk setMarkerSizeLocal [_a, _b];
_mk setMarkerDir _angle;
