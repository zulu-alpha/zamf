params ["_new_unit", "_old_unit", "_respawn", "_respawn_delay"];

_new_unit setPosASL [(getPosASL _new_unit) select 0, (getPosASL _new_unit) select 1, 9];
