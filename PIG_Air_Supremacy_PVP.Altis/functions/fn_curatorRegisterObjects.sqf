/*
	File: fn_curatorRegisterObjects.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/05/11
	Last Update: 2024/05/11
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Update editable objects for curator

	Parameter(s):
		-
	
	Returns:
		-
*/

while {true} do {
	sleep 10;
	{
		_x addCuratorEditableObjects [allUnits, true];
		_x addCuratorEditableObjects [vehicles, true];
	}forEach allCurators;
}