// Thanks to Larrow from the bohemia forum for the base for this script
// Script reworked by PiG13BR

PIG_fnc_updateSectors = {
	params["_sectors"];
	_size = 10;
	{
		_trigger = _x getVariable "areas" select 0;
		_trigger setTriggerActivation[ "any", "present", false ];
		_trigger setTriggerStatements[ "false", "", "" ];
		_trigger setTriggerType "none";
		_trigger setTriggerArea[ _size, _size, 0, false ];
	}forEach _sectors;
};

PIG_fnc_lockSector = {
	params["_sectors"];
	{
		_trigger = _x getVariable "areas" select 0;
		_trigger setTriggerActivation[ "any", "present", false ];
		_trigger setTriggerStatements[ "false", "", "" ];
		_trigger setTriggerType "none";
		_trigger setTriggerArea[ 0, 0, 0, false ];
	}forEach _sectors;
};

// Save default sectors marker parameters
PIG_fnc_saveDefaultMarker = {
	params [ "_sector"];
	// get areas from sector
	_areas = _sector getVariable "areas";
	// get a reference to the trigger of this area
	_trigger = _areas select 0;
	// get the marker for this trigger
	_trigMarkerArea = (_trigger getVariable "markers") select 0;
	defaultMarkerAreaColor = markerColor _trigMarkerArea;
	_trigMarker = (_trigger getVariable "markers") select 1;
	defaultMarkerType = markerType _trigMarker;
	defaultMarkerColor = markerColor _trigMarker;
	_trigMarkerIconText = (_trigger getVariable "markers") select 2;
	defaultMarkerTextColor = markerColor _trigMarkerIconText;
};

// set default marker type and color when opposite side takes the advanced sectors (that your side cannot capture anymore)
PIG_fnc_defaultOpossiteMarker = {
	params [ "_sectors", "_side"];
	{
		// get areas from sector
		_areas = _x getVariable "areas";
		// get a reference to the trigger of this area
		_trigger = _areas select 0;
		// get the marker for this trigger
		_trigMarker = (_trigger getVariable "markers") select 1;
		_trigMarker setMarkerText "";
		_triggerMarkerArea = (_trigger getVariable "markers") select 0;
		_triggerMarkerArea setMarkerAlpha 0;
		// 
		switch (_side) do {
			case west : {
				_trigMarker setMarkerType defaultMarkerType;
				_sideColor = [east, true] call BIS_fnc_sideColor; // get side color
				_trigMarker setMarkerColor _sideColor;
			};
			case east : {
				_trigMarker setMarkerType defaultMarkerType;
				_sideColor = [west, true] call BIS_fnc_sideColor; // get side color
				_trigMarker setMarkerColor _sideColor;
			}
		}
	}forEach _sectors
};

// set default marker type and color for the same side when the side moves foward and leave one sector behind, that is not a defend objective nor attack objective (generally when a side has 3 or more sectors available)
PIG_fnc_defaultSideMarker = {
	params [ "_sectors", "_side"];
	{
		// get areas from sector
		_areas = _x getVariable "areas";
		// get a reference to the trigger of this area
		_trigger = _areas select 0;
		// get the marker for this trigger
		_trigMarker = (_trigger getVariable "markers") select 1;
		_trigMarker setMarkerText "";
		_triggerMarkerArea = (_trigger getVariable "markers") select 0;
		_triggerMarkerArea setMarkerAlpha 0;

		switch (_side) do {
			case west : {
				_trigMarker setMarkerType defaultMarkerType;
				_sideColor = [west, true] call BIS_fnc_sideColor; // get side color
				_trigMarker setMarkerColor _sideColor;
			};
			case east : {
				_trigMarker setMarkerType defaultMarkerType;
				_sideColor = [east, true] call BIS_fnc_sideColor; // get side color
				_trigMarker setMarkerColor _sideColor;// PlaceHolder
			}
		}
	}forEach _sectors
};

PIG_fnc_updateAttackMarker = {
	params [ "_sector" ];
	// get areas from sector
	_areas = _sector getVariable "areas";
	// get a reference to the trigger of this area
	_trigger = _areas select 0;
	// get the marker for this trigger
	_trigMarker = (_trigger getVariable "markers") select 1; // select 0 pega markerArea (grid), select 1 pega o markerIcon (icone do meio), select 2 pega o iconText (o nome do setor)
	// change type and color of the icon marker
	_trigMarker setMarkerType "o_unknown";
	_trigMarker setMarkerText "Attack";
	_trigMarker setMarkerColor "colorOrange";
	// Make marker area visible
	_triggerMarkerArea = (_trigger getVariable "markers") select 0;
	_triggerMarkerArea setMarkerBrush "Border";
	_triggerMarkerArea setMarkerColor defaultMarkerAreaColor;
	_triggerMarkerArea setMarkerAlpha 1;
};

PIG_fnc_updateDefenseMarker = {
	params [ "_sector" ];
	// get areas from sector
	_areas = _sector getVariable "areas";
	// get a reference to the trigger of this area
	_trigger = _areas select 0;
	// get the marker for this trigger
	_trigMarker = (_trigger getVariable "markers") select 1;
	_trigMarker setMarkerType "n_unknown";
	_trigMarker setMarkerText "Defend";
	_trigMarker setMarkerColor "colorCIV";
	_triggerMarkerArea = (_trigger getVariable "markers") select 0;
	_triggerMarkerArea setMarkerColor "Default";
	// Make marker area visible
	_triggerMarkerArea = (_trigger getVariable "markers") select 0;
	_triggerMarkerArea setMarkerBrush "Border";
	_triggerMarkerArea setMarkerColor defaultMarkerAreaColor;
	_triggerMarkerArea setMarkerAlpha 1;
};