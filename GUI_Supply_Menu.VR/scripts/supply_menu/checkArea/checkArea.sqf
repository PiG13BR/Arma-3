//private _Boxarray = missionNamespace getVariable "allBoxes";

private _centerPos = getPos spawnSupplyPos; 

private _radius = 4; 

_objectsToDelete = _centerPos nearSupplies _radius;

// Combines just the crates from the box list
if (isNil "_objectsToDelete") exitWith {hint localize "STR_NOBOXES_DELETE";};

_objClass = [];
{
	_classObject = typeOf _x;
	_objClass pushBack _classObject;
}forEach _objectsToDelete;

_objClass = _objClass arrayIntersect PIG_boxes;

if (count _objClass == 0) exitWith {
	hint localize "STR_NOBOXES_DELETE";
};

missionNamespace setVariable ["objectsArea",_objectsToDelete];

closeDialog 0;

createDialog "PIG_RscConfirmClear";