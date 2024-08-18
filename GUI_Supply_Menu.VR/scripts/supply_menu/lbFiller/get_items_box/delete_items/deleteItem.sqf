_box = [] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\checkArea\checkNearBox.sqf";
if (isNull _box) exitWith {
	hint localize "STR_NOBOXES_NEAR"
};

_index = lbCurSel 1504;
_item = lbData [1504, _index];

if ((_item isKindOf ["ItemCore", configFile >> "CfgWeapons"]) ||
(_item isKindOf ["DetectorCore", configFile >> "CfgWeapons"])) then {
	[_box, _item, 1] call CBA_fnc_removeItemCargo;
} else {
	if ((_item isKindOf ["Rifle", configFile >> "cfgWeapons"])  ||
	(_item isKindOf ["Launcher", configFile >> "cfgWeapons"])) then {
		[_box, _item, 1] call CBA_fnc_removeWeaponCargo;
	} else {
		[_box, _item, 1] call CBA_fnc_removeMagazineCargo;
	};
};

lbClear 1504;
// Update list for the selected filter
// PIG_selection_items defined on menu_manage_items.hpp (1 = all items; 2 = Magazines; 3 = Grenades, etc)
switch (PIG_selection_item) do {
	case 1 : {
		// All items
		execVM 'scripts\supply_menu\lbFiller\get_items_box\get_box_all.sqf';
	};
	case 2 : {
		// Magazines
		execVM 'scripts\supply_menu\lbFiller\get_items_box\get_box_magazines.sqf';
	};
	case 3 : {
		// Grenades
		execVM "scripts\supply_menu\lbFiller\get_items_box\get_box_grenades.sqf";
	};
	case 4 : {
		// Explosives
		execVM "scripts\supply_menu\lbFiller\get_items_box\get_box_explosives.sqf";
	};
	case 5 : {
		// Medical Items
		execVM "scripts\supply_menu\lbFiller\get_items_box\get_box_medical.sqf";
	};
	case 6 : {
		// Misc
		execVM "scripts\supply_menu\lbFiller\get_items_box\get_box_misc.sqf";
	};
}
