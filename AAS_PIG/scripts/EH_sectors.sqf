/*
Credits: Larrow (https://forums.bohemia.net/forums/topic/176089-unlocking-a-sector-when-another-sector-has-been-taken/)
Reworked by PiG13BR
*/

// Loop through all sectors in the mission.
{
	_sector = _x;
	// Add the SEH to each sector
	[_sector, "ownerChanged", {
		_h = _this spawn {
			params[ "_sector", "_owner", "_ownerOld" ];

			// Wait until this sector owned by "no one" is equal to the owner (east or west)
			waitUntil {
				sleep 0.1;
				_sector getVariable[ "owner", sideUnknown ] isEqualTo _owner;
			};

			// If owner of the sector is NOT equal to "unknown" side (white flag), in other words: if the sector was capture by east or west, then...
			if !(_owner isEqualTo sideUnknown) then {
				// Create a variable _sectorIndex to find if this sector (inside the variable _sector) is in the global variable "sectors"
				_sectorIndex = PIG_sectors find _sector;// It generates a number (index) for success and -1 if not found. SectorA in this case is 0, sectorB is 1, sectorE is 4, etc.
				{
					// forEach sides. Define each side as _side
					_side = _x;
					// if owner is equal to the side defined, then...
					// side gaining sectors
					if (_owner isEqualTo _side) then {
						switch (_side) do {
							case west : {
								// Update current west sectors (under command and fowards capturable ones)
								currentWestSectors = PIG_sectors select [ 0, _sectorIndex + 2 ];
								// Update defense sector marker
								westDefenseSector = _sector;
								if !(isNil "westDefenseSector") then {
									[westDefenseSector] remoteExec [ "PIG_fnc_updateDefenseMarker", west, true];
								};
								// Update attack sector marker
								westAttackSector = currentWestSectors select [  _sectorIndex + 1 ]; // Advanced new sector
								westAttackSector = westAttackSector select 0;
								if !(isNil "westAttackSector") then {
									// When the last sector is captured, this variable will become nil
									[westAttackSector] remoteExec ["PIG_fnc_updateAttackMarker", west, true];
								};
								// select the last capturable sector if this side has >= 3 sectors
								if (count currentWestSectors >= 3 || (count currentWestSectors == 0)) then {
									lastWestSector = PIG_sectors select [0, _sectorIndex];
									[lastWestSector, _owner] remoteExec ["PIG_fnc_defaultSideMarker", west, true];
								} else {
									lastWestSector = nil;
								};
							};
							case east : {
								// Update current west sectors (under command and fowards capturable ones)
								if !(_sectorIndex == 0) then {
									// When east captures the last sector, the _sectorIndex is 0, the currentEastSectors gets empty and the opossite side will be able to capture the next sector (the first one sector for them and the next one)
									currentEastSectors = PIG_sectors select [ _sectorIndex - 1, count PIG_sectors ];
								};
								// Update sector marker (defend marker)
								eastDefenseSector = _sector; // Sector Captured
								if !(isNil "eastDefenseSector") then {
									[eastDefenseSector] remoteExec [ "PIG_fnc_updateDefenseMarker", east, true ];
								};
								// Update sector marker (attack marker)
								eastAttackSector = currentEastSectors select 0; // Advanced new sector
								if !(isNil "eastAttackSector") then {
									[eastAttackSector] remoteExec [ "PIG_fnc_updateAttackMarker", east, true ];
								};
								// select the last capturable sector if this side has >= 3 sectors
								if ((count currentEastSectors >= 3) || (count currentEastSectors == 0)) then {
									lastEastSector = PIG_sectors select [_sectorIndex + 1];
									[lastEastSector, _owner] remoteExec [ "PIG_fnc_defaultSideMarker", east, true ];
								} else {
									lastEastSector = nil;
								};
							}
						}
						// else: when the opposite side captures a sector (owner is not equal to side that is defined in this loop).
					} else {
						switch (_side) do {
							case west : {
								// side losing sectors
								if (_ownerOld isEqualTo _side) then {
									// Update the current west sectors
									currentWestSectors = PIG_sectors select [ 0, _sectorIndex + 1 ];
									// Selects the lost foward sector
									westLostFowardSector = PIG_sectors select [_sectorIndex + 1] select 0;
									// Restores the default markers of the lost sector
									if !(isNil "westLostFowardSector") then {
										[westLostFowardSector, _owner] remoteExec ["PIG_fnc_defaultOpossiteMarker", west, true];
									};
									// Update sector marker (defend marker)
									westDefenseSector = PIG_sectors select [_sectorIndex - 1] select 0;
									if !(isNil "westDefenseSector") then {
										[westDefenseSector] remoteExec [ "PIG_fnc_updateDefenseMarker", west, true];
									};
								};
								// Update sector marker (attack marker)
								westAttackSector = currentWestSectors select(count currentWestSectors - 1);
								[westAttackSector] remoteExec ["PIG_fnc_updateAttackMarker", west, true];

								// When the opossite side captures all the sectors, the currentSIDEsectors array gets empty (count == 0)
								if (count currentWestSectors isEqualTo 0) then {
									currentWestSectors = [PIG_sectors select 0]; // First sector
								};
							};
							case east : {
								// side losing sectors
								if (_ownerOld isEqualTo _side) then {
									// Update the current west sectors
									currentEastSectors = PIG_sectors select [ _sectorIndex, count PIG_sectors ];
									// Selects the lost foward sector
									eastLostFowardSector = PIG_sectors select [_sectorIndex - 1] select 0;
									// Restores the default markers of the lost sector
									if !(isNil "eastLostFowardSector") then {
										[eastLostFowardSector, _owner] remoteExec [ "PIG_fnc_defaultOpossiteMarker", east, true];
									};
									// Update sector marker (defend marker)
									eastDefenseSector = PIG_sectors select [_sectorIndex + 1] select 0;
									if !(isNil "eastDefenseSector") then {
										[eastDefenseSector] remoteExec [ "PIG_fnc_updateDefenseMarker", east, true ];
									};
								};
								// Update sector marker (attack marker)
								eastAttackSector = currentEastSectors select 0;
								[eastAttackSector] remoteExec [ "PIG_fnc_updateAttackMarker", east, "JIPEast" ];

								// When the opossite side captures all the sectors, the currentSIDEsectors array gets empty (count == 0)
								if (count currentEastSectors isEqualTo 0) then {
									currentEastSectors = [PIG_sectors select (count PIG_sectors - 1)]; // "Last" sector
								};
							}
						}
					}
				}forEach [ east, west ];

				// Update the triggers of the sectors
				{
					_trig = _x getVariable "areas" select 0;
					_trig setTriggerActivation [ "WEST", "PRESENT", true ];
				}forEach (currentWestSectors - currentEastSectors);

				{
					_trig = _x getVariable "areas" select 0;
					_trig setTriggerActivation [ "EAST", "PRESENT", true ];
				}forEach (currentEastSectors - currentWestSectors);

				// Combine the current sectors of each side to get a match
				// If the sides have a sector in commom to attack, make them capturable by "any"
				_jointSectors = currentEastSectors arrayIntersect currentWestSectors;

				{
					_trig = _x getVariable "areas" select 0;
					_trig setTriggerActivation [ "ANY", "PRESENT", true ];
				}forEach _jointSectors;

				// The brush in each sector will be restored to its default (with the color of the side that captures it)
				// This function make sures that the brush stay the same color always
				[PIG_sectors] call PIG_fnc_updateMarkersBorder;
			}
		};
	}] call BIS_fnc_addScriptedEventHandler;
}forEach PIG_sectors;