player addAction [["<img size='2' image='a3\missions_f_oldman\data\img\holdactions\holdaction_box_ca.paa'/>","<t color='#00FF55' size='1.3'>", localize "STR_ACTION_SUPPLIES", "</t>"] joinString "", {
	execVM "scripts\supply_menu\openSupplyMenu.sqf"
}, nil, 1000, true, true, "", "
isNull (objectParent _this) &&
_this distance spawnSupplyPos < 8
"];