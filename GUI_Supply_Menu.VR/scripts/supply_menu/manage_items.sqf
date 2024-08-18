_box = [] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\checkArea\checkNearBox.sqf";
if (isNull _box) exitWith {
	hint localize "STR_NOBOXES_NEAR";
	execVM "scripts\supply_menu\openSupplyMenu.sqf"
};

createDialog "PIG_RscMenuManageItems";

PIG_selection_item = 1;
execVM "scripts\supply_menu\lbFiller\get_items_box\get_box_all.sqf"