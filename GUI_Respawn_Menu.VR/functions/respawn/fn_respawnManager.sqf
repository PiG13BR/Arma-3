/*
Author: PiG13BR
fn_respawnManager.sqf

Description:
Function for handling the menu respawn

Parameters:
-

Return:
-
*/

deploy = 0;
refresh = 0;
_oldSel = -999;

/* Don't close dialog with ESC button
_display = findDisplay 1000;
_display displayAddEventHandler ["KeyDown", {(_this select 1) isEqualTo 1}];
*/

waitUntil {(dialog) && (vehicle player == player) && (alive player)};

// Create the camera using the player pos
respawn_camera = "camera" camCreate (getposATL player);
camUseNVG false;

while {dialog && alive player && deploy == 0} do {

	// Get the respawn object list
	PIG_respawn_list = [] call compileFinal preprocessFileLineNumbers "scripts\respawnList.sqf";
	if (count PIG_respawn_list == 0) exitWith {["No respawn point provided or available."] call bis_fnc_error};

	lbClear 2100;
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
	if (lbCurSel 2100 == -1) then {
		lbSetCurSel [2100, 0];
	};

	respawn_object = (PIG_respawn_list select 1) select (lbCurSel 2100);

	// Mobile respawn? Make sure enemies are not nearby
		if (respawn_object isKindOf "landVehicle") then {
			private _nearE = (respawn_object nearEntities [["Man","Landvehicle"], 20]) select {(side _x == east)};
			if (count _nearE >= 1) then {
				ctrlSetText [1600, "Not Available"];
				ctrlEnable [1600, false];
			} else {
				ctrlSetText [1600, "Deploy"];
				ctrlEnable [1600, true];
			}
		// Not a mobile respawn
		} else {
			ctrlSetText [1600, "Deploy"];
			ctrlEnable [1600, true];
		};

	if (lbCurSel 2100 != _oldSel) then {
		_oldSel = lbCurSel 2100;

		// Set camera target
		respawn_camera camSetTarget respawn_object;
		respawn_camera cameraEffect ["internal","back"];
		respawn_camera camSetPos [(getpos respawn_object select 0) - 20, (getpos respawn_object  select 1) + 20, (getpos respawn_object  select 2) + 20];
		respawn_camera camcommit 0;
		respawn_camera camSetPos [(getpos respawn_object select 0) - 20, (getpos respawn_object  select 1) - 20, (getpos respawn_object  select 2) + 20];
		respawn_camera camcommit 60;
	};

	private _actualSel = lbCurSel 2100;
	uiSleep 0.1;
};

if (dialog && deploy == 1) then {
	// Respawn successful
	player setposATL [((getPos respawn_object select 0) + 5) - (random 10),((getPos respawn_object select 1) + 5) - (random 10),(getPos respawn_object select 2)];
	closeDialog 0;
	respawn_camera cameraEffect ["Terminate","back"];
	camDestroy respawn_camera;
};