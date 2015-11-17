_units = if (!isMultiplayer) then {switchableUnits} else {playableUnits};

{
	_x disableAI "TARGET";
	_x disableAI "AUTOTARGET";
	_x disableAI "FSM";
	_x disableAI "MOVE";
	_X setunitpos "up";
	_x setBehaviour "CARELESS";
	_x setCombatMode "BLUE"
} foreach _units;