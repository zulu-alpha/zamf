/*

	AUTHOR: Phoenix

	DESCRIPTION:
	This gets the data to be saved onto the server

	PARAMETER(S):
	0 : target unit

	RETURNS:
	Array containing:
		side _player,
		alive _player,
		getPosASL _player,
		getDir _player,
		getDammage _player,
		if (alive _player) then {getUnitLoadout _player} else {[]},
		captiveNum _player,
		animationState _player,
		_crew,
		typeOf _player,
		hasEar plugs,
		roleDescription

	EG: [
		WEST,
		true,
		[14707.4,16637.8,17.9114],
		107.612,
		0,
		[["ItemMap","ItemCompass","ItemWatch","tf_anprc152_1","ItemGPS","NVGoggles_INDEP","AGM_Vector","h_milcap_kampat_transitional","G_Lowprofile"],"",[],"",[],"",[],"u_uniform3_kampat_transitional",["AGM_EarBuds","ALIVE_Tablet","AGM_MapTools","AGM_IR_Strobe_Item"],"v_platecarrier1_kampat_transitional",["AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage"],"tf_rt1523g",["AGM_Bandage","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Epipen","AGM_Bandage","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Epipen"],[[],[],[]],"",""],
		0,
		"amovpercmstpsnonwnondnon",
		[B 0:1 (Phoenix),""],
		"B_Soldier_SL_F",
		false,
		"1'1 [R]"
	]

*/

params ["_player"];

_player = _this select 0;

private _vehicle = vehicle _player;

// Check if the player is in a vehicle. If so, determine where. If not in driver, gunner or commander, then in cargo.
private _crew = call {

	if (_vehicle == _player) exitWith {[_vehicle, ""]};
	if (driver _vehicle == _player) exitWith {[_vehicle, "Driver"]};
	if (gunner _vehicle == _player) exitWith {[_vehicle, "Gunner"]};
	if (commander _vehicle == _player) exitWith {[_vehicle, "Commander"]};
	[_vehicle, "Cargo"]

};

// Return Array
[
	side _player,
	alive _player,
	getPosASL _player,
	getDir _player,
	getDammage _player,
	if (alive _player) then {getUnitLoadout _player} else {[]},
	captiveNum _player,
	animationState _player,
	_crew,
	typeOf _player,
	[_player] call ace_Hearing_fnc_hasEarPlugsIn,
	roleDescription _player
]