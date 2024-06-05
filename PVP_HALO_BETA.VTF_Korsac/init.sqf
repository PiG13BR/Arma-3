// JIP Check (This code should be placed first line of init.sqf file)
if (!isServer && isNull player) then 
{
	isJIP=true;
	waitUntil {!(isNull player)};
} else {
	isJIP=false;
};
// Wait until player is initialized - FIXED JIP CODE

//start warm up script to give players time to gear up and limit them to their base until warm up time is over
[]execVM "scripts\warmUp.sqf";

// Creates locations for each side to paradrop
[] call PIG_fnc_location;