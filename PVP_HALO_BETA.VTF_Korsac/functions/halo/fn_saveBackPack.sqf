params["_unit"];

private _backpack = "";
private _backpackcontents = [];

private _group = group _unit;

_backpack = backpack _unit; // get backpack from player
if (_backpack != "" && _backpack != "rhs_d6_Parachute_backpack") then {
	_backpackcontents = backpackItems _unit;
	hint localize "STR_BACKPACK_SAVED";
	removeBackpack _unit;
	sleep 0.1;
};
_unit addBackPack "rhs_d6_Parachute_backpack";

// Open parachute
_unit action ["OpenParachute", _unit];

// Give back the backpack for each player
[_unit, _backpack, _backpackcontents] remoteExec ["PIG_fnc_getBackPack", _unit];