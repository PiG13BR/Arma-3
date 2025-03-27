/*
	File: fn_getArtyMarkers.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/07/11
	Last Update: 2024/07/11

	Description:
		Get artillery markers with the same pattern

	Parameter(s):
		-
	
	Returns:
		_selectedMarkers - selected artillery markers [ARRAY]
*/

params ["_side"];

private _markerPattern = format["%1_artillery", toLowerANSI (str _side)];
private _artyMarkers = allMapMarkers select { ((toLowerANSI _x) find _markerPattern) == 0 };
if ((count _artyMarkers) < 3) exitWith { ["No artillery position markers were found or less then 3 markers found (need at least 3 or more)"] call bis_fnc_error }; 

private _selectedMarkers = [];

// Select the lucky 3 markers
for "_i" from 1 to 3 do {
	_marker = selectRandom _artyMarkers;
	_selectedMarkers pushBack _marker;
	_artyMarkers = _artyMarkers - [_marker];
};

_selectedMarkers 
