params["_unit", "_group", "_height"];

playSound "parasound";

private _side = side _unit;
private _colorSide = [_side, true] call BIS_fnc_sideColor;

// Remove respawn point (base) for this group
switch (_side) do {
	case west : {
		[PIG_group_player, PIG_BluforBrieRes select 1] call BIS_fnc_removeRespawnPosition;
	};
	case east : {
		[PIG_group_player, PIG_OpforBrieRes select 1] call BIS_fnc_removeRespawnPosition;
	}
};

// Create marker (visible only for that group using the halo jump)
createMarkerLocal ["marker_halo", PIG_haloPos];
"marker_halo" setMarkerTypeLocal "hd_start";
"marker_halo" setMarkerColorLocal _colorSide;
"marker_halo" setMarkerTextLocal "HALO";

"saltoText" cutFadeOut 0.5;
"selectFail" cutFadeOut 0.5;
sleep 0.5;

// Disable simulation. The player and its group can't move.
{
	_x enableSimulation false
} forEach units _group;

// Some text with black out
cutText [localize "STR_WAIT_HALO", "BLACK OUT"];

// text with timing
private _telTime = 5; // You can chance this number. "Waiting for the jump (in seconds)".
while { _telTime>0 } do {
	_telTime = _telTime - 1;
	if (_telTime == 0) then {
		titleText ["GO!", "PLAIN DOWN", 1];
	};
	if (_telTime > 0) then {
		titleText [str(_telTime), "PLAIN DOWN", 1];
	};
	sleep 1;
	
};

// Restore simulation
{
	_x enableSimulation true
} forEach units _group;

// set position and height for the group 
{
	_x setPos [(PIG_haloPos select 0) + random(50), (PIG_haloPos select 1) + random(50), _height]
} forEach units _group;


// Restore screen and closes de map (forced)
cutText ["", "BLACK IN"];
titleFadeOut 1;
openMap false;

// Check if player has parachute. if not, add one and save its backpack if player has one already.
{
	[_x] remoteExec ["PIG_fnc_saveBackPack",_x];
}forEach units _group;

// Add action for leader only
[_unit] remoteExec ["PIG_fnc_addCallRespawn", _unit];

sleep 30;

deleteMarkerLocal "marker_halo";