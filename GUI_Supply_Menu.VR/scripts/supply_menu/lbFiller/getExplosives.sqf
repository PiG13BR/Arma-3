lbClear 1503;

{
	_explosiveName = getText (configfile >> "CfgMagazines" >> _x >> "displayName");
	lbAdd [1503,_explosiveName];
	lbsetData [1503, _forEachIndex, _x];
}forEach PIG_all_explosives;

// EH to the the pictures
_display = ((findDisplay 1003) displayCtrl 1503);
sleep 0.1;
_event = _display ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	
	// Picture
	_item = lbData [1503,_lbCurSel];
	_itemPicture = getText (configfile >> "CfgMagazines" >> _item >> "picture");
	ctrlSetText [1202, _itemPicture];
}];

// Select the first element of the list
lbSetCurSel [1503, 0];
