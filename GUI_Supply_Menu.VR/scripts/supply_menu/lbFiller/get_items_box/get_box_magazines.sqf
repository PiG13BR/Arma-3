params["_item", "_amount"];
lbClear 1504;

_box = [] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\checkArea\checkNearBox.sqf";
if (isNull _box) exitWith {
	hint localize "STR_NOBOXES_NEAR"
};

_boxMag = getMagazineCargo _box;
_boxWep = getWeaponCargo _box; // For disposable launchers

_magCount = _boxMag select 1;
_wepCount = _boxWep select 1;

_boxMagArray = _boxMag select 0;
_boxWepArray = _boxWep select 0;

_items = [];
_numArray = [];

{
	// Sort only magazines
	if (_x in PIG_all_magazines) then {
		_items pushback _x;
		_num = _magCount select _forEachIndex;
		_numArray pushBack _num;
	};
}forEach _boxMagArray;

{
	// Sort only available disposable launcher
	if ((_x isKindOf ["Launcher", configFile >> "cfgWeapons"])) then {
		_items pushback _x;
		_num = _wepCount select _forEachIndex;
		_numArray pushBack _num;
	};
}forEach _boxWepArray;



{
	if !((_x isKindOf ["Launcher", configFile >> "cfgWeapons"])) then { 
		_name = getText (configfile >> "CfgMagazines" >> _x >> "displayName");
		_num = _numArray select _forEachIndex;
		_num = format["(%1)", _num];
		_nameCount = _num + " " + " " + " " + "-" + " " + " " + " " + _name;
		lbAdd [1504, _nameCount];
		lbSetData [1504, _forEachIndex, _x];
	} else {
		_name = getText (configfile >> "CfgWeapons" >> _x >> "displayName");
		_num = _numArray select _forEachIndex;
		_num = format["(%1)", _num];
		_nameCount = _num + " " + " " + " " + "-" + " " + " " + " " + _name;
		lbAdd [1504, _nameCount];
		lbSetData [1504, _forEachIndex, _x];
	}
}forEach _items;