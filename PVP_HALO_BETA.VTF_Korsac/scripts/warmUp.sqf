_warmUpValue = 30;
_warmUpMinutes = _warmUpValue / 60; // in minutes

_counter = 0;

warmUpTimerActive = true;

titleText [format ["<t size='1.5'>BRIEFING TIME... %1 MINUTES</t>", _warmUpMinutes], "PLAIN DOWN", 2, false, true];

// loop until _warmUpValue is under 60 seconds
while { _warmUpValue > 61 } do {
	_warmUpValue = _warmUpValue - 1;
	_counter = _counter + 1; // get 60 seconds
	if (_counter == 60) then {
		_warmUpMinutes = _warmUpValue / 60; // update minutes
		titleText [format ["<t size='1.5'>BRIEFING TIME... %1 MINUTES</t>", _warmUpMinutes], "PLAIN DOWN", 2, false, true];
		_counter = 0; // reset counter
	};
	sleep 1;
};

while { _warmUpValue > 1 } do {
	_warmUpValue = _warmUpValue - 1;
	// count in seconds
	titleText [format ["<t size='1.5'>BRIEFING TIME... %1 SECONDS</t>", _warmUpValue], "PLAIN DOWN", 1, false, true];
	titlefadeOut 1;
	sleep 1;
};


warmUpTimerActive = false;

if !(warmUpTimerActive) exitWith
{
	titleText [format ["<t size='1.5'>HALO JUMP AVAILABLE!</t>"], "PLAIN DOWN", 1, false, true];
	sleep 2;
	titlefadeOut 2;
};

/*
	if (hasInterface) then {
		_run = true;
		_playersSide = side player;
		
		player sideChat "DO NOT LEAVE YOUR BASE UNTIL NOTIFIED!";
		
		while { _run } do {
			_warned = false;
			if !(warmUpTimerActive == "true") exitWith
			{
				_run = false;
				titleText ["YOU MAY LEAVE YOUR BASE - GAME ON!!!", "PLAIN", 10];
			};
			
			if (_playersSide == west && player distance westBase > 300 && !_warned) then {
				titleText ["GET IN BASE WITHIN 15 SECONDS OR BE KILLED", "PLAIN", 13];
				sleep 15;
				_warned = true;
			};
			if (_playersSide == independent && player distance independentBase > 300 && !_warned) then {
				titleText ["GET IN BASE WITHIN 15 SECONDS OR BE KILLED", "PLAIN", 13];
				sleep 15;
				_warned = true;
			};
			
			if (_playersSide == west && player distance westBase > 301 && _warned) then {
				player setDamage 1;
			};
			if (_playersSide == independent && player distance independentBase > 301 && _warned) then {
				player setDamage 1;
			};
			sleep .2;
		};
	};