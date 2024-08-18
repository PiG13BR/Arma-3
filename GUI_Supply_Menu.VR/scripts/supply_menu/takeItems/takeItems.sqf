params ["_amount"];
// Return a number when you select a item from the list
_index = lbCurSel 1503;
_magazine = lbData [1503, _index];

// Get the nearest box
_box = [] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\checkArea\checkNearBox.sqf";

if (isNil "_box") exitWith {hint localize "STR_SPAWN_BOX_FIRST"};

if ((_magazine isKindOf ["ItemCore", configFile >> "CfgWeapons"]) || (_magazine isKindOf ["DetectorCore", configFile >> "CfgWeapons"])) then {
	if !(_box distance spawnSupplyPos > 2) then {
	// If the crate is still in the spawn area, add stuff
	_box addItemCargoGlobal [_magazine, _amount];
	// Check if the box is full after adding the item (load command returns a number between 0-1, in other words "0-100% full")
		if (load _box >= 1) then {
			_success = [_box, _magazine, _amount] call CBA_fnc_removeItemCargo;
			sleep 0.1;
			hint localize "STR_BOX_FULL";
		}
}
} else {
// Get the data stored
if !(_box distance spawnSupplyPos > 2) then {
	// If the crate is still in the spawn area, add stuff
	_box addMagazineCargoGlobal [_magazine, _amount];
	// Check if the box is full after adding the item (load command returns a number between 0-1, in other words "0-100% full")
		if (load _box >= 1) then {
			_success = [_box, _magazine, _amount] call CBA_fnc_removeMagazineCargo;
			sleep 0.1;
			hint localize "STR_BOX_FULL";
		}
} else {
	hint localize "STR_NOBOXES_NEAR"
}
}