{
	_x addCuratorEditableObjects [allUnits, true];
	_x addCuratorEditableObjects [vehicles, true];
} forEach allCurators;

// Make a new preset (get inventory from the boxes in the base)
PIG_bluforInventory = [bluforMun, "Blufor inventory", "This is a preset"] call wolf_logistics_main_fnc_createPresetFromBox;
PIG_opforInventory = [opforMun, "Opfor inventory", "This is a preset"] call wolf_logistics_main_fnc_createPresetFromBox;
// Transmit these variable to the clients
publicVariable "PIG_bluforInventory";
publicVariable "PIG_opforInventory";

// Set respawn in briefing area
PIG_BluforBrieRes = [west, PIG_poleHaloBlufor, "Base"] call BIS_fnc_addRespawnPosition;
PIG_OpforBrieRes = [east, PIG_poleHaloOpfor, "Base"] call BIS_fnc_addRespawnPosition;
// Transmit these variable to the clients
publicVariable "PIG_BluforBrieRes";
publicVariable "PIG_OpforBrieRes";

warmUpTimerActive = false;