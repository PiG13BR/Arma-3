/* 
Script by PiG13BR
*/
sleep 1;
// Define roles classnames
PIG_officer = "rhsusf_usmc_marpat_wd_officer";
PIG_tleader = "rhsusf_usmc_marpat_wd_teamleader";
PIG_mg = "rhsusf_usmc_marpat_wd_autorifleman_m249";
PIG_rifleman = "rhsusf_usmc_marpat_wd_rifleman_m4";
PIG_engineer = "rhsusf_usmc_marpat_wd_engineer";
PIG_medic = "rhsusf_army_ucp_medic";
PIG_rifleman_LAT = "rhsusf_usmc_marpat_wd_riflemanat";
PIG_rifleman_LAT2 = "rhsusf_usmc_marpat_wd_smaw";
PIG_rifleman_HAT = "rhsusf_usmc_marpat_wd_javelin";
PIG_rifleman_HAT_assist = "rhsusf_usmc_marpat_wd_javelin_assistant";
PIG_granadier = "rhsusf_usmc_marpat_wd_grenadier";

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
	case default {	
	["No classname match found, check the role_selection.sqf"] call bis_fnc_error
	}
}
/*
Hello. I have a script1 (from init.sqf) that calls a script2 and calls script3 and so one (grabbing variables and stuff). It's all working nice when the player spawns at first time. But when they return to the lobby and respawns again,
the script1 calls script2, and script2 calls script3, but the script 3 doesn't call the rest of the scripts, even though the script to be called is working normally if I exec on debug. Why is that?
/*if (player isKindOf PIG_officer) then {
	execVM "presets\arsenal\arsenal_presets\roles\officer_role.sqf";
};

/*if (player isKindOf PIG_tleader) then {
	execVM "presets\arsenal\arsenal_presets\roles\tleader_role.sqf";
}; 

/*if (player isKindOf PIG_mg) then {
	execVM "presets\arsenal\arsenal_presets\roles\mg_role.sqf";
};

if (player isKindOf PIG_mg_assist) then {
	execVM "presets\arsenal\arsenal_presets\roles\mg_assist_role_role.sqf";
};

if (player isKindOf PIG_rifleman) then {
	execVM "presets\arsenal\arsenal_presets\roles\rifleman_role.sqf";
};

if (player isKindOf PIG_medic) then {
	execVM "presets\arsenal\arsenal_presets\roles\medic_role.sqf";
};

if (player isKindOf PIG_engineer) then {
	execVM "presets\arsenal\arsenal_presets\roles\engineer_role.sqf";
};
if (player isKindOf PIG_rifleman_LAT) then {
	execVM "presets\arsenal\arsenal_presets\roles\lat_role.sqf";
};

if (player isKindOf PIG_rifleman_LAT2) then {
	execVM "presets\arsenal\arsenal_presets\roles\lat2_role.sqf";
};

if (player isKindOf PIG_rifleman_HAT) then {
	execVM "presets\arsenal\arsenal_presets\roles\hat_role.sqf";
};

if (player isKindOf PIG_rifleman_HAT_assist) then {
	execVM "presets\arsenal\arsenal_presets\roles\hat_assist_role.sqf";
};*/