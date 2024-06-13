// A partir daqui se faz um loop em cada setor existente na variavel "sectors" e colocará um event hanlder em cada um deles relacionado a mudança de estado dos setores.
// Loop through all sectors in the mission
{
	// Add the SEH to each sector
	[ _x, "ownerChanged", {
		_h = _this spawn {
			params[ "_sector", "_owner", "_ownerOld" ];

			waitUntil {
					sleep 0.1; _sector getVariable[ "owner", sideUnknown ] isEqualTo _owner
			};

			if !(_owner isEqualTo sideUnknown) then {
				_sectorIndex = sectors find _sector;
				{
					// forEach sides. Define each side as _side
					_side = _x;
					// if owner is equal to the side defined, then...
					// Código responsável pelo "AVANÇO" do time.
					if (_owner isEqualTo _side) then {
						switch (_side) do {
							case west : {
								// Select available sectors
								currentWestSectors = sectors select [ 0, _sectorIndex + 2 ];
								// Select sector marker (defend)
								westDefenseSector = _sector; // Sector Captured
								
								// Seleciona os setores que ficaram para atrás e os desativa.
								// Select the last capturable sector if this side has >= 3 sectors
								if (count currentWestSectors >= 3) then {
									lastWestSector = sectors select [0, _sectorIndex];
								} else {
									lastWestSector = nil;
								};
								// Select sector marker (attack marker)
								westAttackSector = currentWestSectors select [  _sectorIndex + 1 ]; // Advanced new sector
								westAttackSector = westAttackSector select 0;
								if !(isNil "westAttackSector") then {
								// When the last sector is captured, this variable will become nil
								[westAttackSector] remoteExec [ "PIG_fnc_updateAttackMarker", west, "JIPWest" ];
								}
								};
							case east : {
								// Update available sectors
								currentEastSectors = sectors select [ _sectorIndex - 1, count sectors ];
								// Update sector marker (defend marker)
								eastDefenseSector = _sector; // Sector Captured
								// Select the last capturable sector if this side has >= 3 sectors
								if ((count currentEastSectors >= 3) || (count currentEastSectors == 0)) then {
									lastEastSector = sectors select [_sectorIndex + 1];
								} else {
										lastEastSector = nil;
									};
								// Update sector marker (attack marker)
								eastAttackSector = currentEastSectors select 0; // Advanced new sector
								if !(isNil "eastAttackSector") then {
								[eastAttackSector] remoteExec [ "PIG_fnc_updateAttackMarker", east, "JIPEast" ];
								}
							};
						};
					} else {
						// O código entra aqui quando o time oposto captura um setor. Ou seja se o "novo dono do setor" não é igual o "side/lado" que você está.
						// Código responsável pelo "RECUO" do time.
						switch (_side) do {
							case east : {
								if (_ownerOld isEqualTo _side) then {
									// Se o dono antigo do setor que foi capturado é esse lado...
									// Atualiza os setores disponíveis
									currentEastSectors = sectors select [ _sectorIndex, count sectors ];
									// Seleciona a bandeira avançada perdida
									eastLostFowardSector = sectors select [_sectorIndex - 1] select 0;
									// Bloqueia o setor avançado e atualiza a marcação (para a cor do time inimigo)
									[eastLostFowardSector, _owner] remoteExec [ "PIG_fnc_defaultOpossiteMarker", east, "JIPEast" ];
									// Atualiza os setores recuados
									if ((count currentEastSectors >= 3) || (count currentEastSectors == 0)) then {
									lastEastSector = sectors select [_sectorIndex + 2];
									} else {
										lastEastSector = nil;
									};
									// Atualiza a marcação de ataque
									eastAttackSector = currentEastSectors select 0;
									[eastAttackSector] remoteExec [ "PIG_fnc_updateAttackMarker", east, "JIPEast" ];
									// Atualiza a marcação de defesa
									eastDefenseSector = sectors select [_sectorIndex + 1] select 0;
								};
								// Quando o time oposto captura todas os setores, o array "currentSIDEsectors" fica vazio (count == 0).
								if (count currentEastSectors isEqualTo 0) then {
									currentEastSectors = [ SectorC ];
								};
							};
							case west : {
								if (_ownerOld isEqualTo _side) then {
									// Se o dono antigo do setor que foi capturado é esse lado...
									currentWestSectors = sectors select [ 0, _sectorIndex + 1 ];
									// Seleciona a bandeira avançada perdida
									westLockFowardSector = sectors select [_sectorIndex + 1];
									// Bloqueia o setor avançado e atualiza a marcação (para a cor do time inimigo)
									[westLockFowardSector] remoteExec [ "PIG_fnc_lockSectors", west, "JIPWest" ];
									[westLockFowardSector, west] remoteExec [ "PIG_fnc_defaultOpossiteMarker", west, "JIPWest" ];
									};
									// Atualiza os setores recuados
									if (count currentWestSectors >= 3) then {
									lastWestSector = sectors select [0, _sectorIndex - 1];
									} else {
									lastWestSector = nil;
									};
									// Atualiza a marcação de ataque
									westAttackSector = currentWestSectors select(count currentWestSectors - 1);
									[westAttackSector] remoteExec [ "PIG_fnc_updateAttackMarker", west, "JIPWest" ];

									// Atualiza a marcação de defesa
									westDefenseSector = sectors select [_sectorIndex - 1] select 0;

									// Quando o time oposto captura todas os setores, o array "currentSIDEsectors" fica vazio (count == 0).
									if (count currentWestSectors isEqualTo 0) then {
										currentWestSectors = [ SectorA ];
									};
								};
							};
						};
					}forEach [ east, west ];
					
					// Update available sectors for each side (attack and defend sectors)
					[currentWestSectors] remoteExec [ "PIG_fnc_updateSectors", west, "JIPWest" ];
					[currentEastSectors] remoteExec [ "PIG_fnc_updateSectors", east, "JIPEast" ];

					// Update markers for each side
					// Attack sector
					
					
					//Defense sector
					if !(isNil "lastWestSector") then {
					[lastWestSector, west] remoteExec [ "PIG_fnc_defaultSideMarker", west, "JIPWest" ];
					[lastWestSector] remoteExec [ "PIG_fnc_lockSector", west, "JIPWest"];
					}; 
					if !(isNil "lastEastSector") then {
					[lastEastSector, east] remoteExec [ "PIG_fnc_defaultSideMarker", east, "JIPEast" ];
					[lastEastSector] remoteExec [ "PIG_fnc_lockSector", east, "JIPEast"];
					};
					if !(isNil "eastDefenseSector") then {
					[eastDefenseSector] remoteExec [ "PIG_fnc_updateDefenseMarker", east, "JIPEast" ];
					};
					if !(isNil "westDefenseSector") then {
					[westDefenseSector] remoteExec [ "PIG_fnc_updateDefenseMarker", west, "JIPWest" ];
					}
					
				}
			}
		}] call BIS_fnc_addScriptedEventHandler;
	}forEach (true call BIS_fnc_moduleSector);