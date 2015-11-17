//Disable AI
if (!isServer) exitWith {};

_unit = _this select 0;

{
	_x disableAI "TARGET";
	_x disableAI "AUTOTARGET";
	_x disableAI "FSM";
	_x disableAI "MOVE";
	_X setunitpos "up";
	//_x setBehaviour "CARELESS";
	_x setCombatMode "BLUE"
} foreach crew _unit;

//_unit disableAI "TARGET";
//_unit disableAI "AUTOTARGET";
//_unit disableAI "FSM";
//_unit disableAI "MOVE";
//_unit setBehaviour "CARELESS";