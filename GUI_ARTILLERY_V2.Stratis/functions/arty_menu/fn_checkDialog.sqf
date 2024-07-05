/* 
Author: PiG13BR
fn_checkDialog.sqf

Description:
Checks the dialog

Parameter(s):
-

Return:
BOOLEAN
*/

// Wait until the player closes the dialog and not clicked on the fire button OR if the player clicked on the fire button
waitUntil {
	sleep 1;
	(!(dialog)) || ((PIG_fire_button == 1) && (PIG_arty_firing));
};

sleep 1;
// Check if the player closes the dialog before clicking the fire button
if !(dialog) exitWith {
	deleteMarkerLocal "marker_arty";
	// if the player clicks on right area, it runs the rest of the code below
	["arty_event", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	false
};

true