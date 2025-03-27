/*
	Author: PiG13BR

	Put the convoy route markers here.
	Make sure that you put them in order like they are in the editor.
	It's recommended that you place a bunch of those middle markers between the spawn and despawn marker, particullary put them in junctions, bridges, etc. places that AI might get stuck for some reason. You need at least place one of those markers, don't leave the middle array empty.

	The spawn points must be in a straight road. The convoy vehicles will spawn one behind another, so don't put spawn marker on curves, steep hills, etc.
	Also, the spawn marker must be facing the direction of the route so the vehicles spawn in the right direction

	Example:
	[
		"spawn_marker", 
		[
			"middle_marker_1", 
			"middle_marker_2"
		], 
		"despawn_marker
	]
*/
params["_side"];

private _waypointGroups = [];

if (isNil {missionNamespace getVariable "PIG_waypointGroupUsed"}) then {
	missionNamespace setVariable ["PIG_waypointGroupUsed", []];
};

switch (_side) do {
	case east : {
		_waypointGroups append [
			// Marker array
			[
				"east_convoy_spawn_routeA", // Spawn marker
				[	
					// Middle markers
					
					"east_convoy_middle_routeA", 
					"east_convoy_middle_routeA_1",
					"east_convoy_middle_routeA_2",
					"east_convoy_middle_routeA_3",
					"east_convoy_middle_routeA_4",
					"east_convoy_middle_routeA_5",
					"east_convoy_middle_routeA_6",
					"east_convoy_middle_routeA_7",
					"east_convoy_middle_routeA_8",
					"east_convoy_middle_routeA_9",
					"east_convoy_middle_routeA_10",
					"east_convoy_middle_routeA_12",
					"east_convoy_middle_routeA_13"
				],
				"east_convoy_despawn_routeA" // Despawn Marker
			],
			// Another marker array
			[
				"east_convoy_spawn_routeB", 
				[
					"east_convoy_middle_routeB", 
					"east_convoy_middle_routeB_1",
					"east_convoy_middle_routeB_2",
					"east_convoy_middle_routeB_3",
					"east_convoy_middle_routeB_4",
					"east_convoy_middle_routeB_5",
					"east_convoy_middle_routeB_6",
					"east_convoy_middle_routeB_7",
					"east_convoy_middle_routeB_8",
					"east_convoy_middle_routeB_9",
					"east_convoy_middle_routeB_10",
					"east_convoy_middle_routeB_12"
				],
				"east_convoy_despawn_routeB"
			],
			[
				"east_convoy_spawn_routeC",
				[	
					"east_convoy_middle_routeC", 
					"east_convoy_middle_routeC_1",
					"east_convoy_middle_routeC_2",
					"east_convoy_middle_routeC_3",
					"east_convoy_middle_routeC_4",
					"east_convoy_middle_routeC_5",
					"east_convoy_middle_routeC_6",
					"east_convoy_middle_routeC_7",
					"east_convoy_middle_routeC_8",
					"east_convoy_middle_routeC_9",
					"east_convoy_middle_routeC_10",
					"east_convoy_middle_routeC_12",
					"east_convoy_middle_routeC_13"
				],
				"east_convoy_despawn_routeC"
			],
			[
				"east_convoy_spawn_routeD",
				[	
					"east_convoy_middle_routeD", 
					"east_convoy_middle_routeD_1",
					"east_convoy_middle_routeD_2",
					"east_convoy_middle_routeD_3",
					"east_convoy_middle_routeD_4",
					"east_convoy_middle_routeD_5",
					"east_convoy_middle_routeD_6",
					"east_convoy_middle_routeD_7",
					"east_convoy_middle_routeD_8",
					"east_convoy_middle_routeD_9",
					"east_convoy_middle_routeD_10",
					"east_convoy_middle_routeD_12",
					"east_convoy_middle_routeD_13"
				],
				"east_convoy_despawn_routeD"
			],
			[
				"east_convoy_spawn_routeE",
				[	
					"east_convoy_middle_routeE", 
					"east_convoy_middle_routeE_1",
					"east_convoy_middle_routeE_2",
					"east_convoy_middle_routeE_3",
					"east_convoy_middle_routeE_4",
					"east_convoy_middle_routeE_5",
					"east_convoy_middle_routeE_6",
					"east_convoy_middle_routeE_7",
					"east_convoy_middle_routeE_8",
					"east_convoy_middle_routeE_9",
					"east_convoy_middle_routeE_10",
					"east_convoy_middle_routeE_12",
					"east_convoy_middle_routeE_13"
				],
				"east_convoy_despawn_routeE"
			] // Don't put comma in the last array
		]
	};
	case independent : {
		_waypointGroups append [
			[
				"guer_convoy_spawn_routeA", 
				[
					"guer_convoy_middle_routeA", 
					"guer_convoy_middle_routeA_1",
					"guer_convoy_middle_routeA_2",
					"guer_convoy_middle_routeA_3",
					"guer_convoy_middle_routeA_4",
					"guer_convoy_middle_routeA_5",
					"guer_convoy_middle_routeA_6",
					"guer_convoy_middle_routeA_7",
					"guer_convoy_middle_routeA_8",
					"guer_convoy_middle_routeA_9",
					"guer_convoy_middle_routeA_10",
					"guer_convoy_middle_routeA_11",
					"guer_convoy_middle_routeA_12",
					"guer_convoy_middle_routeA_13",
					"guer_convoy_middle_routeA_14",
					"guer_convoy_middle_routeA_15"
				],
				"guer_convoy_despawn_routeA"
			],
			[
				"guer_convoy_spawn_routeB", 
				[
					"guer_convoy_middle_routeB", 
					"guer_convoy_middle_routeB_1",
					"guer_convoy_middle_routeB_2",
					"guer_convoy_middle_routeB_3",
					"guer_convoy_middle_routeB_4",
					"guer_convoy_middle_routeB_5",
					"guer_convoy_middle_routeB_6",
					"guer_convoy_middle_routeB_7",
					"guer_convoy_middle_routeB_8",
					"guer_convoy_middle_routeB_9",
					"guer_convoy_middle_routeB_10",
					"guer_convoy_middle_routeB_11",
					"guer_convoy_middle_routeB_12",
					"guer_convoy_middle_routeB_13",
					"guer_convoy_middle_routeB_14",
					"guer_convoy_middle_routeB_15"
				],
				"guer_convoy_despawn_routeB"
			],
						[
				"guer_convoy_spawn_routeC", 
				[
					"guer_convoy_middle_routeC", 
					"guer_convoy_middle_routeC_1",
					"guer_convoy_middle_routeC_2",
					"guer_convoy_middle_routeC_3",
					"guer_convoy_middle_routeC_4",
					"guer_convoy_middle_routeC_5",
					"guer_convoy_middle_routeC_6",
					"guer_convoy_middle_routeC_7",
					"guer_convoy_middle_routeC_8",
					"guer_convoy_middle_routeC_9",
					"guer_convoy_middle_routeC_10",
					"guer_convoy_middle_routeC_11",
					"guer_convoy_middle_routeC_12",
					"guer_convoy_middle_routeC_13",
					"guer_convoy_middle_routeC_14",
					"guer_convoy_middle_routeC_15",
					"guer_convoy_middle_routeC_16",
					"guer_convoy_middle_routeC_17",
					"guer_convoy_middle_routeC_18",
					"guer_convoy_middle_routeC_19",
					"guer_convoy_middle_routeC_20",
					"guer_convoy_middle_routeC_21",
					"guer_convoy_middle_routeC_22"
				],
				"guer_convoy_despawn_routeC"
			],
			[
				"guer_convoy_spawn_routeD", 
				[
					"guer_convoy_middle_routeD", 
					"guer_convoy_middle_routeD_1",
					"guer_convoy_middle_routeD_2",
					"guer_convoy_middle_routeD_3",
					"guer_convoy_middle_routeD_4",
					"guer_convoy_middle_routeD_5",
					"guer_convoy_middle_routeD_6",
					"guer_convoy_middle_routeD_7",
					"guer_convoy_middle_routeD_8",
					"guer_convoy_middle_routeD_9",
					"guer_convoy_middle_routeD_10"
				],
				"guer_convoy_despawn_routeD"
			],
			[
				"guer_convoy_spawn_routeE", 
				[
					"guer_convoy_middle_routeE", 
					"guer_convoy_middle_routeE_1",
					"guer_convoy_middle_routeE_2",
					"guer_convoy_middle_routeE_3",
					"guer_convoy_middle_routeE_4",
					"guer_convoy_middle_routeE_5",
					"guer_convoy_middle_routeE_6",
					"guer_convoy_middle_routeE_7",
					"guer_convoy_middle_routeE_8",
					"guer_convoy_middle_routeE_9",
					"guer_convoy_middle_routeE_10",
					"guer_convoy_middle_routeE_11",
					"guer_convoy_middle_routeE_12",
					"guer_convoy_middle_routeE_13",
					"guer_convoy_middle_routeE_14",
					"guer_convoy_middle_routeE_15"
				],
				"guer_convoy_despawn_routeE"
			]
		]
	}
};

// Get always a different waypoint group
_availableWaypoints = _waypointGroups - (missionNamespace getVariable "PIG_waypointGroupUsed");
if (_availableWaypoints isEqualTo []) then {
 _availableWaypoints = _waypointGroups;
};

_selectedWaypoints = selectRandom  _availableWaypoints;

(missionNamespace getVariable "PIG_waypointGroupUsed") pushBack _selectedWaypoints;

_selectedWaypoints // [spawn, [middle], despawn]