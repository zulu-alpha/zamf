private ["_clouds", "_fogValue", "_fogDecay", "_fogBase", "_fogValue", "_fogDecay"];
//time setFog [fogValue, fogDecay, fogBase]
_clouds = _this select 0;
_fogValue = _this select 1;
_fogDecay = _this select 2;
_fogBase = _this select 3;

_fogValue = _fogValue / 10;
_fogDecay = _fogDecay / 100;

if (_fogValue <= -1) then {
	_fogValue = fog;
};

//testvar = ( (_fogValue > 0) || {fog != 0} );
testvar = (_fogDecay > 0) || {_fogBase > 0};

if ( 
		( (_fogValue > 0) || {fog != 0} ) 
		|| {(_fogDecay > 0) || {_fogBase > 0}}
	) then {
	0 setFog [_fogValue, _fogDecay, _fogBase];
};

if (_clouds > -1) then {
	Switch (_clouds) do {
		case 0: //Clear
		{
			0 setOvercast 0.3;
			//0 setFog 0;
		};

		case 1: //Overcast
		{
			0 setOvercast 0.6;
	        //0 setFog 0.1;
		};
	
		case 2: //Stormy
		{
	        0 setOvercast 1;
			//0 setFog 0.35;
	        0 setRain 1;
		};
	};
};