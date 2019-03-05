//View Distance

[_this] spawn {
	params ["_distance"];
	waitUntil {time > 10};
	setViewDistance _distance;
};