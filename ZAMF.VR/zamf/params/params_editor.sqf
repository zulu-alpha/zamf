paramsArray=[];
	
if (isClass (missionConfigFile/"Params")) then {
	private _c = count (missionConfigFile/"Params");
	for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do {
		private "_i";
		_paramName = (configName ((missionConfigFile >> "Params") select _i));
		paramsArray = paramsArray + [getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
	};
};
private _c = count paramsArray;
if (isNil "param1" && _c>0)then{param1=paramsArray select 0};
if (isNil "param2" && _c>1)then{param2=paramsArray select 1};