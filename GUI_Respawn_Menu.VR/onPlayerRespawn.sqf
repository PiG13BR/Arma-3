params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

createDialog "PiG_RscRespawnMenu";
[] spawn PIG_fnc_respawnManager;

deleteVehicle _oldUnit;
