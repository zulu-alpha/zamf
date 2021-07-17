if (isServer) then {
	nul = [] spawn {
		if (loadFile "markers.sqf" != "") then {
			markers = [] call compile preprocessFileLineNumbers "markers.sqf";
			{
				_x params [
					"_name",
					"_alpha",
					"_brush",
					"_color",
					"_dir",
					"_pos",
					"_shape",
					"_size",
					"_text",
					"_type",
					"_poly"
				];
				private _mk = createMarker ["opord_" + _name, _pos];
				_mk setMarkerAlpha _alpha;
				_mk setMarkerBrush _brush;
				_mk setMarkerColor _color;
				_mk setMarkerDir _dir;
				_mk setMarkerShape _shape;
				_mk setMarkerSize _size;
				_mk setMarkerText _text;
				_mk setMarkerType _type;
				if (_shape == "POLYLINE") then {
					_mk setMarkerPolyline _poly;
				};
			} forEach markers;
		};
	};
};
