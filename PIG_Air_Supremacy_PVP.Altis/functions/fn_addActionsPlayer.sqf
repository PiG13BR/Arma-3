/*
	File: fn_addActionsPlayer.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/31/10
	Last Update: 2024/04/10
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Add actions for the player

	Parameter(s):
		_player - player unit [OBJECT]
	
	Returns:
		-
*/
params["_player"];

// View distance
_player addAction [["<t size='1.1' color='#E99B00'>", "Mudar Visão de Distância", "</t>"] joinString "", {
	params ["_target", "_caller", "_actionId", "_arguments"];

		[] call PIG_fnc_setViewDistance;
	},
	nil,		// arguments
	-100,		// priority
	false,		// showWindow
	true,		// hideOnUse
	"User12",	// shortcut
	"true",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
]