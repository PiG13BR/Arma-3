//["Open", false] spawn BIS_fnc_arsenal;
[player, player, false] call ace_arsenal_fnc_openBox;

private _backpack = backpack player;
[_backpack] call KPLIB_fnc_checkGear;