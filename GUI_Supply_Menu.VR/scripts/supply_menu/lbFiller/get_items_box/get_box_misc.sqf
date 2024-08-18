params["_item", "_amount"];
lbClear 1504;

_box = [] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\checkArea\checkNearBox.sqf";
if (isNull _box) exitWith {
	hint localize "STR_NOBOXES_NEAR"
};

_boxItem = getItemCargo _box;

_itemCount = _boxItem select 1;

_boxItemArray = _boxItem select 0;

_items = [];
_numArray = [];

{
	// Sort only misc items
	if (_x in PIG_all_misc) then {
		_items pushback _x;
		_num = _itemCount select _forEachIndex;
		_numArray pushBack _num;
	};
}forEach _boxItemArray;

{
	_name = getText (configfile >> "CfgWeapons" >> _x >> "displayName");
	_num = _numArray select _forEachIndex;
	_num = format["(%1)", _num];
	_nameCount = _num + " " + " " + " " + "-" + " " + " " + " " + _name;
	lbAdd [1504, _nameCount];
	lbSetData [1504, _forEachIndex, _x];
}forEach _items;