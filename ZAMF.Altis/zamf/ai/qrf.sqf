//_qrf = [thislist,QRF1] execvm "ai\qrf.sqf";
if !(isserver) exitwith {};

_thislist = _this select 0;
_qrf = _this select 1;

if (!(isNil "zamf_debug") && {zamf_debug}) then {diag_log format ["QRF_REINFORCEMENT: _thislist %1, _qrf %2", _thislist, _qrf]};

private ["_i"];
_i = 0;

while {!((_thislist select _i) iskindof "land")} do {
	if (_i >= (count _thislist)) exitwith {
	};
	_i = _i+1;
};

if ((_thislist select _i) iskindof "land") then {

		//hint format["triggered: %1\n element in array: %2\nQRF group: %3\nIskindof: %4\nnumber of units: %5",_thislist select _i,_i,_qrf,((_thislist select _i) iskindof "land"), count _thislist];
		[_qrf, 2] setWPPos (getPos (_thisList select _i));

	}else{
		//hint "Land unit not found";
};
