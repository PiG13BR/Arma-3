params["_caller", "_actionId", "_side"];

playerCall = false;

_caller removeAction _actionId;

sleep 2;

PIG_spawnPos = getMarkerPos "spawn_ghost";
private _posCaller = getPos _caller;
private _group = group _caller;

["parasound"] remoteExec ["playSound", _group, false];

private _cargo = "CargoNet_01_box_F" createVehicle (PIG_spawnPos);
_cargo setPos (_posCaller vectorAdd [random 30, random 30, 150]);
[_cargo, 500] remoteExec ["setMass", _cargo];
[objNull, _cargo] call BIS_fnc_curatorObjectEdited; // Esse código adiciona um paraquedas no objeto

sleep 15;

["parasound"] remoteExec ["playSound", _group, false];
private _vehicle = objNull;
switch (_side) do {
	case west : {
		_vehicle = "b_afougf_kozak5_unarmed_F" createVehicle (PIG_spawnPos);

		// "Lock" vehicle
		_vehicle addEventHandler [
			"GetIn", {
				params ["_veh", "_pos", "_unit"];
				if (side _unit != west) then {
					_unit action ["eject", _veh];
				};
			}
		];
	};
	case east : {
		_vehicle = "rhs_tigr_vdv" createVehicle (PIG_spawnPos);

		// "Lock" vehicle
		_vehicle addEventHandler [
			"GetIn", {
				params ["_veh", "_pos", "_unit"];
				if (side _unit != east) then {
					_unit action ["eject", _veh];
				};
			}
		];
	};
	};
};

_vehicle setPos (_posCaller vectorAdd [random 30, random 30, 150]);
[objNull, _vehicle] call BIS_fnc_curatorObjectEdited;
_vehicle allowDamage false;

_cargo addAction [["<img size='2' image='a3\modules_f\data\iconrespawn_ca.paa'/>", "<t size='1.5'>", localize "STR_SET_RESPAWN", "</t>"] joinString "", {
	params ["_target", "_caller", "_actionId", "_arguments"];

	private _side = side _caller;
	private _group = group _caller;
	private _posTarget = getPos _target;

	deleteVehicle _target;

	private _respawnBox = "VirtualReammoBox_camonet_F" createVehicle (PIG_spawnPos);
	private _respawnAnt = "OmniDirectionalAntenna_01_black_F" createVehicle (PIG_spawnPos);
	_respawnAnt attachTo [_respawnBox, [0.6, -0.5, 0.9]];
	clearMagazineCargoGlobal _respawnBox;

	_respawnBox setPos (_posTarget vectorAdd [0, 0, 0.1]);

	["respawnPlaced", []] remoteExecCall ["BIS_fnc_showNotification", _group];
	[_caller, _posTarget, _side, _group] remoteExecCall ["PIG_fnc_markerPlaceHolder", _side];

	sleep 300;

	private _text = formatText['Respawn %1', _group];
	private _textString = str _text;
	[_group, _respawnBox, _textString] call BIS_fnc_addRespawnPosition;

	sleep 1;

	["respawnAssigned", []] remoteExecCall ["BIS_fnc_showNotification", _group];
	[_caller, _posTarget, _side, _group] remoteExecCall ["PIG_fnc_markerRespawn", _side];

	// get inventory from preset 
	sleep 300;

	["ammoResupply", []] remoteExecCall ["BIS_fnc_showNotification", _group];

	switch (_side) do {
		case west : {
			[_respawnBox, PIG_bluforInventory] call wolf_logistics_main_fnc_fillPresetIntoBox;
		};
		case east : {
			[_respawnBox, PIG_opforInventory] call wolf_logistics_main_fnc_fillPresetIntoBox;
		}
	};

	// apply Simple Crate Refill function
	[_respawnBox, 300] call Jig_fnc_simpleCrateRefill;
},
nil, // arguments
998, // priority
true, // showWindow
true, // hideOnUse
"", // shortcut
"", // condition
3, // radius
false, // unconscious
"", // selection
""// memoryPoint
];

_cargo addAction [["<t color='#F2F200'>", localize "STR_PUSH_CRATE", "</t>"] joinString "", {
	(_this select 0) setPos ((_this select 0) getPos [1, (player getDir (_this select 0))]);
},
nil, // arguments
997, // priority
true, // showWindow
false, // hideOnUse
"", // shortcut
"", // condition
5, // radius
false, // unconscious
"", // selection
""// memoryPoint
];

// spawn green smoke on the crate short before it hit the ground
sleep 27;
_smoke = "SmokeShellGreen" createVehicle (getPos _cargo);
_smoke attachTo [_cargo];

// spawn green smoke on the vehicle as it touchs the ground
waitUntil {
	sleep 0.5;
	isTouchingGround _vehicle
};
_smoke = "SmokeShellGreen" createVehicle (getPos _vehicle);
_smoke attachTo [_vehicle];
_vehicle allowDamage false;

// if this vehicle is destroyed, substract 10 tickets from the team
_vehicle addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[PIG_side_player, -10] call BIS_fnc_respawnTickets;
}];