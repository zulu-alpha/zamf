if (isServer) then {
	nul = [] spawn {
		if (loadFile "markers.sqf" != "") then {
			markers = [] call compile preprocessFileLineNumbers "markers.sqf";
			{
				private _mk_name = "opord_" + (_x select 0);
				private _mk = createMarker [_mk_name, _x select 5];
				_mk setMarkerAlpha (_x select 1);
				_mk setMarkerBrush (_x select 2);
				_mk setMarkerColor (_x select 3);
				_mk setMarkerDir (_x select 4);
				_mk setMarkerShape (_x select 6);
				_mk setMarkerSize (_x select 7);
				_mk setMarkerText (_x select 8);
				_mk setMarkerType (_x select 9);
			} forEach markers;
		};
	};
};
