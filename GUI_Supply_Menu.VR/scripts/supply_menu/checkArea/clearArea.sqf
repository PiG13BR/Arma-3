closeDialog 0;

_objectsToDelete = missionNamespace getVariable "objectsArea";

{
    deleteVehicle _x;
}forEach _objectsToDelete;
Uisleep 0.1;
createDialog "PIG_RscMenuBox";
execVM "scripts\supply_menu\lbFiller\getBoxes.sqf"
