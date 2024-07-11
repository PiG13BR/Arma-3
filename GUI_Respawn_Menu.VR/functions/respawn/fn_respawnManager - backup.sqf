/*
Author: PiG13BR
*/

lbClear 2100;
deploy = 0;
refresh = 0;

/* Don't close dialog with ESC button
_display = findDisplay 1000;
_display displayAddEventHandler ["KeyDown", {(_this select 1) isEqualTo 1}];
*/

waitUntil {vehicle player == player && alive player};

// Get the respawn object list
PIG_respawn_list = [] call compileFinal preprocessFileLineNumbers "scripts\respawnList.sqf";
if (count PIG_respawn_list == 0) exitWith {["No respawn point provided or available."] call bis_fnc_error};

// Add to the list box
{
	// Only alive objects
	if (alive _x) then {
		_name = (PIG_respawn_list select 0) select _forEachIndex;
		lbAdd [2100, _name];
	} else {
		hint "";
	}
}forEach (PIG_respawn_list select 1);

// Force select the first element of the list box
lbSetCurSel [2100, 0];

// Create the camera
_indexZero = lbCurSel 2100;
_camera_object = (PIG_respawn_list select 1) select _indexZero;
respawn_camera = "camera" camCreate (getposATL _camera_object);
camUseNVG false;

// Start camera position. Get the first object from the list.
respawn_camera camSetTarget _camera_object;
respawn_camera cameraEffect ["internal","back"];
respawn_camera camSetPos [(getpos _camera_object select 0) - 20, (getpos _camera_object  select 1) + 20, (getpos _camera_object  select 2) + 20];
respawn_camera camcommit 0;
respawn_camera camSetPos [(getpos _camera_object select 0) - 20, (getpos _camera_object  select 1) - 20, (getpos _camera_object  select 2) + 20];
respawn_camera camcommit 60;

// Add EH to the list box
_display = ((findDisplay 1000) displayCtrl 2100);
_display ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];

	_respawn_object = (PIG_respawn_list select 1) select _lbCurSel;

	if !(alive _respawn_object) then {
		ctrlSetText [1600, "Not Available"];
		_control ctrlSetDisabledColor [0.372549, 0.00392157, 0.00392157, 1];
		ctrlEnable [1600, false];
	} else {
		ctrlSetText [1600, "Deploy"];
		_control ctrlSetActiveColor [0.30, 0.25, 0.2, 0.75];
		ctrlEnable [1600, true];
	};

	respawn_camera camSetTarget _respawn_object;
	respawn_camera cameraEffect ["internal","back"];
	respawn_camera camSetPos [(getpos _respawn_object select 0) - 20, (getpos _respawn_object  select 1) + 20, (getpos _respawn_object  select 2) + 20];
	respawn_camera camcommit 0;
	respawn_camera camSetPos [(getpos _respawn_object select 0) - 20, (getpos _respawn_object  select 1) - 20, (getpos _respawn_object  select 2) + 20];
	respawn_camera camcommit 60;

}];

waitUntil {sleep 0.1; deploy == 1 || refresh == 1};

if (deploy == 1) then {
	_index = lbCurSel 2100;
	PIG_respawn_selected = (PIG_respawn_list select 1) select _index;
};

// Final code. Also checks if the respawn selected is still alive
if (dialog && deploy == 1 && {alive player} && {alive PIG_respawn_selected}) then {
    // Respawn successful
	player setposATL [((getPos PIG_respawn_selected select 0) + 5) - (random 10),((getPos  PIG_respawn_selected select 1) + 5) - (random 10),(getPos PIG_respawn_selected select 2)];
	closeDialog 0;
	respawn_camera cameraEffect ["Terminate","back"];
	camDestroy respawn_camera;
} else {
	// Restart the script and don't close the dialog
	camDestroy respawn_camera;
	terminate _thisScript; [] spawn PIG_fnc_respawnManager;
};