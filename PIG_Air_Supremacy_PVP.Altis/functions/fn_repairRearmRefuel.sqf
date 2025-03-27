/*
	File: fn_repairRearmRefuel.sqf
	Author: PiG13BR - https://github.com/PiG13BR
	Date: 2024/31/10
	Last Update: 2024/10/11
    License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		RRR player's jet

	Parameter(s):
		_vehicle - player's vehicle [OBJECT]
	
	Returns:
		-
*/

params ["_vehicle"];

_fnc_restoreAmmo = {
    params ["_vehicle"];

    // Rearm pylons 
    {
        _pylonIndex = _x # 0;
        _pylonName = _x # 1;
        _magazineType = _x # 3;
        _ammoCount = _x # 4;

        // Ignore dummy pylons
        private _cfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Components" >> "TransportPylonsComponent" >> "Pylons" >> _pylonName);
        if (getArray (_cfg >> "hardpoints") isEqualTo []) then { continue };

        private _maxAmmoCount = (getNumber(configFile >> "CfgMagazines" >> _magazineType >> "count"));

        if (_ammoCount == _maxAmmoCount) then {continue}; // Ignore pylons with full ammo count
        
        _vehicle setAmmoOnPylon [_pylonIndex, _maxAmmoCount]
        
    } forEach (getAllPylonsInfo _vehicle);

    _allMagazines = magazinesAllTurrets _vehicle;

    // Rearm remeaning magazines left (cannon, countermeasures)
    {
        _magazineType = _x # 0;
        _turretPath = _x # 1;
        _ammoCount = _x # 2;
        _owner = _x # 4;

        private _maxAmmoCount = (getNumber(configFile >> "CfgMagazines" >> _magazineType >> "count"));
        if (_ammoCount == _maxAmmoCount) then {continue}; // Ignore magazines with full ammo count
        
        if (local _vehicle) then {
            _vehicle setMagazineTurretAmmo [_magazineType, _maxAmmoCount, _turretPath];
        } else {
            [_vehicle, [_magazineType, _maxAmmoCount, _turretPath]] remoteExec ["setMagazineTurretAmmo", _owner];
        };
        
    }forEach _allMagazines;
};

[_vehicle] call _fnc_restoreAmmo;
_vehicle setFuel 1;
_vehicle setDamage 0;

systemChat "Jato reparado, remuniciado e reabastecido";
