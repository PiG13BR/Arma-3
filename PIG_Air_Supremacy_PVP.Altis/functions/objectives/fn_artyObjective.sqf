/*
	File: fn_artyObjective.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/07/11
	Last Update: 2024/09/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Creates and manages the artillery objective

	Parameter(s):
		_sideDefend - side that will defend the artillery positions [SIDE]
		_sideAttack - side that will attack the artillery positions [SIDE]
	
	Returns:
		-
*/

params["_sideDefend", "_sideAttack"];

missionNamespace setVariable ["PIG_allArtyDestroyed", false];
missionNamespace setVariable ["PIG_artyDefendSide", _sideDefend];
missionNamespace setVariable ["PIG_artyAttackSide", _sideAttack];

// Get spawn markers
_markers = [_sideDefend] call PIG_fnc_getArtyMarkers; // Array with 3 markers
if (_markers isEqualTo []) exitWith {diag_log "[WARNING] No spawn marker for artillery found"; [] call PIG_fnc_selectTask;};

// Get artillery and patrol preset
private _arty_preset = ([_sideDefend] call PIG_presets_artillery);
private _artyClass = _arty_preset # 0;
private _patrol = _arty_preset # 1;
if (_artyClass isEqualTo "") exitWith {diag_log "[WARNING] No artillery class found in the preset"; [] call PIG_fnc_selectTask;};
if (_patrol isEqualTo []) exitWith {diag_log "[WARNING] No patrol units classes found in the preset"; [] call PIG_fnc_selectTask;};

// Spawn artillery and patrol group
private _arty_vehicles = [];
private _groups = [];
private _arty_groups = [];
{
	private _pos = getMarkerPos _x;

	// Create artillery
	_artyVeh = createVehicle [_artyClass, _pos, [], 30, "NONE"];
	_artyVeh setDir (markerDir _x);

	_grpArty = createVehicleCrew _artyVeh;
	_grpArty setBehaviour "COMBAT"; // Turn off lights

	_artyVeh deleteVehicleCrew (driver (_artyVeh)); // Making sure that doesn't move

	_arty_vehicles pushBack _artyVeh;

	// Create patrol squad
	private _grpPatrol = [(_pos) getPos [50, (random 360)], _sideDefend, _patrol] call BIS_fnc_spawnGroup;
	[_grpPatrol, _pos, 100] call BIS_fnc_taskPatrol;

	_arty_groups pushBack _grpArty;
	_groups pushBack _grpPatrol;
}forEach _markers;

missionNamespace setVariable ["PIG_artyGroups", _arty_groups];
missionNamespace setVariable ["PIG_patrolGroups", _groups];
missionNamespace setVariable ["PIG_artyVehicles", _arty_vehicles];

// Add EH to artillery units and some attributes
{

	_x addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
		// avoid TK by making indestructible by friendly fire
		private ["_getDamage"];
		if ((side _source) != (missionNamespace getVariable "PIG_artyAttackSide")) then {
			0
		} else {
			_getDamage = _damage;
			// Make somehow artillery easier to kill
			if ((!canFire _unit) || {!canMove _unit}) then {
				_unit setDamage 1;
			};
			if (_getDamage > 3) then {
				_unit setDamage 1;
			} else {
				_getDamage
			};
		};

	}];
	
	{
		_x addEventHandler ["HandleDamage", {
			params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
			// avoid TK by making indestructible by friendly fire
			private ["_getDamage"];
			if ((side _source) != (missionNamespace getVariable "PIG_artyAttackSide")) then {
				0
			} else {
				_getDamage = _damage;
				// Make somehow artillery easier to kill
				if ((!canFire _unit) || {!canMove _unit}) then {
					_unit setDamage 1;
				};
				if (_getDamage > 3) then {
					_unit setDamage 1;
				} else {
					_getDamage
				};
			};

		}];
	}forEach (crew _x);

	_x addMPEventHandler ["MPKilled", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
		
		// Add score to player (testing)
		if (isPlayer _instigator) then {
			_instigator addScore 10;
		};

		private _arty_vehicles = (missionNamespace getVariable "PIG_artyVehicles") - [_unit];
		missionNamespace setVariable ["PIG_artyVehicles", _arty_vehicles];
	}];

	_x allowCrewInImmobile true;

	[_x, _sideAttack] spawn PIG_fnc_fakeArtyFire
}forEach _arty_vehicles;

// Parent Tasks
[
	_sideDefend, 
	"artyDef_task", 
	"parent_artyDefendTask", 
	objNull, 
	"defend" // Icon
] call PIG_fnc_createTask;

[
	_sideAttack, 
	"artyAtt_task", 
	"parent_artyAttackTask", 
	objNull, 
	"destroy" // Icon
] call PIG_fnc_createTask;

// Individual tasks & triggers
missionNamespace setVariable ["PIG_artyTriggers", []];

