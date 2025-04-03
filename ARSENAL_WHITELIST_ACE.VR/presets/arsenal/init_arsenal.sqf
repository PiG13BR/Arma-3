// From KPLIB

private _crawled = [] call KPLIB_fnc_crawlAllItems;
private _weapons = [];
private _magazines = [];
private _items = [];
private _backpacks = [];
KP_liberation_allowed_items = [];

if (isNil "PIG_arsenal_weapons") then {
	PIG_arsenal_weapons = []
};
if (isNil "PIG_arsenal_magazines") then {
	PIG_arsenal_magazines = []
};
if (isNil "PIG_arsenal_items") then {
	PIG_arsenal_items = []
};
if (isNil "PIG_arsenal_backpacks") then {
	PIG_arsenal_backpacks = []
};
if (isNil "blacklisted_from_arsenal") then {
	blacklisted_from_arsenal = []
};

if ((count PIG_arsenal_weapons) == 0) then {
        if ((count blacklisted_from_arsenal) == 0) then {
            _weapons = _crawled select 0;
        } else {
            {if (!(_x in blacklisted_from_arsenal)) then {_weapons pushBack _x};} forEach (_crawled select 0);
        };
        [missionNamespace, _weapons] call BIS_fnc_addVirtualWeaponCargo;
        KP_liberation_allowed_items append _weapons;
    } else {
        [missionNamespace, PIG_arsenal_weapons] call BIS_fnc_addVirtualWeaponCargo;
        KP_liberation_allowed_items append PIG_arsenal_weapons;
    };

    // Support for CBA disposable launchers, https://github.com/CBATeam/CBA_A3/wiki/Disposable-Launchers
    if !(configProperties [configFile >> "CBA_DisposableLaunchers"] isEqualTo []) then {
        private _disposableLaunchers = ["CBA_FakeLauncherMagazine"];
        {
            private _loadedLauncher = cba_disposable_LoadedLaunchers get _x;
            if (!isNil "_loadedLauncher") then {
                _disposableLaunchers pushBack _loadedLauncher;
            };

            private _normalLauncher = cba_disposable_NormalLaunchers get _x;
            if (!isNil "_normalLauncher") then {
                _normalLauncher params ["_loadedLauncher"];
                _disposableLaunchers pushBack _loadedLauncher;
            };
        } forEach KP_liberation_allowed_items;
        KP_liberation_allowed_items append _disposableLaunchers;
    };

    if ((count PIG_arsenal_magazines) == 0) then {
        if ((count blacklisted_from_arsenal) == 0) then {
            _magazines = _crawled select 1;
        } else {
            {if (!(_x in blacklisted_from_arsenal)) then {_magazines pushBack _x};} forEach (_crawled select 1);
        };
        [missionNamespace, _magazines] call BIS_fnc_addVirtualMagazineCargo;
        KP_liberation_allowed_items append _magazines;
    } else {
        [missionNamespace, PIG_arsenal_magazines] call BIS_fnc_addVirtualMagazineCargo;
        KP_liberation_allowed_items append PIG_arsenal_magazines;
    };

    if ((count PIG_arsenal_items) == 0) then {
        if ((count blacklisted_from_arsenal) == 0) then {
            _items = _crawled select 2;
        } else {
            {if (!(_x in blacklisted_from_arsenal)) then {_items pushBack _x};} forEach (_crawled select 2);
        };
        [missionNamespace, _items] call BIS_fnc_addVirtualItemCargo;
        KP_liberation_allowed_items append _items;
    } else {
        [missionNamespace, PIG_arsenal_items] call BIS_fnc_addVirtualItemCargo;
        KP_liberation_allowed_items append PIG_arsenal_items;
    };

    if ((count PIG_arsenal_backpacks) == 0) then {
        if ((count blacklisted_from_arsenal) == 0) then {
            _backpacks = _crawled select 3;
        } else {
            {if (!(_x in blacklisted_from_arsenal)) then {_backpacks pushBack _x};} forEach (_crawled select 3);
        };
        [missionNamespace, _backpacks] call BIS_fnc_addVirtualBackpackCargo;
        KP_liberation_allowed_items append _backpacks;
    } else {
        [missionNamespace, PIG_arsenal_backpacks] call BIS_fnc_addVirtualBackpackCargo;
        KP_liberation_allowed_items append PIG_arsenal_backpacks;
    };

    {
        if ((_x find "rhs_acc") == 0) then {
            KP_liberation_allowed_items_extension append [_x + "_3d", _x + "_pip"];
        };
        if ((_x find "rhsusf_acc") == 0) then {
            KP_liberation_allowed_items_extension append [_x + "_3d", _x + "_pip"];
        };
    } forEach KP_liberation_allowed_items;

    if ((count KP_liberation_allowed_items_extension) > 0) then {
        KP_liberation_allowed_items append KP_liberation_allowed_items_extension;
    };

        [player, KP_liberation_allowed_items, false] call ace_arsenal_fnc_addVirtualItems;

    // Lowercase all classnames
    KP_liberation_allowed_items = KP_liberation_allowed_items apply {toLower _x};