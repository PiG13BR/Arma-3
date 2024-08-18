params ["_amount"];
// Return a number when you select a item from the list
_index = lbCurSel 1501;
_magazine = lbData [1501, _index];
if (_magazine == "") exitWith {["Não há classe de munição definida"] call bis_fnc_error};

// Get the nearest box
_box = [] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\checkArea\checkNearBox.sqf";
// Check if the player spawned a box, if not, exit the script
if (isNil "_box") exitWith {hint localize "STR_SPAWN_BOX_FIRST"};

if !(_box distance spawnSupplyPos > 2) then {
	if (_magazine in PIG_discard_launchers) then {
		_box addWeaponCargoGlobal [_magazine, _amount];
		// Check if the box is full after adding the item (load command returns a number between 0-1, in other words "0-100% full")
		if (load _box >= 1) then {
			for "_i" from 1 to _amount do {
				_success = [_box, _magazine] call CBA_fnc_removeWeaponCargo;
			};	
			sleep 0.1;
			hint localize "STR_BOX_FULL";
		}
	} else {
		_box addMagazineCargoGlobal [_magazine, _amount];
		//_quantidade = load _box;
		//hint str _quantidade;
		// Check if the box is full after adding the item (load command returns a number between 0-1, in other words "0-100% full")
		if (load _box >= 1) then {
			_success = [_box, _magazine, _amount] call CBA_fnc_removeMagazineCargo;
			sleep 0.1;
			hint localize "STR_BOX_FULL";
		};
	}
	// If the crate is still in the spawn area, add stuff
} else {
	hint localize "STR_NOBOXES_NEAR"
}

