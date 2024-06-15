/* 
Author: PiG13BR
PIG_fnc_defaultOpossiteMarker.sqf

Description:
Restores the default opossite side marker of a sector (type and color)

Parameter(s):
0: OBJECT - SECTOR MODULE
1: SIDE (east, west, independent)

Return:
-
*/
params [ "_sector", "_side"];

_side call BIS_fnc_sideID;
private _colorSide = [_side, true] call BIS_fnc_sideColor;

private _icon = ["o_installation", "b_installation", "n_installation", "n_installation", "u_installation"] select ((_side call BIS_fnc_sideID) min 4);
private _sideIcon = "BIS_fnc_moduleSector_icon" + str _sector;
_sideIcon setMarkerTypeLocal _icon;
_sideIcon setMarkerColorLocal _colorSide;
_sideIcon setMarkerTextLocal "";
