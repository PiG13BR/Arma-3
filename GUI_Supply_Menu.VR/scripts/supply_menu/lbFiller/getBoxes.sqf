if (count PIG_boxes == 0) exitWith {["No boxes provided in menu_config.sqf"] call bis_fnc_error};
{
	_boxName = getText (configfile >> "CfgVehicles" >> _x >> "displayName");
	lbAdd [1502, _boxName];
	lbsetData [1502, _forEachIndex, _x];
}forEach PIG_boxes;

// EH to the the pictures
_display = ((findDisplay 1001) displayCtrl 1502);
_event = _display ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	
	// Box's picture
	_box = lbData [1502,_lbCurSel];
	_boxPicture = getText (configfile >> "CfgVehicles" >> _box >> "editorPreview");
	ctrlSetText [1202, _boxPicture];
}];

// Select the first element of the list
lbSetCurSel [1502, 0];