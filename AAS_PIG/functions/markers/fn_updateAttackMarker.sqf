/* 
Author: PiG13BR
PIG_fnc_updateAttackMarker.sqf

Description:
Update the attack marker for a side in sector control mode.

To change the markers from a sector locally, take all marker from a sector (using a trigger as reference)
	allMapMarkers select {(getMarkerPos _x) inArea triggerA}
	Return: ["BIS_fnc_moduleSector_areaTriggerA","BIS_fnc_moduleSector_iconsectorA","BIS_fnc_moduleSector_iconTextsectorA"]
In the BIS_fnc_moduleSector the marker's name are created in this form:
	_markerIcon = createmarker ["BIS_fnc_moduleSector_icon" + str _logic,position _trigger];
	_markerIconText = createmarker ["BIS_fnc_moduleSector_iconText" + str _logic,position _trigger];
	_markerArea = createmarker ["BIS_fnc_moduleSector_area" + str _trigger,position _trigger];

Parameter(s):
0: OBJECT - SECTOR MODULE

Return:
-
*/

params ["_sector"];

// Change icon
_attackMarker = "BIS_fnc_moduleSector_icon" + str _sector; // get the name of the marker of the sector
_attackMarker setMarkerTypeLocal "o_unknown";
_attackMarker setMarkerColorLocal "colorOrange";
private _text = localize "STR_ATTACK_SECTOR";
_attackMarker setMarkerTextLocal _text;