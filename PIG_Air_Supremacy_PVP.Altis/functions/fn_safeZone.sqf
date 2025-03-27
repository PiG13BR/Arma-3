/*
	File: fn_safeZone.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/09/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Make vehicle and player invincible while in the area. Inform the player that he's in a safe zone.

	Parameter(s):
		_vehicle - player's vehicle [OBJECT]
	
	Returns:
		-
*/

params ["_vehicle"];

// Actived
_vehicle allowDamage false;
{
	_vehicle allowDamage false;
}forEach (crew _vehicle);

while {PIG_safeZone} do {
	cutText ["Zona Segura: ATIVADO", "PLAIN DOWN"];
	sleep 1;
};
// Deactived
_vehicle allowDamage true;
{
	_vehicle allowDamage true;
}forEach (crew _vehicle);
cutText ["Zona Segura: DESATIVADO", "PLAIN DOWN"];
