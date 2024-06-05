params["_unit","_pos", "_side", "_group"];

private _colorSide = [_side, true] call BIS_fnc_sideColor;
createMarkerLocal ["marker_respawn", _pos];
"marker_respawn" setMarkerTypeLocal "mil_flag";
"marker_respawn" setMarkerColorLocal _colorSide;

private _text = formatText['Respawn %1', _group];
private _textString = str _text;
"marker_respawn" setMarkerTextLocal _textString;