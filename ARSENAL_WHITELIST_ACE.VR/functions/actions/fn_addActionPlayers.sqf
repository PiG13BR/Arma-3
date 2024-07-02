/* 
fn_addActionPlayers.sqf
By PiG13BR

Each player will receive these actions.
*/

params ["_player"];

//-----------------------------------------------------------------------------------
// ARSENAL

_player addAction ["<t size='1.3' color='#E99B00'>ARSENAL</t>",{
	params ["_target", "_caller", "_actionId", "_arguments"];
	[] execVM "presets\arsenal\open_arsenal.sqf";
}, nil, 1000, true, true, "", "
isNull (objectParent _this)
&& {
	alive _this
}
&& {
	_this distance arsenalCenter_1 < 6
}"];

//-----------------------------------------------------------------------------------
// SAVE LOADOUT

_player addAction ["<t size='1.3' color='#ffff00'>Save Loadout</t>",{
	params ["_target", "_caller", "_actionId", "_arguments"];
	player setVariable ["Saved_Loadout", getUnitLoadout player];
	hint "Loadout Saved"
}, nil, 999, true, true, "", "
isNull (objectParent _this)
&& {
	alive _this
}
&& {
	_this distance arsenalCenter_1 < 6
}"
];