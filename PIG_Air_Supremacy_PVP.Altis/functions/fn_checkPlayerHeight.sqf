/*
	File: fn_checkPlayerHeight.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/05/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Check if player is on the ground

	Parameter(s):
		-
	
	Returns:
		-
*/

_this spawn {
	while {!(isTouchingGround _this) && PIG_jet_spawned} do {
		if (isTouchingGround _this) then {
			_this setdamage 1;
		}
	}
}
