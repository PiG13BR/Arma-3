/*
[1] execVM 'getItems.sqf'; 	// Grenades
[2] execVM 'getItems.sqf';	// Explosives
[3] execVM 'getItems.sqf';	// Medical
[4] execVM 'getItems.sqf';	// Misc
*/
params["_selection"];
lbClear 1503;

_arrayItems = [];
private _cfg = "";
switch (_selection) do {
	case 1 : {
		_cfg = "cfgMagazines";
		_arrayItems = PIG_all_grenades;
	};
	case 2 : {
		_cfg = "cfgMagazines";
		_arrayItems = PIG_all_explosives;
	};
	case 3 : {
		_cfg = "cfgWeapons";
		_arrayItems = PIG_all_medical
	};
	case 4 : {
		_cfg = "cfgWeapons";
		_arrayItems = PIG_all_misc
	};
};

missionNamespace setVariable ["cfgCfg", _cfg];

{
	_itemName = getText (configfile >> _cfg >> _x >> "displayName");
	lbAdd [1503,_itemName];
	lbsetData [1503, _forEachIndex, _x];
}forEach _arrayItems;

// EH to the the pictures
_display = ((findDisplay 1003) displayCtrl 1503);
sleep 0.1;
_event = _display ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	_cfg = missionNamespace getVariable "cfgCfg";
	
	// Picture
	_item = lbData [1503,_lbCurSel];
	_itemPicture = getText (configfile >> _cfg >> _item >> "picture");
	ctrlSetText [1202, _itemPicture];
}];

// Select the first element of the list
lbSetCurSel [1503, 0];