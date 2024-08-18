lbClear 1500;

_fobWeapons = fob nearObjects ["StaticWeapon", 20];
buttonCrew = 0;
deleteCrew = 0;

{
	_type = typeOf _x;
	_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");
	lbAdd [1500, _name];
	lbSetData [1500, _forEachIndex, _type];
}forEach _fobWeapons;

sleep 0.1;

_display = ((findDisplay 1301) displayCtrl 1500);
_event = _display ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];

	// Weapon's picture
	_staticWeapon = lbData [1500,_lbCurSel];
	_weaponPic = getText (configFile >> "CfgVehicles" >> _staticWeapon >> "editorPreview");
	ctrlSetText [1200, _weaponPic];
}];

lbSetCurSel [1500, 0];

waitUntil {!dialog || (buttonCrew == 1 || buttonCrew == 2 || deleteCrew == 1)};

if (buttonCrew == 1) then {
	{
		createVehicleCrew _x
	}forEach _fobWeapons;

	closeDialog 0;
};

if (buttonCrew == 2) then {
	_num = lbCurSel 1500;
	_weaponSel = _fobWeapons select _num;
	createVehicleCrew _weaponSel;
};

if (deleteCrew == 1) then {
	_num = lbCurSel 1500;
	_weaponSel = _fobWeapons select _num;
	deleteVehicleCrew _weaponSel;
};

execVM "scripts\findStaticWeapons.sqf"
