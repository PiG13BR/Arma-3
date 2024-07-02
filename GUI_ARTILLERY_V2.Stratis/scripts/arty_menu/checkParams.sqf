// Check if the artillery is selected
private _indexArty = lbCurSel 2100;
if (_indexArty == -1) exitWith {hint "Select the artillery piece";};

// Check if the ammunition is selected
private _indexAmmo = lbCurSel 2101;
if (_indexAmmo == -1) exitWith {hint "Select the ammo type"};

// Check how many rounds
private _indexRound = lbCurSel 2102;
if (_indexRound == -1) exitWith {hint "Select how many rounds"};

// Check if the player clicked on the map
if (PIG_clicked == false) exitWith {hint "Select a position in the map"};

// Check if the selected artillery is busy
private _arty = uiNamespace getVariable "artySelected";
if (!unitReady _arty) exitWith {hint "The artillery is busy right now"};

// Check if the artillery is in range
private _ammo = lbData [2101,_indexAmmo];


execVM "scripts\arty_menu\fireArty.sqf";

// (Option) Delete the artillery from the list box for a while
// PIG_artillery_support = PIG_artillery_support - _arty;