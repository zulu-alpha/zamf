_units = if (!isMultiplayer) then {switchableUnits} else {playableUnits};

{
	if !(isPlayer _x) then {
		[_x] execVM "zamf\ai\disable_ai.sqf";
	};
} foreach _units;