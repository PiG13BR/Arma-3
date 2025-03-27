/*
	File: fn_airControlObjective.sqf
	Author: PiG13BR
	Date: 2024/02/11
	Last Update: 2024/07/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Manages the airspace control objective

	Parameter(s):
		-
	
	Returns:
		-
*/

_airControlMarker = [] call PIG_fnc_getAirControlMarkers;
_airControlPos = (markerPos _airControlMarker);

_areaSize = [5000,5000];

// Create area marker
_markerArea = createMarker ["air_control_area", _airControlPos];
_markerArea setMarkerSize _areaSize;
_markerArea setMarkerShape "ELLIPSE";
_markerArea setMarkerBrush "solid";
_markerArea setMarkerColor "ColorUNKNOWN";
_markerArea setMarkerAlpha 0.5;

// Create Task
[
	east, 
	"ac_task_east", 
	"airControlTask", 
	_airControlPos, 
	"plane"
] call PIG_fnc_createTask;

[
	independent, 
	"ac_task_guer", 
	"airControlTask", 
	_airControlPos, 
	"plane"
] call PIG_fnc_createTask;

missionNamespace setVariable ["PIG_airControlOwner", sideUnknown];
missionNamespace setVariable ["PIG_timerTimeOut", false, true];

// Create trigger based on marker
_trg = [objNull, _markerArea] call BIS_fnc_triggerToMarker;
_trg setTriggerType "NONE";
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerInterval 0.5;
_trg setTriggerStatements [
	// Condition
	toString {
		(isNil "PIG_trgActivated") && {(this) || {missionNamespace getVariable "PIG_timerTimeOut"}}
	},
	// On Activation
	toString {
		PIG_trgActivated = true;
		if (missionNamespace getVariable "PIG_timerTimeOut") then {
			switch (missionNamespace getVariable "PIG_airControlOwner") do {
				case east : {
					["ac_task_east", "SUCCEEDED"] call BIS_fnc_taskSetState;
					["ac_task_guer", "FAILED"] call BIS_fnc_taskSetState;
					[independent, -10] call BIS_fnc_respawnTickets; 
				};
				case independent : {
					["ac_task_east", "FAILED"] call BIS_fnc_taskSetState;
					["ac_task_guer", "SUCCEEDED"] call BIS_fnc_taskSetState;
					[east, -10] call BIS_fnc_respawnTickets;
				};
				case sideUnknown : {
					["ac_task_east", "CANCELLED"] call BIS_fnc_taskSetState;
					["ac_task_guer", "CANCELLED"] call BIS_fnc_taskSetState;
				};
			};
			deleteMarker "air_control_area";
			missionNamespace setVariable ["PIG_airControlOwner", nil];
			missionNamespace setVariable ["PIG_timerTimeOut", nil];
			PIG_trgActivated = nil;
			diag_log "[AIR CONTROL OBJECTIVE] Air control objective finished";
			
			[] call PIG_fnc_selectTask;
			deleteVehicle thisTrigger;
		} else {
			_guer = thisList select {((vehicle _x) isKindOf 'Air') && {side _x == independent}};
			_opfor = thisList select {((vehicle _x) isKindOf 'Air') && {side _x == east}};
			if ((count (_guer)) == (count (_opfor))) then {
				"air_control_area" setMarkerColor 'colorCIV';
				missionNamespace setVariable ["PIG_airControlOwner", sideUnknown];
			};
			if ((count (_guer)) > (count (_opfor))) then {
				"air_control_area" setMarkerColor 'ColorGUER';
				missionNamespace setVariable ["PIG_airControlOwner", independent];
			};
			if ((count (_opfor)) > (count (_guer))) then {
				"air_control_area" setMarkerColor 'ColorEAST';
				missionNamespace setVariable ["PIG_airControlOwner", east];
			};
		}
	}, 
	// On Deactivation
	toString {PIG_trgActivated = nil}
];

// Set timer
[PIG_airControlTimer_param] remoteExecCall ["PIG_fnc_manageTimer", 0, true]; // Call on server and client

diag_log "[AIR CONTROL OBJECTIVE] Air control objective started";
PIG_lastTaskPlayed pushBack "AIR CONTROL";