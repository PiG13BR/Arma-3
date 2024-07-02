clientReady = false;
allArsenalReady = false;
playerRoleSelected = false;

//-----------------------------------------------------------------
// Arsenal
[] call compileFinal preprocessFileLineNumbers "presets\arsenal\init_config.sqf";
[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\arsenal_config.sqf";
waitUntil {sleep 1; allArsenalReady};
//-----------------------------------------------------------------
// Roles selection
[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\role_selection.sqf";
waitUntil {sleep 1; playerRoleSelected};

clientReady = true;