/*
	File: fn_spawnJet.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/31/10
	Last Update: 2024/25/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Spawn selected jet with loadout configuration selected and teleport the player to it

	Parameter(s):
		_unit - unit player [OBJECT, defaults to objNull]
		_vehicleClass - plane classname [STRING, defaults to ""]
	
	Returns:
		[BOOL]
*/

params[
	["_pilot", objNull, [objNull]],
	["_vehicleClass", "", [""]]
];

if (_pilot isEqualTo objNull) exitWith {["No pilots found"] call bis_fnc_error; false};
if (_vehicleClass isEqualTo "") exitWith {systemChat "Escolha um avião"; false};

_side = side (group _pilot);

// Make a marker name pattern that depends on the spawned unit side
_markerPattern = format ["respawn_jet_%1", if (_side == independent) then { "guer" } else { toLowerANSI (str _side)}];

// Get all the map markers and selects only the marker that matches the pattern
_markers = allMapMarkers select { ((toLowerANSI _x) find _markerPattern) == 0 };

if ((count _markers) == 0) exitWith { ["No markers were found"] call bis_fnc_error }; // If no markers were found, exit the scope

// For the array that contains the markers, select randomly one of them and get it's position.
_marker = selectRandom _markers;
_position = getMarkerPos _marker;

// Position will return numbers in [x,y,z] coords, so the command "set" is selecting the 3 element of the array (z), that is the altitude.
_position set [2, 1000]; // Set spawn altitude. Change the last number if you want to change the altitude.

private _vehicle = createVehicle [_vehicleClass, _position, [], 50, "FLY"];
_vehicle setAirplaneThrottle 1;
_vehicle allowDamage false;

// Use the returned jet to set it's direction accordingly of the spawn marker direction
_vehicle setDir (markerDir _marker);
_vehicle setPosASL _position;
_vehicle setVelocityModelSpace [0,200,0];

// Teleports the player to the jet pilot seat
_unit moveInDriver _vehicle;

[_vehicle, _unit, _marker] spawn {
	params ["_vehicle", "_unit", "_marker"];
	// Setting up the jet pylons loadout
	private _pylonsInfo = getAllPylonsInfo _vehicle select { (_x select 3) isNotEqualTo "" };
	private _pylonsIndices = _pylonsInfo apply { _x select 0 };

	{
		_vehicle setPylonLoadout [_x, "", true]; // Remove all default pylon magazine
	}forEach _pylonsIndices;

	private _pylonLoaded = 0;

	// Add the selected pylons loadout
	{
		_magazine = PIG_jetLoadout select (_forEachIndex);

		_bool = _vehicle setPylonLoadout [_x, _magazine, true];
		if (_magazine isEqualTo "") then {
			sleep 0.5;
			systemChat format ["[MUNIÇÃO] Pylon %1 não carregado", _x];
		} else {
			sleep 1;
			systemChat format ["[MUNIÇÃO] Pylon %1 está armado com %2", _x, _magazine];

			_pylonLoaded = _pylonLoaded + 1; // Pylon armed, add to calculate fuel consumption coeficient
		}
	}forEach _pylonsIndices;

	// Set fuel consumption
	if (_pylonLoaded isNotEqualTo 0) then {
		_vehicle setFuelConsumptionCoef (_pylonLoaded * PIG_fuelConsumption_param);
	};

	PIG_jetLoadout = nil;
};

// Safe spawn
[_vehicle, _unit, _marker] spawn PIG_fnc_safeSpawn;

PIG_jet_spawned = true;

true