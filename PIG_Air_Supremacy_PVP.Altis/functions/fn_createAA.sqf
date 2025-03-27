/*
	File: fn_createAA.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/05/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Creates and manages registered AA guns

	Parameter(s):
		-
	
	Returns:
		-
*/

params["_unit", "_type", "_position", "_direction"];
if (!canSuspend) exitWith {_this spawn PIG_fnc_createAA};

if (isNil {missionNamespace getVariable "PIG_AAAsites"}) then {
	missionNamespace setVariable ["PIG_AAAsites", []];
};

sleep 1; // Spawn in 5 minutes once this code is called

deleteVehicle _unit; // Old unit

_group = assignedGroup _unit;
{
	deleteVehicle _x;
}forEach units _group;

private _aaVeh = createVehicle [_type, _position, [], 0, "NONE"];
_aaVeh allowdamage false;
_aaVeh enableSimulation false;

_group = createVehicleCrew _aaVeh;
_aaVeh deleteVehicleCrew (driver _aaVeh);
_group addVehicle _aaVeh;

_aaVeh setDir _direction;

_aaVeh allowCrewInImmobile true;

_aaVeh addEventHandler ["fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_unit setVehicleAmmo 1;
}];

_aaVeh addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
	if (!canFire _unit) then {_unit setDamage 1; _unit removeEventHandler [_thisEvent, _thisEventHandler]};
}];

_aaVeh addMPEventHandler ["MPKilled", { 
	params ["_unit", "_killer", "_instigator", "_useEffects"]; 
	_type = typeOf _unit; 
	_pos = getPos _unit; 
	_dir = getDir _unit; 
 
	[_unit, _type, _pos, _dir] call PIG_fnc_createAA; 
}];

_aaVeh addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret", "_isEject"];
	// If crew from this vehicle exits, delete it then
	deleteVehicle _unit;
	// If no vehicle crew is found (the last one got out, explode it)
	if ((crew _vehicle) isEqualTo []) then {
		_vehicle setDamage 1;
	};
}];

_aaVeh allowdamage true;
_aaVeh enableSimulation true;

(missionNamespace getVariable "PIG_AAAsites") pushBack _aaVeh;