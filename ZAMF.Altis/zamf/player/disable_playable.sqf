_units = if (!isMultiplayer) then {switchableUnits} else {playableUnits};

{
	[_x] execVM "zamf\ai\disable_ai.sqf";
} foreach _units;