// High Altitude Low Opening (HALO) parachute jump script
// Features: PVP purposes; Halo jump in a group.

// The idea of this script is to make the halo jump avaiable just for one side and the addAction avaiable only to the leader of a group
// My sugestion is to put the addAction code in the initPlayerLocal.sqf
// The halo jump is to be used in the beggining of a mission. not to be used as a teleport.

params["_unit", "_height"];

// Create Global Variable
PIG_clicked = false;

// Open map (forced) and generate some text
openMap true;
"saltoText" cutText ["Clique no mapa onde será o salto", "PLAIN DOWN", 2];

// get halo jump coordinates by clicking on map
/*onMapSingleClick {
	coords = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld getMousePosition; // get 2D coordinates. https// forums.bohemia.net/forums/topic/213546-how-to-return-2d-cursor-world-position/
	
	onMapSingleClick ""; true; // Single click only
};*/

/*addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	coords = _pos;
	clicked = true;
}];*/

[ "halo_event", "onMapSingleClick", { PIG_haloPos = _pos; PIG_clicked = true; } ] call BIS_fnc_addStackedEventHandler;

// Wait until player click on the map or close the map
waitUntil {
	sleep 1;
	PIG_clicked or !(visibleMap)
};

// if player close the map before clicking on it, then the jump is cancelled (exit script)
if !(visibleMap) exitWith {
	_unit groupchat "Salto cancelado.";
	"saltoText" cutFadeOut 0.1;
};

// if the player clicks on the map, it runs the rest of the code below
_group = group _unit;

[ "halo_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;

// Remote call for every group member
[_unit, _group, _height] remoteExec ["PIG_fnc_haloJump", _group];
// Test
/*_hintOk = "Hello, World!";
_hintOk remoteExec ["PIG_fnc_test", _group]; // this functions works on dedi/*


/*Moved to functions
"saltoText" cutFadeOut 0.5;
	sleep 0.5;
	
// Disable simulation. The player and its group can't move.
	{
		_x enableSimulation false
	} forEach units _group;
	
// Some text with black out
	{
		cutText ["Se preparando para o salto...", "BLACK OUT"];
	} remoteExec ["call", _group];
	
// text with timing
_teltime = 5; // You can chance this number. "Waiting for the jump (in seconds)".
	while { _teltime>0 } do {
		_teltime = _teltime - 1;
		titleText [str(_teltime), "PLAIN DOWN", 1];
		sleep 1;
	};
	
// Check if player has parachute
	if !(unitBackpack _unit isKindof "rhs_d6_Parachute_backpack") then {}
	
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
		_x setPos [coords select 0, coords select 1, _height]
	} forEach units _group;