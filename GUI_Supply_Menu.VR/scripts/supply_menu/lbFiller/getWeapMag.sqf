if (count PIG_all_weapons == 0) exitWith {["No weapons provided in menu_config.sqf"] call bis_fnc_error};
if (count PIG_all_magazines == 0) exitWith {["No ammunition provided in menu_config.sqf"] call bis_fnc_error};
// Fill the left box with all available weapons
{
	_weaponName = getText (configfile >> "CfgWeapons" >> _x >> "displayName");
	lbAdd [1500, _weaponName];
	// Store a data of the weapon array
	lbsetData [1500, _forEachIndex, _x];
}forEach PIG_all_weapons;

// EH for the weapon list box to get the compatible munition pre-listed (weaponList.sqf) & picture of the weapon and fill the right box
_display = ((findDisplay 1002) displayCtrl 1500);
sleep 0.1;
_event = _display ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];

	// Get the data from the weapon list box
	_weapon = lbData [1500,_lbCurSel];
	// Get the compatible ammo for the selected weapon
	_compatMag = compatibleMagazines _weapon;
	// Get only the classes that repeats in these arrays (the ones that are compatible to the class and the ones that are AVAILABLE in weaponList.sqf)
	private _magArray = _compatMag arrayIntersect PIG_all_magazines;

	// Clear the right list box
	lbClear 1501;

	// if _magArray is empty: or you need to check PIG_all_magazines or it's a disposable launcher 
	if (count _magArray  == 0) then {
		if (_weapon in PIG_discard_launchers) then {
			// Adds disposable launcher on the magazine list box
			_weapon = lbData [1500,_lbCurSel];
			// Get the name
			_magazineName = getText (configfile >> "CfgWeapons" >> _weapon >> "displayName");
			// Add to the list box on the right
			_index = lbAdd [1501, _magazineName];
			// Store the data
			lbsetData [1501, _index, _weapon];
		} else {
			["No compatible magazines found. Check your menu_config.sqf"] call bis_fnc_error;
		}
	} else {
	// Cycle the _magArray to get each magazine's name to display on the list box
	{
		// Get the name
		_magazineName = getText (configfile >> "CfgMagazines" >> _x >> "displayName");
		// Add to the list box on the right
		lbAdd [1501, _magazineName];
		// Store the data
		lbsetData [1501, _forEachIndex, _x];
	}forEach _magArray;
	};

	// Weapon's picture
	_weaponPicture = getText (configfile >> "CfgWeapons" >> _weapon >> "picture");
	ctrlSetText [1200, _weaponPicture];
}];

// Select the first element of each list
lbSetCurSel [1500, 0];
lbSetCurSel [1501, 0];