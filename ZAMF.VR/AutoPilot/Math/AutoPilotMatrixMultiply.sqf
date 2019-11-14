// AutoPilotMatrixMultiply.sqf
// © v.2.0 June 2017 - Devastator_cm

private _A 		= _this select 0;
private _B 		= _this select 1;
private _m 		= count _A;
private _n1 	= count (_A select 0);
private _n2 	= count _B;
private _p 		= count (_B select 0);
private _result = [];
private _i 		= 0;
private _c 		= 0;
private _ni		= 0;
private _sum 	= 0;

for "_i" from 0 to (_m - 1) step 1 do {
	_result pushBack [];
};

for "_i" from 0 to (_m - 1) step 1 do {
	for "_c" from 0 to (_p - 1) do {
		_sum = 0;
		for "_ni" from 0 to (_n1 - 1) do {
			_sum = _sum + (((_A select _i) select _ni) * ((_B select _ni) select _c));
		};
		(_result select _i) set [_c, _sum];
	};
};

_result