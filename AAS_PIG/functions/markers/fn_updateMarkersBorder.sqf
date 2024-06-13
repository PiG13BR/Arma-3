/* 
Author: PiG13BR
PIG_fnc_updateMarkersBorder.sqf

Description:
Updates the markers brush color to all sectors each time some sector gets captured

Parameter(s):
0: ARRAY - SECTORS MODULE

Return:
-
*/

params["_sectors"];
{
	// Change marker border
	_trig = _x getVariable "areas" select 0;
	_markerArea = (_trig getVariable "markers") select 0;
	// _markerArea setMarkerBrush "Border";
	_markerArea setMarkerColor "ColorBLACK";

}forEach _sectors;