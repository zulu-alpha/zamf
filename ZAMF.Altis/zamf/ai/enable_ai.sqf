//Enable AI
//if (!isServer) exitWith {};

_unit = _this select 0;

_unit enableAI "ALL";
_unit setBehaviour "AWARE";