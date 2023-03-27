// Gets the direction of the first marker that isn't 0, else 0
private _markers = _this;
private _direction = 0;
{
  _direction = markerDir _x;
  if (_direction != 0) exitWith {_direction};
} forEach _markers;
_direction
