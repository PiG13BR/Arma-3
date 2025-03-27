/*
	File: fn_autoCleaner.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/09/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Manages the removal off dead and empty vehicles in the mission

	Parameter(s):
		-
	
	Returns:
		-
*/

_fnc_checkNear = {
	params ["_object"];

	_is_near = true;
	if (({_x distance _object > 2000} count allPlayers) == (count allPlayers)) then {_is_near = false}; // All players are far away from the object

	_is_near // Return [BOOL]
};

// Auto garbage cleaner
while {true} do {
	sleep PIG_autoclean_param;

	{ 
		_is_near = [_x] call _fnc_checkNear;

		if (!_is_near) then {
			deleteVehicle _x 
		};
	}forEach ((allDead) + (vehicles select {(count (crew _x)) == 0}) + (missionNamespace getVariable 'PIG_particlesEffects')); // Empty/dead vehicles and effect particles from convoy objective

	diag_log "-------------------------------";
	diag_log "AUTO-CLEANER";
	diag_log "-------------------------------";
};
