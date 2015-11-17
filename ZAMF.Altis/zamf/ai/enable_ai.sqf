//Enable AI
//if (!isServer) exitWith {};

_unit = _this select 0;

_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";
_unit enableAI "FSM";
_unit enableAI "MOVE";
_unit setBehaviour "AWARE";