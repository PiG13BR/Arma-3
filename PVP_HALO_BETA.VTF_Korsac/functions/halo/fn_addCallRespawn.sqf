params ["_unit"];

waitUntil {
	!alive _unit || isTouchingGround _unit
};

_unit addAction [["<img size='2' image='a3\ui_f\data\map\vehicleicons\iconparachute_ca.paa'/>", "<t size='1.5'>", localize "STR_DROP_RESPAWN", "</t>"] joinString "", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	private _side = side _caller;
	[_caller, _actionId, _side] execVM 'scripts\PIG_dropRespawn.sqf'
},
nil, // arguments
999, // priority
true, // showWindow
true, // hideOnUse
"", // shortcut
"true", // condition
50, // radius
false, // unconscious
"", // selection
""// memoryPoint
];
