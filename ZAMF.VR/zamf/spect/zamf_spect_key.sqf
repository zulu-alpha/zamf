// Terminate EG Spectator when the key is pressed, if you are not waiting for a resapwn timer.
[] spawn {
	while {true} do {
		waitUntil {inputAction "Gear" > 0};
		if (playerRespawnTime < 0) then {
			["Terminate"] call BIS_fnc_EGSpectator;
		};
	};
};
