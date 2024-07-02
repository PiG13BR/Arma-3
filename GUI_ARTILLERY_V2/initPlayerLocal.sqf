player addAction ["<img size='2' image='a3\ui_f\data\gui\cfg\communicationmenu\artillery_ca.paa'/><t size='1.3' color='#8D5C07'>Open Artillery Menu</t>", {
	execVM "scripts\arty_menu\open_menu.sqf"}, nil, 1.5, true, true, "", 
	"isNull (objectParent _this) && 
	leader _this == _this && {
	alive _this
	}" 
	]