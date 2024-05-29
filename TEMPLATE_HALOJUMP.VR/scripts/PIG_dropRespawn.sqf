params["_caller", "_pos", "_actionId"];
_caller removeAction _actionId;

private _cargo = "I_E_CargoNet_01_ammo_F" createVehicle (_pos);
_cargo setPos (_pos vectorAdd [random 30, random 30, 200]);
[objNull, _cargo] call BIS_fnc_curatorObjectEdited; // Esse código adiciona um paraquedas no objeto

_cargo addAction ["Set Respawn Point", {
	hint "Setting Respawn Point mkay"
},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	3,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];