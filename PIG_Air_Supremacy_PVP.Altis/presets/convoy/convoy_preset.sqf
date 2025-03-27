/*
	Author: PiG13BR

	Put convoy presets here. You can put any vehicles you want in the order if you want.
	What I recommend is to put the "scout" vehicle in _vic1 and the "escort" vehicle in the _vic4.
	The convoy script will get the _vic1 for the first vehicle always, and get _vic4 for the last vehicle of the convoy.
	The middle vehicles it will choose randomly between all those array (_vic1, ..., _vic4).
*/

params["_side"];

private _convoy_preset = [];

switch (_side) do {
	case east : {
		// MRAP (Scout vehicle)
		_vic1 = [
			"O_MRAP_02_hmg_F"
		];
		// TRANSPORT TRUCKS
		_vic2 = [
			"O_Truck_02_covered_F",
			"O_Truck_03_covered_F"
		];
		// SUPPLIES TRUCKS
		_vic3 = [
			"O_Truck_02_Ammo_F",
			"O_Truck_02_fuel_F",
			"O_Truck_02_box_F",
			"O_Truck_02_medical_F"
		];
		// APC (Escot vehicle)
		_vic4 = [
			"O_APC_Wheeled_02_rcws_v2_F",
			"O_MRAP_02_hmg_F"
		];
		_convoy_preset append [_vic1, _vic2, _vic3, _vic4];
	};
	case independent : {
		_vic1 = [
			"I_MRAP_03_hmg_F"
		];
		_vic2 = [
			"I_Truck_02_covered_F"
		];
		_vic3 = [
			"I_Truck_02_ammo_F",
			"I_Truck_02_fuel_F",
			"I_Truck_02_box_F",
			"I_Truck_02_medical_F"
		];
		_vic4 = [
			"I_APC_Wheeled_03_cannon_F",
			"I_MRAP_03_hmg_F"
		];
		_convoy_preset append [_vic1, _vic2, _vic3, _vic4];
	}
};

_convoy_preset