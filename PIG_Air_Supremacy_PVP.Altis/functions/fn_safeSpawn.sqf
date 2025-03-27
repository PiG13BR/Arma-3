/*
	File: fn_safeSpawn.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/03/11
	Last Update: 2024/04/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Manages the safe spawn timer when player is teleported to the spawned jet

	Parameter(s):
		_vehicle - spawned jet [OBJECT]
		_unit - player unit [OBJECT]
	
	Returns:
		-
*/
params ["_vehicle", "_unit"];

_safeSpawnTimer = 5;

for "_i" from 1 to _safeSpawnTimer do {
	sleep 1;
	cutText ["Spawn Seguro: ATIVADO", "PLAIN DOWN"];
};

cutText ["Spawn Seguro: DESATIVADO", "PLAIN DOWN", 0.2];

_unit allowDamage true;
_vehicle allowDamage true;
