/*
	File: fn_manageTimer.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/04/11
	Last Update: 2024/10/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Manages hud timer for any kind of mission that requires it

	Parameter(s):
		-
	
	Returns:
		-
*/
params["_time"];

if (isServer) then {
	[_time, true] call BIS_fnc_countdown;
};

if (hasInterface) then {
	0 spawn {
		waitUntil { ([true] call BIS_fnc_countdown)};
		"PIG_timer_ui" cutRsc ["PIG_RscTimer", "PLAIN"];
		while {[true] call BIS_fnc_countdown} do {
			
			_timeLeft = [0] call BIS_fnc_countdown;

			// https://forums.bohemia.net/forums/topic/151629-mission-countdown-timer-w-on-screen-time-left/
			_finish_time_minutes = floor(_timeLeft / 60);
			_finish_time_seconds = floor(_timeLeft) - (60 * _finish_time_minutes);
			if(_finish_time_seconds < 10) then
			{
				_finish_time_seconds = format ["0%1", _finish_time_seconds];
			};
			_formatted_time = format ["%1:%2", _finish_time_minutes, _finish_time_seconds];
			_overlay = uiNamespace getVariable ["PIG_timer", displayNull];
			(_overlay displayCtrl (100)) ctrlSetText _formatted_time;

			sleep 1;
		};

		"PIG_timer_ui" cutText ["", "PLAIN"];
		missionNamespace setVariable ["PIG_timerTimeOut", true, true];
	};
};