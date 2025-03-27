/*
	File: fn_selectTask.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/01/11
	Last Update: 2024/10/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Select tasks

	Parameter(s):
		-
	
	Returns:
		-
*/

if (!canSuspend) exitWith {0 spawn PIG_fnc_selectTask};

waitUntil {!isNil "PIG_availableMissions_param"};

private _tasks = PIG_availableMissions_param;
if (isNil "PIG_lastTaskPlayed") then {PIG_lastTaskPlayed = []};

if (count _tasks == 0) exitWith {diag_log "[TASK SELECTOR INFO] No missions available."};

if ((count _tasks > 1) && {PIG_lastTaskPlayed isNotEqualTo []}) then {
	// Only rest tasks if there are more than 1 to avoid empty array
	_tasks = _tasks - PIG_lastTaskPlayed;
};

private _task = "";
if (count _tasks > 0) then {
	_task = selectRandom _tasks;

	// Check if at least one player has some points if HUNT was selected
	if (_task isEqualTo "HUNT") then {
		_playersWithScore = allPlayers select { 
			getPlayerScores _x param[5,0] > 0
		};
		if (count (_playersWithScore) < 1) then {
			// Try again without HUNT
			_task = selectRandom (_tasks - ["HUNT"]);
			diag_log format ["[TASK SELECTOR INFO] Couldn't start HUNT objective, next objective will be: %1", _task]
		}
	};
} else {
	_tasks = PIG_availableMissions_param;
};

diag_log format ["[TASK SELECTOR INFO] Next objective will be: %1", _task];

sleep PIG_selectTaskDelay_param + (random PIG_selectTaskDelay_param);

if (count allPlayers < PIG_requiredPlayers_param) exitWith {diag_log "[WARNING] Not enough players to start tasks"; [] call PIG_fnc_selectTask};



switch (_task) do {
	case "CONVOY" : {
		
		// Convoy owner? OWNER = DEFEND THE CONVOY.
		private _sideDefend = sideUnknown;
		private _sideAttack = sideUnknown;
		
		// Check defender side from last task
		if (isNil {missionNamespace getVariable "PIG_convoyDefendSide"}) then {
			_sideDefend = selectRandom [independent, east]; // Selected side will defend the convoy
			_sideAttack = selectRandom ([independent, east] - [_sideDefend]);
		} else {
			// Change sides for the task
			_sideAttack = (missionNamespace getVariable "PIG_convoyDefendSide");
			_sideDefend = selectRandom ([independent, east] - [_sideAttack])
		};
		
		[_sideDefend, _sideAttack] call PIG_fnc_convoyObjective;
	};
	case "AIR CONTROL" : {
		[] call PIG_fnc_airControlObjective;
	};
	case "HUNT" : {
		[] call PIG_fnc_huntObjective;
	};
	case "ARTY" : {
		// W.I.P
		// Artillery owner? OWNER = DEFEND THE ARTILLERY.
		private _sideDefend = sideUnknown;
		private _sideAttack = sideUnknown;

		// Check defender side from last task
		if (isNil {missionNamespace getVariable "PIG_artyDefendSide"}) then {
			_sideDefend = selectRandom [independent, east]; // Selected side will defend the artillery
			_sideAttack = selectRandom ([independent, east] - [_sideDefend]);
		} else {
			// Change sides for the task
			_sideAttack = (missionNamespace getVariable "PIG_artyDefendSide");
			_sideDefend = selectRandom ([independent, east] - [_sideAttack])
		};

		[_sideDefend, _sideAttack] call PIG_fnc_artyObjective;
	};
	default {diag_log "[WARNING] Couldn't find any missions"; [] call PIG_fnc_selectTask}
}