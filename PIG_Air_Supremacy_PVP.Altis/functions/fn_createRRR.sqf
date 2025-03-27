/*
	File: fn_createRRR.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/10/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Create functional areas to Repair, rearm and refuel for the player's jets

	Parameter(s):
		-
	
	Returns:
		-
*/
params ["_side"];

private _markerPattern = format ["%1_rrr", toLowerANSI (str _side)];
private _rrrMarkers = allMapMarkers select { ((toLowerANSI _x) find _markerPattern) == 0 };

{
	_trg = [objNull, _x] call BIS_fnc_triggerToMarker;
	_trg setTriggerType "NONE";
	_trg setTriggerActivation [(toUpperANSI(str _side)), "PRESENT", true];
	_trg setTriggerInterval 1;
	_trg setTriggerStatements [
		toString {
			(this) && {(vehicle player) in thisList}
		},
		toString {
			PIG_safeZone = true;
			if (!(isNull (objectParent player))) then {
				if ((!isNil {missionNamespace getVariable "PIG_huntPlayerJet"}) && {(vehicle player) == (missionNamespace getVariable "PIG_huntPlayerJet")}) exitWith {};
					[vehicle player] call PIG_fnc_repairRearmRefuel;
					[vehicle player] spawn PIG_fnc_safeZone;
			}
		},
		toString {
			PIG_safeZone = false;
		}
	];
}forEach _rrrMarkers;