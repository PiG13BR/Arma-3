/* 
Author: PiG13BR
PIG_fnc_defaultSideMarker.sqf

Description:
Restores the default side marker of sectors (type and color)

Parameter(s):
0: ARRAY - SECTORS MODULE
1: SIDE (east, west, independent)

Return:
-
*/

params [ "_sectors", "_side"];
if (count _sectors == 0) exitWith {};

_side call bis_fnc_sideID;
private _colorSide = [_side, true] call BIS_fnc_sideColor;

{
	private _icon = ["o_installation","b_installation","n_installation","n_installation","u_installation"] select ((_side call bis_fnc_sideID) min 4);
	private _sideIcon = "BIS_fnc_moduleSector_icon" + str _x;
	_sideIcon setMarkerTypeLocal _icon;
	_sideIcon setMarkerColorLocal _colorSide;
	_sideIcon setMarkerTextLocal "";
}forEach _sectors