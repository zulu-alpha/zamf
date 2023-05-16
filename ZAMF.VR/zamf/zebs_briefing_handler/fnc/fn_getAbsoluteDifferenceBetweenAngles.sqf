// Gets the absolute difference between two angles.
params ["_a", "_b"];
private _diff = abs (_a - _b);
if (_diff > 180) then {
  _diff = 360 - _diff;
};
_diff
