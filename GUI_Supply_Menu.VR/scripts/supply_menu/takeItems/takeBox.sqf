// Return a number when you select a item from the list
_index = lbCurSel 1502;
private _boxSelected = lbData [1502, _index];

// Check if a crate is in the spawn area
private _centerPos = getPos spawnSupplyPos;
private _radius = 2;
//private _objectsToDelete = _centerPos nearObjects ["All", _radius];
private _objects = _centerPos nearSupplies _radius;

if (count _objects > 0) then {
	hint localize "STR_BLOCKING_SPAWN"
} else {
sleep 0.1;
_box = createVehicle [_boxSelected, spawnSupplyPos, [], 0, "CAN_COLLIDE"];
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

//_box addAction ["Push Crate", {(_this select 0) setPos ((_this select 0) getPos [1, (player getDir (_this select 0))])}];
// If you use ace, uncomment this:
[_box, true, [0, 3, 1], 10, true] call ace_dragging_fnc_setCarryable;
}