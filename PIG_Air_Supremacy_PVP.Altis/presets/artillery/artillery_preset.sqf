/*
	Author: PiG13BR

	Put the classname of artillery unit to spawn here
*/

params["_side"];

private _artillery = "";
private _patrol = [];

switch (_side) do {
	case east : {
		_artillery = "O_MBT_02_arty_F";
		_patrol = ["O_Soldier_TL_F", "O_Soldier_AA_F", "O_Soldier_AA_F", "O_Soldier_AAA_F"] 
	};
	case independent : {
		_artillery = "I_Truck_02_MRL_F";
		_patrol = ["I_Soldier_TL_F", "I_Soldier_AA_F", "I_Soldier_AA_F", "I_Soldier_AAA_F"] 
	};
};

[_artillery, _patrol]