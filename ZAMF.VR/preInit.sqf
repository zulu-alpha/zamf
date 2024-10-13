if (isServer) then {
	nul = [] spawn {
		if (loadFile "markers.sqf" != "") then {
			private _players_markers = [] call compile preprocessFileLineNumbers "markers.sqf";
			_players_markers params ["_player_name", "_markers"];
			private _player_part = [];
			private _machine_id = 0;
			private _channel_id = -1;
			{
				if (name _x == _player_name) exitWith {
					_machine_id = owner _x;
					_channel_id = 1;
					_player_part = [_channel_id, _x];
				}
			} forEach allPlayers;
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
				_marker_name = format ["_USER_DEFINED #%1/%2/%3" , _machine_id, _forEachIndex, _channel_id];
				private _mk = createMarker ([_marker_name, _pos] + _player_part);
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
			} forEach _markers;
		};
	};
};
