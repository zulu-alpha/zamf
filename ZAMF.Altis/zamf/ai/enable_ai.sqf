//Enable AI
//if (!isServer) exitWith {};

_unit = _this select 0;

_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";
_unit enableAI "MOVE";
_unit enableAI "ANIM";
_unit enableAI "TEAMSWITCH";
_unit enableAI "FSM";
_unit enableAI "AIMINGERROR";
_unit enableAI "SUPPRESSION";
_unit enableAI "CHECKVISIBLE";
_unit enableAI "COVER";
_unit enableAI "AUTOCOMBAT";
_unit enableAI "PATH";
_unit setBehaviour "AWARE";
_unit setCombatMode "YELLOW";
_unit setPos "AUTO";