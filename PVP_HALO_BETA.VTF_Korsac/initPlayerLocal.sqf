params["_player"];

PIG_side_player = side _player;
PIG_group_player = group _player;

/* AceGrassCutter to all players
_AceGrassCut = ["grass_cut", "Cut Grass", "",
	{
		[_player] call ace_common_fnc_goKneeling;
		[_player, "AinvPknlMstpSnonWnonDnon_medic_1", 1] call ace_common_fnc_doAnimation;
		[10, [], {
			_cutter = "Land_ClutterCutter_large_F" createVehicle [0, 0, 0];
			_cutter setPos (getPos _player);
			hint "Grass Cut"
		}, {
			hint "Cutting interupted"
		}, "Cutting Grass"] call ace_common_fnc_progressBar
	}, {
		true
	}] call ace_interact_menu_fnc_createAction;

	[_player, 1, ["ACE_SelfActions", "ACE_Equipment"], _AceGrassCut] call ace_interact_menu_fnc_addActionToObject;*/

/* High Altitude Low Opening (HALO) parachute jump for BLUFOR
if ((playerSide == west && (leader group _player) == leader _player)) then {
	PIG_poleHaloBlufor addAction [["<img size='2' image='images\ui_redeploy.paa'/>", "<t size='1.5' color='#80FF80'>", localize "STR_HALOJUMP", "</t>"] joinString "", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _height = 300; // Change the height you want here
		[_caller, _height, PIG_side_player] execVM "scripts\PiG_halo.sqf";
	}, nil, 1000, true, true, "", "leader group _this == leader _this && !(warmUpTimerActive) && PIG_side_player == side _this"];
};

// High Altitude Low Opening (HALO) parachute jump for OPFOR
if ((playerSide == east && (leader group _player) == leader _player)) then {
	PIG_poleHaloOpfor addAction [["<img size='2' image='images\ui_redeploy.paa'/>", "<t size='1.5' color='#80FF80'>", localize "STR_HALOJUMP", "</t>"] joinString "", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _height = 300; // Change the height you want here
		[_caller, _height, PIG_side_player] execVM "scripts\PiG_halo.sqf";
	}, nil, 1000, true, true, "", "leader group _this == leader _this && !(warmUpTimerActive) && PIG_side_player == side _this"];
};/*

/*
// Remove all gear
removeAllWeapons _player;
removeHeadgear _player;
removeVest _player;
removeGoggles _player;
removeAllItemsWithMagazines _player;
_player unassignItem "NVGoggles";
_player removeItem "NVGoggles";
removeBackpackGlobal _player;*/

// Substract 1 ticket for each incapacitated state
_player addEventHandler ["Dammaged", {
	params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
	if (lifeState _player == "UNCONSCIOUS") then {
		[side _player, -1] call BIS_fnc_respawnTickets;
	}
}];

// Substract 1 ticket for each killed state (not TK)
_player addEventHandler ["killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if !(side _killer == side _unit) then {
		[side _player, -1] call BIS_fnc_respawnTickets;
	}
}];

// Add more damage
_player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
	if (_projectile isEqualTo "") exitWith {false};
	_original_damage = if (_selection isEqualTo "") then {damage _unit} else {_unit getHit _selection};
	_added_damage = _damage - _original_damage;
	_coef = 1;//change this to increase or decrease
	_final_damage = _original_damage + _added_damage*_coef;
	_final_damage
}];