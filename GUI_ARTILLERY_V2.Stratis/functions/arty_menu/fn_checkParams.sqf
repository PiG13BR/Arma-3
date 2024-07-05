/* 
Author: PiG13BR
fn_checkParams.sqf

Description:
Checks if the player selected the items from the list boxes
Checks if the player selected a target position

Parameter(s):
-

Return:
-
*/
	
// Check if the artillery is selected
private _indexArty = lbCurSel 2100;
if (_indexArty == -1) exitWith {hint "Select the artillery piece"; PIG_fire_button = 0;};
// Get the selected artillery object
private _arty = uiNamespace getVariable "artySelected";

// Check if the ammunition is selected
private _indexAmmo = lbCurSel 2101;
if (_indexAmmo == -1) exitWith {hint "Select the ammo type"; PIG_fire_button = 0;};
// Get the selected artillery ammo
_ammo = lbData [2101,_indexAmmo]; 

// Check how many rounds
private _indexRound = lbCurSel 2102;
if (_indexRound == -1) exitWith {hint "Select how many rounds"; PIG_fire_button = 0;};
// Get the selected rounds
_rounds = lbValue [2102,_indexRound];

// Check if the player clicked on the map
if (isNil "PIG_artyPos") exitWith {hint "Select a position in the map"; PIG_fire_button = 0;};
// Get marker position and it's elevation (Legion)
_targetPos = getMarkerPos ["marker_arty", true];

if (PIG_fire_button == 1) then {
	_clientId = clientOwner;
	[((_arty) select 0), _ammo, _rounds, _targetPos] remoteExec ["PIG_fnc_fireArty",[_clientId,2]];
	// Don't close the dialog and run the script again
	[] spawn PIG_fnc_fetchArtyInfo;
	[] spawn PIG_fnc_checkDialog;

	// Remove map single click EH
	["arty_event", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

	// Delete the placeholder target marker
	deleteMarkerLocal "marker_arty";

	// Delete pos variable
	PIG_artyPos = nil;
};