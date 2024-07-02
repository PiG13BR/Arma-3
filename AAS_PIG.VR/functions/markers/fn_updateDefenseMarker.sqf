/* 
Author: PiG13BR
PIG_fnc_updateDefenseMarker.sqf

Description:
Update the defense marker for a side in sector control mode.

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
_defenseMarker = "BIS_fnc_moduleSector_icon" + str _sector; // get the name of the marker of the sector
_defenseMarker setMarkerTypeLocal "n_unknown";
_defenseMarker setMarkerColorLocal "colorCIV";
private _text = localize "STR_DEFEND_SECTOR";
_defenseMarker setMarkerTextLocal _text;