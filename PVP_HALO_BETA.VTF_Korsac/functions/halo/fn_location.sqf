// CREATE A PARADROP LOCATION FOR BLUFOR
// get position of the marker
_centerpos = getMarkerPos "bluforArea_marker";
// Get the area size of the marker
_areasize = getMarkerSize "bluforArea_marker";
_rangeX = _areasize select 0;
_rangeY = _areasize select 1;
// Get direction
_dir = MarkerDir "bluforArea_marker";
// Create a location
PIG_bluLoc = createLocation ["Name", _centerpos, _rangeX, _rangeY];  // Cria um local baseado no raio do marker
PIG_bluLoc setRectangular true;
PIG_bluLoc setDirection _dir;

publicVariable "PIG_bluLoc";

// CREATE A PARADROP LOCATION FOR OPFOR
// get position of the marker
_centerpos = getMarkerPos "opforArea_marker";
// get the area size of the marker
_areasize = getMarkerSize "opforArea_marker";
_rangeX = _areasize select 0;
_rangeY = _areasize select 1;
// Get direction
_dir = MarkerDir "opforArea_marker";
// Create a location
PIG_opfLoc = createLocation ["Name", _centerpos, _rangeX, _rangeY];  // Cria um local baseado no raio do marker
PIG_opfLoc setRectangular true;
PIG_opfLoc setDirection _dir;

publicVariable "PIG_opfLoc";