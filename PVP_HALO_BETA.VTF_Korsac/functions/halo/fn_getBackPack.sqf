params["_unit", "_backpack", "_backpackcontents"];

waitUntil {
	!alive _unit || isTouchingGround _unit
};
// Give back the player's backpack

if (_backpack != "" && _backpack != "B_Parachute") then {
	sleep 2;
	_unit addBackpack _backpack;
	clearAllItemsFromBackpack _unit;
	{
		_unit addItemToBackpack _x
	} forEach _backpackcontents;
};