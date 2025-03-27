params ["_player", "_didJIP"];

_player setVariable ["TAG_StartLoadout", getUnitLoadout _player];
_player addEventHandler ["Respawn", { 
	params ["_unit", "_corpse"];
	private _loadout = _unit getVariable "TAG_StartLoadout"; if (!isNil "_loadout") then { _unit setUnitLoadout _loadout; }; 
}];

_player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];
	// If player ejects, detects if it's on ground. If it is, kill it.
	if (PIG_jet_spawned) then {
		_unit call PIG_fnc_checkPlayerHeight;
	};
}];