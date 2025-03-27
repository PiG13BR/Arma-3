if (!isServer) then {waitUntil {!isNil "PIG_serverReady"};};

[] call BIS_fnc_showMissionStatus;

[] call compile preprocessFileLineNumbers "scripts\get_params.sqf";

// Client
[] call compile preprocessFileLineNumbers "scripts\init_client.sqf";

if (isServer) then {
	// Server
	[] call compile preprocessFileLineNumbers "scripts\init_server.sqf";
	PIG_serverReady = true;
	publicVariable "PIG_serverReady";
};

