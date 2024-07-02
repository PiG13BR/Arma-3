["arty_event", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

// Delete the placeholder target marker
deleteMarkerLocal "marker_arty";

// Make always a different name for the markers
_numName = uiNamespace getVariable "numMarkerName";
if (isNil "_numName") then {
	_numName = 0
};
_numName = _numName + 1;
// Always store the number created in the variable so that not repeats on the next time
uiNamespace setVariable ["numMarkerName", _numName];
private _markerName = format["arty_icon_%1",_numName];

_numBorder = uiNamespace getVariable "numMarkerBorder";
if (isNil "_numBorder") then {
	_numBorder = 0
};
_numBorder = _numBorder + 1;
uiNamespace setVariable ["numMarkerBorder", _numBorder];
private _markerBorderName = format["arty_border_%1",_numBorder];

// Get the selected artillery object, it's classname and it's name
private _artySelected = (uiNamespace getVariable "artySelected") select 0;
private _indexArty = lbCurSel 2100;
private _artyClass = lbData [2100,_indexArty];
private _nameArty = getText(configFile >> "CfgVehicles" >> _artyClass >> "displayName");
// Get the selected artillery ammo
private _indexAmmo = lbCurSel 2101;
_ammo = lbData [2101,_indexAmmo];
_isInRange = PIG_artyPos inRangeOfArtillery [[_artySelected], _ammo];
if !(_isInRange) exitWith {hint "Out of artillery range"};
// Get the selected rounds
private _indexRounds = lbCurSel 2102;
_rounds = lbValue [2102,_indexRounds];

// Actually fire the artillery
_artySelected doArtilleryFire [PIG_artyPos, _ammo, _rounds];
// Get the ETA of the impact (in seconds)
_eta = _artySelected getArtilleryETA [PIG_artyPos, _ammo];
_eta = round(floor (_eta));

//Create a border marker
_markerBorder = createMarkerLocal [_markerBorderName, PIG_artyPos];
_markerBorder setMarkerShapeLocal "ELLIPSE";
_markerBorder setMarkerBrushLocal "BDiagonal";
_markerBorder setMarkerSizeLocal [75,75];
_markerBorder setMarkerColorLocal "colorRED";

// Create a artillery target marker
_markerIcon = createMarkerLocal [_markerName, PIG_artyPos];
_markerIcon setMarkerTypeLocal "hd_objective";
_markerIcon setMarkerColorLocal "colorRED";
_markerIcon setMarkerShapeLocal "ICON";
_markerIcon setMarkerTextLocal "Artillery Fire" + " " + str _nameArty + " " + "(" + str _eta + "s" + ")";

// Don't close the dialog and run the script again
[] execVM "scripts\arty_menu\getArtySupport.sqf";

// Sleep based on the impact ETA
sleep (10 + _eta);
deleteMarkerLocal _markerIcon;
deleteMarkerLocal _markerBorder;

// (Option) Adds back the artillery to the support list
// PIG_artillery_support = PIG_artillery_support + [_artySelected];

