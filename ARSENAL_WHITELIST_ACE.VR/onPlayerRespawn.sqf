// When players spawn for the first time, they will also read this script.
params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
_newUnit setUnitLoadout(_newUnit getVariable["Saved_Loadout",[]]);

// When respawns, add action for the players
[_newUnit] call PIG_fnc_addActionPlayers;

sleep 60;
deleteVehicle _oldUnit;