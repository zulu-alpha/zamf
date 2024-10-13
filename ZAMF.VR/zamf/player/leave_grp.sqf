if (hasInterface) then {
	waitUntil { !isNull player };
	waitUntil { player == player };
	
	private _side = side player;
	private _group = createGroup _side;
	[player] join _group;
};