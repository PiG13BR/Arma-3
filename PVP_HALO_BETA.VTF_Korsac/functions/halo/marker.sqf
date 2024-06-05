_centerpos = getMarkerPos _areamarker;
_centerX = abs(_centerpos select 0);
_centerY = abs(_centerpos select 1);

_areasize = getMarkerSize _areamarker;
_rangeX = _areasize select 0;
_rangeY = _areasize select 1;

_areadir = (markerDir _areamarker) * -1;

_centerpos = getMarkerPos _areamarker;
_areasize = getMarkerSize _areamarker;
_rangeX = _areasize select 0;
_rangeY = _areasize select 1;
_loc = createLocation ["paradrop", _centerpos, _rangeX, _rangeY];
if (player in _loc) then {
	hint "ok";
}


[trigger, markerName] call BIS_fnc_triggerToMarker

[ "halo_event", "onMapSingleClick", {
	PIG_haloPos = _pos;
	PIG_clicked = true;
	call {
		openMap true;
		onMapSingleClick
		{
			if ((getMarkerPos "paraDrop_blufor") distance2D _pos <= 50) then {
				hint "ok";
			}
		}
	};

	_areaMarker = ["paradrop_blufor"] call BIS_fnc_getArea;
	_areaMarker = _areaMarker select 0; // coords in [x, y, z]

	[[4549.36, 4511, 0], 0, 0, 0, false, -1]

	call {
		private ["_distance", "_distanceMin", "_marker"];

		_marker = "marker_4";

		_distanceMin = worldSize;

		{
			_distance = (getMarkerPos _x) distance2D player;

			if ((_distance >= 400) and {
				_distance < _distanceMin
			}) then {
				_distanceMin = _distance;
				_marker = _x;
				hint "ok";
			};
		} forEach allMapMarkers;

		_marker
	};
} ] call BIS_fnc_addStackedEventHandler;