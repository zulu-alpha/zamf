//Disable AI
if (!isServer) exitWith {};

_unit = _this select 0;

{
	_x disableAI "ALL";
	_X setunitpos "up";
	_x setCombatMode "BLUE";
	_x setBehaviour "CARELESS";
} foreach crew _unit;
