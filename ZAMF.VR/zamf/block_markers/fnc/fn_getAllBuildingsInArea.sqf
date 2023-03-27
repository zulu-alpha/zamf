// Gets all the buildings in a rectangular area, defined by it's sides and angle.
// Buildings are sorted relative to the distance of the given sorting position, farthest first.
params ["_a", "_b", "_angle", "_center", "_sorting_pos"];
private _radius = if (_a > _b) then {_a} else {_b};
private _extra_area_margin = 1.5;
_radius = _radius * _extra_area_margin;
private _objects = nearestObjects [_center, ["house", "building"], _radius];
private _in_area_objects = _objects inAreaArray [_center, _a / 2, _b / 2, _angle, true];
[
_in_area_objects,
[_sorting_pos],
{_input0 distance _x},
"DESCEND",
{count (_x buildingPos -1) > 0}
] call BIS_fnc_sortBy;
