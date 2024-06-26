params["_unit", "_group", "_height"];
playSound "parasound";

// Create marker (visible only for that group using the halo jump)
createMarkerLocal ["marker_halo", PIG_haloPos];
"marker_halo" setMarkerTypeLocal "hd_start";
"marker_halo" setMarkerColorLocal "colorBLUE";
"marker_halo" setMarkerTextLocal "HALO";

"saltoText" cutFadeOut 0.5;
sleep 0.5;

// Disable simulation. The player and its group can't move.
{
	_x enableSimulation false
} forEach units _group;

// Some text with black out
cutText ["Se preparando para o salto...", "BLACK OUT"];

// text with timing
private _teltime = 5; // You can chance this number. "Waiting for the jump (in seconds)".
while { _teltime>0 } do {
	_teltime = _teltime - 1;
	titleText [str(_teltime), "PLAIN DOWN", 1];
	sleep 1;
};

// Check if player has parachute. if not, add one.
/*if !(unitBackpack _unit isKindof "rhs_d6_Parachute_backpack") then {
		{
			_x addBackPack "rhs_d6_Parachute_backpack"
		}forEach units _group;
};*/
{
	private _checkUnit = _x;
	if !(unitBackpack _checkUnit isKindof "B_Parachute") then {
		_checkUnit addBackPack "B_Parachute"
	}
}forEach units _group;

// Restore screen and closes de map (forced)
{
	cutText ["", "BLACK IN"];
} remoteExec ["call", _group];
titleFadeOut 1;
openMap false;

// Restore simulation
{
	_x enableSimulation true
} forEach units _group;

// set position and height for the group 
{
	_x setPos [(PIG_haloPos select 0) + random(50), (PIG_haloPos select 1) + random(50), _height]
} forEach units _group;

waitUntil {
	sleep 1;
	!alive leader _group || isTouchingGround leader _group
};

leader _group addAction ["Call Respawn", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	private _pos = getPos _caller;
	[_caller, _pos, _actionId] execVM 'scripts\PIG_dropRespawn.sqf'
}]