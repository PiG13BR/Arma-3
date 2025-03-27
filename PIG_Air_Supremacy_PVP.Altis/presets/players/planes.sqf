/*
	Author: PiG13BR

	Put classnames of the airplanes that you want the players to use.
	I recommend to repeat the same classes in both teams to make sure that the gameplay will be balanced
*/

params["_side"];
private _planes = [];

switch (_side) do {
	case east : {
		_planes = [
			// NATO Planes (Vanilla)
			"B_Plane_CAS_01_dynamicLoadout_F", 
			"B_Plane_Fighter_01_F", 
			// OPFOR Planes (Vanilla)
			"O_Plane_CAS_02_dynamicLoadout_F",
			"O_Plane_Fighter_02_F",
			"O_Plane_Fighter_02_Stealth_F",
			// POOK Soviet Pack
			"pook_MIG21_OPFOR",
			"pook_Mig23_OPFOR",
			"pook_MIG29_OPFOR",
			"pook_MIG31_OPFOR",
			"pook_MIG35_OPFOR",
			"pook_Su22_OPFOR",
			"pook_SU27_OPFOR",
			"pook_SU30_OPFOR",
			"pook_YAK38_OPFOR",
			// FIR
			"FIR_A10C",
			"FIR_F14D",
			"FIR_F15D",
			"FIR_F16D",
			"FIR_F18D",
			"FIR_AV8B_NA_Blank",
			"FIR_F22",
			"FIR_Su25SM3",
			// RHS
			"rhs_mig29sm_vvsc", // Improved + FIR
			"RHS_Su25SM_vvsc",
			"RHS_T50_vvs_blueonblue"
		];
	};
	case independent : {
		_planes = [
			// NATO Planes (Vanilla)
			"B_Plane_CAS_01_dynamicLoadout_F", 
			"B_Plane_Fighter_01_F", 
			// OPFOR Planes (Vanilla)
			"O_Plane_CAS_02_dynamicLoadout_F",
			"O_Plane_Fighter_02_F",
			// POOK Soviet Pack
			"pook_MIG21_OPFOR",
			"pook_Mig23_OPFOR",
			"pook_MIG29_OPFOR",
			"pook_MIG31_OPFOR",
			"pook_MIG35_OPFOR",
			"pook_Su22_OPFOR",
			"pook_SU27_OPFOR",
			"pook_SU30_OPFOR",
			"pook_YAK38_OPFOR",
			// FIR
			"FIR_A10C",
			"FIR_F14D",
			"FIR_F15D",
			"FIR_F16D",
			"FIR_F18D",
			"FIR_AV8B_NA_Blank",
			"FIR_F22",
			"FIR_Su25SM3",
			// RHS
			"rhs_mig29sm_vvsc", // Improved + FIR
			"RHS_Su25SM_vvsc",
			"RHS_T50_vvs_blueonblue"
		];
	}
};

_planes = _planes select {isClass (configFile >> "CfgVehicles" >> _x)};

_planes