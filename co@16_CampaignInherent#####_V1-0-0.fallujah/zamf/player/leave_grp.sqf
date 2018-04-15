if (hasInterface) then {
	waitUntil { !isNull player };
	waitUntil { player == player };
	
	_side = side player;
	_group = createGroup _side;
	[player] join _group;
};