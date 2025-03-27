// General Settings Params
PIG_totalTickets_param = "respawnTickets" call BIS_fnc_getParamValue;; // Total tickets for each team
PIG_autoclean_param = "autoClean" call BIS_fnc_getParamValue; // Timer to delete empty and dead vehicles/objects
PIG_fuelConsumption_param = "fuelConsumptionCoef" call BIS_fnc_getParamValue; // Fuel comsuptiom x armed pylon 

// Date/Weather/Timer Params
PIG_startTime_param = "startTime" call BIS_fnc_getParamValue; // Start time
PIG_weather_param = "startWeather" call BIS_fnc_getParamValue; // Weather
PIG_timerMultiplierDay_param = "timeMultiplierDay" call BIS_fnc_getParamValue; // Time multiplier (day)
PIG_timerMultiplierNight_param = "timeMultiplierNight" call BIS_fnc_getParamValue; // Time multiplier (night)

// Objectives Params
PIG_availableMissions_param = "missionAvailable" call BIS_fnc_getParamValue; // Available missions
PIG_requiredPlayers_param = "minPlayerRequired" call BIS_fnc_getParamValue; // Required players to start missions
PIG_selectTaskDelay_param = "missionSelectorDelay" call BIS_fnc_getParamValue; // Time to start a new mission. Incluing the first one.
PIG_airControlTimer_param = "airControlTimer" call BIS_fnc_getParamValue; // Airspace Control objective countdown timer
PIG_huntTimer_param = "huntTimer" call BIS_fnc_getParamValue; // Hunt objective countdown timer
PIG_artyTimer_param = "artyTimer" call BIS_fnc_getParamValue; // Artillery objective coutdown timer
PIG_fakeArtyFire_param = "artyFakeFire" call BIS_fnc_getParamValue; // Enable/Disable fake artillery fire for artillery objective
PIG_convoyVehiclesLength_param = "convoyLength" call BIS_fnc_getParamValue; // How many vehicles will be spawned in the convoy objective

// Convert Params
switch (PIG_availableMissions_param) do {
	case 0 : {PIG_availableMissions_param = []};
	case 1 : {PIG_availableMissions_param = ["CONVOY", "AIR CONTROL", "HUNT", "ARTY"]};
	case 2 : {PIG_availableMissions_param = ["CONVOY", "AIR CONTROL", "ARTY"]};
	case 3 : {PIG_availableMissions_param = ["CONVOY"]};
	case 4 : {PIG_availableMissions_param = ["AIR CONTROL"]};
	case 5 : {PIG_availableMissions_param = ["ARTY"]}
};

if (PIG_fakeArtyFire_param == 1) then {PIG_fakeArtyFire_param = true} else {PIG_fakeArtyFire_param = false};