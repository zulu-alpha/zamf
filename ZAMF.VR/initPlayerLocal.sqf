////////////Script Written by DriftingNitro//////////////
//////////Help from Commy2, Dedmen, and Dscha////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
//Spawns a thread that will loop for each player and   //
//output their FPS to the server to be read by the zeus//
/////////////////////////////////////////////////////////
[] spawn {
   while {true} do {
        player setVariable ["DNI_PlayerFPS", floor diag_fps, true];
        sleep 0.1;
    };
};
/////////////////////////////////////////////////////////
//Waits until curators are initalized in order to check//
//if player is zeus to run the fps scripts             //
/////////////////////////////////////////////////////////
waitUntil {
    private _hasCurators = (count allcurators) > 0;
    private _hasInitializedCurators = (count (call BIS_fnc_listCuratorPlayers)) > 0;
    private _curatorsInitialized = !_hasCurators || _hasInitializedCurators;
    ((time > 2) || _curatorsInitialized)
    };
/////////////////////////////////////////////////////////
//If player is a curator it will run the script and each/
//player will have their FPS appear beneath them       //
/////////////////////////////////////////////////////////
if (player in (call bis_fnc_listcuratorplayers)) then {
	addMissionEventHandler ["Draw3D", {
		{
			_distance = position curatorCamera distance _x;
			//if zeus camera is farther than 1200 meters away from the targets the text will not display
			if (_distance < 1200) then {
				_playerFPS = _x getVariable ["DNI_PlayerFPS",50];
				//if the FPS is below 20 it turns red and becomes more visible for zeus to see so they are aware
				if (_playerFPS  <20) then 
				{
					drawIcon3D
					[
						"",//Path to image displayed near text
						[1,0,0,0.7],//color of the text using RGBA
						position _x,//position of the text _x referring to the player in 'allPlayers'
						1,//Width
						2,//height from position, below
						0,//angle
						format["%1 FPS: %2", name _x, str _playerFPS],//text to be displayed
						0,//shadow on text, 0=none,1=shadow,2=outline
						0.05,//text size
						"PuristaMedium",//text font
						"center"//align text left, right, or center
					];
				}
				//if the FPS is above 20 text is smaller and less visible as to not conern zeus as much
				else
				{
					drawIcon3D
					[
						"",//Path to image displayed near text
						[1,1,1,0.3],//color of the text using RGBA
						position _x,//position of the text _x referring to the player in 'allPlayers'
						1,//Width
						2,//height from position, below
						0,//angle
						format["%1 FPS: %2", name _x, str _playerFPS],//text to be displayed
						0,//shadow on text, 0=none,1=shadow,2=outline
						0.03,//text size
						"PuristaMedium",//text font
						"center"//align text left, right, or center
					];
				};
			};
		} forEach allPlayers;
		//Here is the array of units you wish to display the FPS text for, it can be 
		//changed to be an array of specific units or players if you wish
	}];
};
