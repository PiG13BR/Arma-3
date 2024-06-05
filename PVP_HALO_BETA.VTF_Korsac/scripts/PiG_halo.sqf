params["_unit", "_height", "_sideParadrop"];

PIG_clicked = false;

// Open map (forced) and generate some text
openMap true;
"saltoText" cutText [["<t size='2.0'>", localize "STR_CLICK_HALO", "</t>"] joinString "", "PLAIN DOWN", 2, true, true];

switch (_sideParadrop) do {
	case west : {
		PIG_location = PIG_bluLoc
	};
	case east : {
		PIG_location = PIG_opfLoc
	}
};

// Halo event onMapSingleClick
[ "halo_event", "onMapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	// get position from the onMapSingleClick (_pos)
	PIG_haloPos = _pos;
	// Check if the position clicked is INSIDE the location
	if (PIG_haloPos in PIG_location) then {
		PIG_clicked = true;
	} else {
		"saltoText" cutFadeOut 0.1;
		"selectFail" cutText [["<t size='2.0' color='#C80000'>", localize "STR_MISS_CLICK", "</t>"] joinString "", "PLAIN DOWN", 2, true, true];
	}
} ] call BIS_fnc_addStackedEventHandler;
	
// Wait until player clicks on the map or closes the map
	waitUntil {
		sleep 1;
		PIG_clicked or !(visibleMap)
	};
	
// if player closes the map before clicking on it, then jumping is cancelled (exit script)
	if !(visibleMap) exitWith {
		_unit groupchat "Salto cancelado.";
		"saltoText" cutFadeOut 0.5;
		"selectFail" cutFadeOut 0.5;
	};

// if the player clicks on right area, it runs the rest of the code below
["halo_event", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

// get group from the leader (_unit)
	_group = group _unit;
	
// Remote call the halo jump function for every group member
	[_unit, _group, _height] remoteExec ["PIG_fnc_haloJump", _group];