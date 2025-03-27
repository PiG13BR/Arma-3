/*
	File: fn_timeMultiplier.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/05/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Manages the time multiplier at night

	Parameter(s):
		-
	
	Returns:
		-
*/

0 spawn {
	while {true} do {
		if (sunOrMoon == 1) then {
			setTimeMultiplier PIG_timerMultiplierDay_param;
		} else {
			setTimeMultiplier PIG_timerMultiplierNight_param;
		};
		sleep 60;
	}
};