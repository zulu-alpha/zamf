//View Distance

setViewDistance (_this);

_this spawn {
	waitUntil {time > 10};
	setViewDistance (_this);
};