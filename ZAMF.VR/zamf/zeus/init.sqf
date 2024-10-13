if (isServer) then {
    [] spawn {
        waitUntil {time > 1};
        {
            if (count (curatorAddons _x) > 0 ) then {
                nul = [_x, true] execVM "zamf\zeus\ADV_zeus.sqf";
            };
        } count allCurators;
    };
};
