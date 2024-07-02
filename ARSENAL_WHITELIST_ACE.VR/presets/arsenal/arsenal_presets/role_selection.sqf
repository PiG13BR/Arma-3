/* 
Script by PiG13BR
*/
sleep 1;
// Define roles classnames
PIG_officer = "B_officer_F";
PIG_tleader = "";
PIG_mg = "";
PIG_rifleman = "";
PIG_engineer = "";
PIG_medic = "";
PIG_rifleman_LAT = "";
PIG_rifleman_LAT2 = "";
PIG_rifleman_HAT = "";
PIG_rifleman_HAT_assist = "";
PIG_granadier = "";
PIG_pilot = "";

// Get the class name (must match with one above!!)
_classRole = typeOf player;

sleep 1;

switch (_classRole) do {
	case PIG_officer : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\officer_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_tleader : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\tleader_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_mg : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\mg_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_rifleman : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\rifleman_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_medic : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\medic_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_engineer : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\engineer_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_rifleman_LAT : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\lat_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_rifleman_LAT2: {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\lat2_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_rifleman_HAT : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\hat_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_rifleman_HAT_assist : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\rifleman_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_granadier : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\granadier_role.sqf";
		playerRoleSelected = true;
	};
	case PIG_pilot : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\pilot_role.sqf";
		playerRoleSelected = true;
	};
	case default {	
	["No classname match found, check the role_selection.sqf"] call bis_fnc_error
	}
}