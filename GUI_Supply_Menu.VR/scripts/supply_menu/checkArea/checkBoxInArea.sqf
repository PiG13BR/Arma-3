private _centerPos = getPos spawnSupplyPos; 
private _radius = 4; 
_objects = _centerPos nearSupplies _radius;

if (isNil "_objects" || count _objects == 0) exitWith {hint localize "STR_NOBOXES_NEAR";};

_objClass = [];
{
	_classObject = typeOf _x;
	_objClass pushBack _classObject;
}forEach _objects;

// Update the objClass array with only supplies boxes provided by PIG_boxes
_objClass = _objClass arrayIntersect PIG_boxes;

// Select the nearest box
private _nearBox = objNull;
{
	_nearBox = nearestObject [spawnSupplyPos, _x];
}forEach _objClass;

closeDialog 0;

createDialog "PIG_RscConfirmDelete";

// Return
_nearBox