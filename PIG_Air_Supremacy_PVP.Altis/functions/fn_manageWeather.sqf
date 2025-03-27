/*
	File: fn_manageWeather.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/10/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Manages weather. Keep the same weather.

	Parameter(s):
		_vehicle - player's vehicle [OBJECT]
	
	Returns:
		-
*/

0 setOvercast PIG_weather_param;
forceWeatherChange;

while {true} do {
	(3600 * timeMultiplier) setOvercast PIG_weather_param;
	sleep 3000;
};

