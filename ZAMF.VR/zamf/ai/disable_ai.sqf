//Disable AI
if (!isServer) exitWith {};

params ["_unit"];

{

	_x disableAI "TARGET";
	_x disableAI "AUTOTARGET";
	_x disableAI "MOVE";
	//_x disableAI "ANIM";
	_x disableAI "TEAMSWITCH";
	_x disableAI "FSM";
	_x disableAI "AIMINGERROR";
	_x disableAI "SUPPRESSION";
	//_x disableAI "CHECKVISIBLE";
	_x disableAI "COVER";
	_x disableAI "AUTOCOMBAT";
	_x disableAI "PATH";

	_x setBehaviour "CARELESS";
	_x setCombatMode "BLUE";
	_x setUnitPos "UP";

} foreach crew _unit;
