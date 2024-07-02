/* 
Author: PiG13BR
PIG_fnc_initialSetup.sqf

Description:
Set all sectors to non-capturable
Change all sectors brush.

Parameter(s):
0: ARRAY - SECTORS MODULE

Return:
-
*/

params["_sectors"];

{	
	private _pos = PIG_triggers select _forEachIndex;
	// Get Trigger Area
	private _trig = _x getVariable "areas" select 0;
	// Set to non-capturable
	_trig setTriggerActivation [ "NONE", "PRESENT", true ];

	// Change marker border
	private _markerArea = (_trig getVariable "markers") select 0; // select 0 pega markerArea (grid), select 1 pega o markerIcon (icone do meio), select 2 pega o iconText (o nome do setor)
	_markerArea setMarkerBrush "Border";
	_markerArea setMarkerColor "ColorBLACK";

	private _triggerMarkerIconText = (_trig getVariable "markers") select 2;
	_triggerMarkerIconText setMarkerPos (getPos _pos vectorAdd [1,6,0]);
}forEach _sectors;