// Deletes the nearest box
_box = [] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\checkArea\checkNearBox.sqf";

closeDialog 0;

deleteVehicle _box;
Uisleep 0.1;
createDialog "PIG_RscMenuBox";
execVM "scripts\supply_menu\lbFiller\getBoxes.sqf"
