private _units = if (!isMultiplayer) then {switchableUnits} else {playableUnits};
{_x setVariable ["BIS_noCoreConversations", true]} forEach _units;