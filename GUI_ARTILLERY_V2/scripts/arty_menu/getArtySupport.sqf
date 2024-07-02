// Artillery support list
PIG_artillery_support = [arty1, arty2];

// Resets variables
PIG_fire_button = 0;
PIG_clicked = false;

// Always clear the main list box
lbClear 2100;

// Update the artillery list. Check if the unit is alive and has crew on it.
PIG_artillery_support = PIG_artillery_support select {(alive _x) && (count (fullCrew [_x, "gunner", false]) != 0)};

// Check if there are artillery vehicles inside the PIG_artillery_support
if (count PIG_artillery_support == 0) exitWith {
	hint "No artillery available"
};

// Get the name of each artillery in PIG_artillery_support and add to the first list box
{	
	_type = typeOf _x;
	// Filter the list with only artillery units. Those units have "artilleryScanner = 1" under CfgVehicles;
	if ((getNumber(configfile >> "CfgVehicles" >> _type >> "artilleryScanner") > 0)) then {
		_name = getText(configFile >> "CfgVehicles" >> _type >> "displayName");
		lbAdd [2100, _name];
		// Store list box data
		lbSetData [2100, _forEachIndex, _type];
	}
}forEach PIG_artillery_support;

// Add control event handler to the first list box
private _displayArty = ((findDisplay 1000) displayCtrl 2100);
sleep 0.1;
_displayArty ctrlAddEventHandler ["LBSelChanged",{
	params ["_control", "_lbCurSel", "_lbSelection"];

	// Clear the second list box
	lbClear 2101;

	// Get artillery list box data
	_arty = lbData [2100,_lbCurSel];

	// Get the selected artillery object and store it in a variable to be used later
	_gun = PIG_artillery_support select {typeOf _x == _arty};
	uiNamespace setVariable ["artySelected", _gun];

	// Get artillery ammo
	_ammo = getArtilleryAmmo _gun;

	// Add the name of the available magazines to the second list box
	{
		_name = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
		lbAdd [2101, _name];
		lbSetData [2101, _forEachIndex,_x];
	}forEach _ammo;
}];

// Add control event handler for the second list box
private _displayAmmo = ((findDisplay 1000) displayCtrl 2101);
sleep 0.1;
_displayAmmo ctrlAddEventHandler ["LBSelChanged",{
	params ["_control", "_lbCurSel", "_lbSelection"];

	// Clear the third list box
	lbClear 2102;

	// Get the artillery object from the stored variable
	_arty = uiNamespace getVariable "artySelected";
	// Check avaiable magazines and how many rounds per magazine
	_magArray = magazinesAmmo _arty;
	// Select only rounds left for the selected magazine (The order of the _magArray respects the order of the list box)
	// If some magazine is empty, the array in _magArray will be deleted.
	_rounds = (_magArray select _lbCurSel) select 1;
	_allRounds = [];

	// Add how many rounds the player can select for the magazine selected in the second list box. From 1 to the number of rounds.
	for "_i" from 1 to _rounds do {
		lbAdd [2102, str _i];
		_allRounds pushBack _i;
	};
	
	// Store the data to be used later
	{
		lbSetValue [2102, _forEachIndex, _x];
	}forEach _allRounds;

}];

// Add event handler for the map
[ "arty_event", "onMapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	// Get position from the onMapSingleClick (_pos)
	PIG_artyPos = _pos;
	PIG_clicked = true;
	// Create a placeholder marker for targetting
	_createMarker = createMarkerLocal ["marker_arty", PIG_artyPos];
	"marker_arty" setMarkerTypeLocal "hd_objective";
	"marker_arty" setMarkerTextLocal "Target";
	"marker_arty" setMarkerPos PIG_artyPos;
}] call BIS_fnc_addStackedEventHandler;

// Wait until player clicks on the map or closes the map
waitUntil {
	sleep 1;
	PIG_clicked || !(dialog)
};

// Wait until the player closes the dialog and not clicked on the fire button OR if the player clicked on the fire button
waitUntil {
	sleep 1;
	(!(dialog) && (PIG_fire_button == 0)) || (PIG_fire_button == 1);
};

// Check if the player closes the dialog before clicking the fire button
if (!(dialog) && PIG_fire_button == 0) exitWith {
	deleteMarkerLocal "marker_arty";
	// if the player clicks on right area, it runs the rest of the code below
	["arty_event", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};