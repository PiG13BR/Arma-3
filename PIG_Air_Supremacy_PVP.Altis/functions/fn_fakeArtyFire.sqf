/*
	File: fn_fakeArtyFire.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/08/11
	Last Update: 2024/08/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Manages the artillery fake fire

	Parameter(s):
		_vehicle - artillery unit [OBJECT]
		_side - side target [SIDE]
	
	Returns:
		-
*/

params["_vehicle", "_sideTarget"];

if (!canSuspend) exitWith {_this spawn PIG_fnc_fakeArtyFire};
if (!PIG_fakeArtyFire_param) exitWith {diag_log "[FAKE ARTILLERY FIRE] Disabled"};

// Delete projectile (fake artillery fire)
_vehicle addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

	deleteVehicle _projectile;
	 if (!local _unit) then {
        private _clientId = owner _unit;
        [_unit, 1] remoteExec ["setVehicleAmmo", _clientId];
    } else {
        _unit setVehicleAmmo 1;
    };
}];

private _markersTarget = [_sideTarget] call PIG_fnc_getArtyMarkers;
private _markers = _markersTarget select {(markerPos _x) inRangeOfArtillery [[_vehicle], ((getArtilleryAmmo [_vehicle]) select 0)]};

while {alive _vehicle} do {
	if (local _vehicle) then {
		_vehicle doArtilleryFire [(markerPos (selectRandom _markers)), ((getArtilleryAmmo [_vehicle]) select 0), 6 + (random 6)];
	} else {
		[(markerPos (selectRandom _markers)), ((getArtilleryAmmo [_vehicle]) select 0), 6 + (random 6)] remoteExec ["doArtilleryFire", owner _vehicle];
	};
	
	sleep 60 + (random 60);
};
