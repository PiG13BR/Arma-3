/* 
Script by PiG13BR
*/
sleep 1;
// Define roles classnames
_officer = "B_officer_F";
_tleader = "";
_mg = "";
_rifleman = "";
_engineer = "";
_medic = "";
_rifleman_LAT = "";
_rifleman_LAT2 = "";
_rifleman_HAT = "";
_rifleman_HAT_assist = "";
_granadier = "";
_pilot = "";

// Get the class name (must match with one above!!)
_classRole = typeOf player;

sleep 1;

switch (_classRole) do {
	case _officer : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\officer_role.sqf";
		playerRoleSelected = true;
	};
	case _tleader : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\tleader_role.sqf";
		playerRoleSelected = true;
	};
	case _mg : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\mg_role.sqf";
		playerRoleSelected = true;
	};
	case _rifleman : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\rifleman_role.sqf";
		playerRoleSelected = true;
	};
	case _medic : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\medic_role.sqf";
		playerRoleSelected = true;
	};
	case _engineer : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\engineer_role.sqf";
		playerRoleSelected = true;
	};
	case _rifleman_LAT : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\lat_role.sqf";
		playerRoleSelected = true;
	};
	case _rifleman_LAT2: {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\lat2_role.sqf";
		playerRoleSelected = true;
	};
	case _rifleman_HAT : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\hat_role.sqf";
		playerRoleSelected = true;
	};
	case _rifleman_HAT_assist : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\rifleman_role.sqf";
		playerRoleSelected = true;
	};
	case _granadier : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\granadier_role.sqf";
		playerRoleSelected = true;
	};
	case _pilot : {
		[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\roles\pilot_role.sqf";
		playerRoleSelected = true;
	};
	case default {	
	["No classname match found, check the role_selection.sqf"] call bis_fnc_error
	}
}