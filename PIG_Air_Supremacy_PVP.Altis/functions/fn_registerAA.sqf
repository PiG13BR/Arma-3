/*
	File: fn_registerAA.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/05/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Register AA gun

	Parameter(s):
		-
	
	Returns:
		-
*/

if (!isServer) exitWith {};

params["_unit"];

_type = typeOf _unit; 
_pos = getPos _unit;
_dir = getDir _unit;

deleteVehicleCrew _unit;
deleteVehicle _unit;

[_unit, _type, _pos, _dir] call PIG_fnc_createAA;