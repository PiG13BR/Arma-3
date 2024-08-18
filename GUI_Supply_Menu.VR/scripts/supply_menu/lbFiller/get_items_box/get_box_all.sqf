params["_item", "_amount"];
lbClear 1504;

_box = [] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\checkArea\checkNearBox.sqf";
if (isNull _box) exitWith {
	hint localize "STR_NOBOXES_NEAR"
};

_boxMag = getMagazineCargo _box;
_boxWep = getWeaponCargo _box;
_boxItem = getItemCargo _box;

_magCount = _boxMag select 1;
_wepCount = _boxWep select 1;
_itemCount = _boxItem select 1;

_boxMagArray = _boxMag select 0;
_boxWepArray = _boxWep select 0;
_boxItemArray = _boxItem select 0;

_allItems = _boxMagArray + _boxWepArray + _boxItemArray;
_allItems = _allItems arrayIntersect _allItems;
_allCount = _magCount + _wepCount + _itemCount;

_nameCount = "";
{
	if (
	(_x isKindOf ["ItemCore", configFile >> "CfgWeapons"]) || 
	(_x isKindOf ["DetectorCore", configFile >> "CfgWeapons"]) || 
	(_x isKindOf ["Rifle", configFile >> "cfgWeapons"])  || // For rifles
	(_x isKindOf ["Launcher", configFile >> "cfgWeapons"]) // For disposable launchers
	) then {
		_name = getText (configfile >> "CfgWeapons" >> _x >> "displayName");
		_num = _allCount select _forEachIndex;
		_num = format["(%1)", _num];
		_nameCount = _num + " " + " " + " " + "-" + " " + " " + " " + _name;
	} else {
		_name = getText (configfile >> "CfgMagazines" >> _x >> "displayName");
		_num = _magCount select _forEachIndex;
		_num = format["(%1)", _num];
		_nameCount = _num + " " + " " + " " + "-" + " " + " " + " " + _name;
	};
	lbAdd [1504, _nameCount];
	lbSetData [1504, _forEachIndex, _x];
}forEach _allItems;