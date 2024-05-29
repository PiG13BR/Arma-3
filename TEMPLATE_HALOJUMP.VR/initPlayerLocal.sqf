// Remove all gear
params["_player"];

_side = west;

removeAllWeapons _player;
removeHeadgear _player;
removeVest _player;
removeGoggles _player;
removeAllItemsWithMagazines _player;
_player unassignItem "NVGoggles";
_player removeItem "NVGoggles";
removeBackpackGlobal _player;

// High Altitude Low Opening (HALO) parachute jump
if ((playerSide == _side && (leader group _player) == leader _player)) then {
	poleHalo addAction [["<t color='#80FF80'>-- HALO JUMP</t><img size='2' image='res\ui_redeploy.paa'/>"] joinString "", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_caller, 1000] execVM "scripts\PiG_halo.sqf";
	}, nil, 1, false, true, "", "side _this == west"];
};