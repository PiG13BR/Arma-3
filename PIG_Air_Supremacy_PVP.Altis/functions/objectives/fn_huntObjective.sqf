/*
	File: fn_huntTask.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/07/11
	Last Update: 2024/10/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Creates and manages the hunt objective

	Parameter(s):
		-
	
	Returns:
		-
*/

// Sort players by score
private _scores = allPlayers apply{
	[ 
		getPlayerScores _x param[5,0], // get only the scores
		_x, // Object (player)
		((vehicle _x) isKindOf "Air") // BOOL
	]
};
_scores sort true;

// Get only players in jet
_scores = _scores select { _x # 2 };
if (count _scores < 1) exitWith {diag_log "[WARNING] No players to hunt found in the list"; [] call PIG_fnc_selectTask;};

// Get the player with the most score
private _score = ((_scores #0) #0);
private _player = objNull;
if (_score <= 0) then {
	diag_log "[WARNING] The first player in the list has 0 or negative points, selecting a random player"; 
	_player = selectRandom allPlayers;
} else {
	_player = ((_scores #0) #1);
};
missionNamespace setVariable ["PIG_huntPlayerJet", (vehicle _player)];
missionNamespace setVariable ["PIG_huntPlayerEjected", false];
missionNamespace setVariable ["PIG_huntPlayerKilled", false];

// Add GetOutMan EH
_player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];
	missionNamespace setVariable ["PIG_huntPlayerEjected", true];
	_unit removeEventHandler [_thisEvent, _thisEventHandler];
}];

// Add MPKilled EH
_player addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	// Add score to player (testing)
	if (isPlayer _instigator) then {
		_instigator addScore 10;
	};
	missionNamespace setVariable ["PIG_huntPlayerKilled", true];
	_unit removeMPEventHandler [_thisEvent, _thisEventHandler];
}];

_sideDefend = (side _player);
_sideAttack = [east, independent] - [_sideDefend];
missionNamespace setVariable ["PIG_huntDefendSide", _sideDefend];

// Create tasks
[
	_sideAttack, 
	"hunt_attack_task", 
	"huntAttackTask", 
	[vehicle (_player), true],  
	"kill" // Icon
] call PIG_fnc_createTask;

[
	_sideDefend, 
	"hunt_defend_task", 
	"huntDefendTask", 
	[vehicle (_player), true], 
	"defend" // Icon
] call PIG_fnc_createTask;

// Warn the hunted player once
["hunt_task_text", ["<t color='#ff0000' size='1.3'>Você está sendo caçado!</t>", "PLAIN DOWN", 0, false, true]] remoteExec ["cutText", _player];

// Create Timer
missionNamespace setVariable ["PIG_timerTimeOut", false, true];
[PIG_huntTimer_param] remoteExecCall ["PIG_fnc_manageTimer", 0, true];

// Create trigger to monitor the task
_trg = createTrigger ["EmptyDetector", [0,0,0], false];
_trg setTriggerArea [0, 0, 0, false];
_trg setTriggerInterval 0.5;
_trg setTriggerStatements [
	// Condition
	toString {
		(!alive (missionNamespace getVariable 'PIG_huntPlayerJet')) || {missionNamespace getVariable 'PIG_timerTimeOut'} || {missionNamespace getVariable "PIG_huntPlayerEjected"} || {missionNamespace getVariable "PIG_huntPlayerKilled"}
	},
	// On Activation
	toString {
		if ((!(missionNamespace getVariable 'PIG_timerTimeOut')) && {(!alive (missionNamespace getVariable 'PIG_huntPlayerJet')) || {missionNamespace getVariable "PIG_huntPlayerEjected"}} || {missionNamespace getVariable "PIG_huntPlayerKilled"}) then {	
			[-1, true] call BIS_fnc_countdown;
			['hunt_attack_task', 'SUCCEEDED', true] call BIS_fnc_taskSetState; 
			['hunt_defend_task', 'FAILED', true] call BIS_fnc_taskSetState;
			[(missionNamespace getVariable 'PIG_huntDefendSide'), -5] call BIS_fnc_respawnTickets; 
		} else {
			['hunt_attack_task', 'FAILED', true] call BIS_fnc_taskSetState; 
			['hunt_defend_task', 'SUCCEEDED', true] call BIS_fnc_taskSetState;
		};
		
		missionNamespace setVariable ['PIG_huntPlayerJet', nil];
		missionNamespace setVariable ["PIG_huntDefendSide", nil];
		missionNamespace setVariable ["PIG_huntPlayerEjected", nil];
		diag_log "[HUNT OBJECTIVE] Hunt objective finished";
		[] call PIG_fnc_selectTask;

		deleteVehicle thisTrigger;
		
	}, 
	// On Deactivation
	""
];

diag_log "[HUNT OBJECTIVE] Hunt objective started";
PIG_lastTaskPlayed pushBack "HUNT";