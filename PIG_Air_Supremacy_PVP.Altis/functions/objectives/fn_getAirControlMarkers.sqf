/*
	File: fn_getAirControlMarkers.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/01/11
	Last Update: 2024/07/11

	Description:
		Get air control markers with the same pattern

	Parameter(s):
		-
	
	Returns:
		_selectedMarker - selected air control marker [STRING]
*/

private _markerPattern = "air_control";
private _airControlMarkers = allMapMarkers select { ((toLowerANSI _x) find _markerPattern) == 0 };
if ((count _airControlMarkers) == 0) exitWith { ["No air control markers were found"] call bis_fnc_error }; 

_selectedMarker = selectRandom _airControlMarkers; // Select one marker

_selectedMarker