{
	_defFormat = (format ["artyDefTask_%1",( _forEachIndex + 1)]);
	_attFormat = (format ["artyAttTask_%1",( _forEachIndex + 1)]);

	// Tasks
	[
		_sideDefend, 
		[_defFormat, "artyDef_task"], 
		["", format["Defenda a artilharia (%1)", (mapGridPosition _x)], ""], 
		[_x, true], 
		"defend", // Icon
		"AUTOASSIGNED",
		false
	] call PIG_fnc_createTask;

	[
		_sideAttack, 
		[_attFormat, "artyAtt_task"], 
		["", format["Destrua a artilharia (%1)", (mapGridPosition _x)], ""], 
		[_x, false], 
		"destroy", // Icon
		"AUTOASSIGNED",
		false
	] call PIG_fnc_createTask;

	// Individual trigger to monitor individual arty
	private _trg = createTrigger ["EmptyDetector", _x, false];
	_trg setTriggerArea [50, 50, 0, false];
	_trg setTriggerActivation [str _sideDefend, "PRESENT", true];
	_trg setTriggerInterval 0.5;
	_trg setTriggerStatements [
		// Condition
		toString {
			count (thisList select {(alive _x) && {_x in (missionNamespace getVariable "PIG_artyVehicles")}}) == 0
		},
		// On Activation
		toString {
			if ((thisList select {(alive _x) && {_x in (missionNamespace getVariable "PIG_artyVehicles")}}) isEqualTo []) then {
				if ((count (missionNamespace getVariable 'PIG_artyVehicles') == 0) || {missionNamespace getVariable 'PIG_timerTimeOut'}) exitWith {};
				[(missionNamespace getVariable 'PIG_artyDefendSide'), -3] call BIS_fnc_respawnTickets; 
				[(thisTrigger getVariable 'PIG_trgArtyAttackTask'), 'SUCCEEDED', true] call BIS_fnc_taskSetState; 
				[(thisTrigger getVariable 'PIG_trgArtyDefenseTask'), 'FAILED', true] call BIS_fnc_taskSetState;
			};

			deleteVehicle thisTrigger;
		}, 
		// On Deactivation
		""
	];

	// Use trigger created as varspace to get tasks related to it
	_trg setVariable ["PIG_trgArtyDefenseTask", _defFormat, true];
	_trg setVariable ["PIG_trgArtyAttackTask", _attFormat, true];
	
	// These triggers will also be deleted in the main trigger
	(missionNamespace getVariable "PIG_artyTriggers") pushBack _trg;
}forEach _arty_vehicles;

// Create Timer
missionNamespace setVariable ["PIG_timerTimeOut", false, true];
[PIG_artyTimer_param] remoteExecCall ["PIG_fnc_manageTimer", 0, true];

// Create the main trigger to manage the task
private _trg = createTrigger ["EmptyDetector", [0,0,0], false];
_trg setTriggerArea [0, 0, 0, false];
_trg setTriggerInterval 0.5;
_trg setTriggerStatements [
	// Condition
	toString {
		(count (missionNamespace getVariable 'PIG_artyVehicles') == 0) || {missionNamespace getVariable 'PIG_timerTimeOut'}
	},
	// On Activation
	toString {
		_tickets = ((count (missionNamespace getVariable 'PIG_artyVehicles')) * 3);
		if ((count (missionNamespace getVariable 'PIG_artyVehicles') == 0) && {!(missionNamespace getVariable 'PIG_timerTimeOut')}) then {
			[-1, true] call BIS_fnc_countdown;
			['artyAtt_task', 'SUCCEEDED', true] call BIS_fnc_taskSetState; 
			['artyDef_task', 'FAILED', true] call BIS_fnc_taskSetState; 
		} else {
			['artyAtt_task', 'FAILED', true] call BIS_fnc_taskSetState; 
			['artyDef_task', 'SUCCEEDED', true] call BIS_fnc_taskSetState;
			[(missionNamespace getVariable 'PIG_artyAttackSide'), - _tickets] call BIS_fnc_respawnTickets;
		};
		if ((count (missionNamespace getVariable 'PIG_artyVehicles') > 0) && {missionNamespace getVariable 'PIG_timerTimeOut'}) then {
			{
				_x removeAllMPEventHandlers "MPKilled";
				_x removeAllEventHandlers "GetOut";
				_x removeAllEventHandlers "HandleDamage";
				deleteVehicle _x;
			}forEach (missionNamespace getVariable 'PIG_artyVehicles');
		};
		{deleteVehicle _x}forEach (missionNamespace getVariable "PIG_artyTriggers") + [thisTrigger];
		missionNamespace setVariable ['PIG_artyVehicles', nil];
		{deleteVehicle (units _x)} forEach (missionNamespace getVariable 'PIG_artyGroups');
		missionNamespace setVariable ['PIG_artyGroups', nil];
		{deleteVehicle (units _x)}forEach (missionNamespace getVariable "PIG_patrolGroups");
		missionNamespace setVariable ['PIG_patrolGroups', nil];

		diag_log "[ARTILLERY OBJECTIVE] Artillery objective finished";
		[] call PIG_fnc_selectTask;

		missionNamespace setVariable ["PIG_artyTriggers", nil];
	}, 
	// On Deactivation
	""
];

diag_log "[ARTILLERY OBJECTIVE] Artillery objective started";
PIG_lastTaskPlayed pushBack "ARTY";

