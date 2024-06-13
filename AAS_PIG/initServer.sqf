waitUntil {
	time > 0
};

PIG_sectors = [sectorA, sectorB, sectorC, sectorD]; // PUT ALL YOUR NAMED SECTORS HERE
PIG_triggers = [triggerA, triggerB, triggerC, triggerD]; // PUT ALL YOUR NAMED TRIGGERS HERE (those synchronized with area > sector)

// Select the current sectors for each side
currentWestSectors = [sectorA];
currentEastSectors = [sectorD];

// Select the attack sector for each side
westAttackSector = currentWestSectors select 0;
eastAttackSector = currentEastSectors select 0;

// Initial setup for the sectors
[PIG_sectors] call PIG_fnc_initialSetup;

{
	_trig = _x getVariable "areas" select 0;
	_trig setTriggerActivation [ "EAST", "PRESENT", true ];
}forEach currentEastSectors;

{
	_trig = _x getVariable "areas" select 0;
	_trig setTriggerActivation [ "WEST", "PRESENT", true ];
}forEach currentWestSectors;

[westAttackSector] remoteExec ["PIG_fnc_updateAttackMarker",west, true];
[eastAttackSector] remoteExec ["PIG_fnc_updateAttackMarker",east, true];

lastWestSector = [];
lastEastSector = [];

// This script adds event handlers on each sector
[] execVM "scripts\EH_sectors.sqf";
