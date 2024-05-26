// Thanks to Larrow from the bohemia forum for the base for this script
// Script reworked by PiG13BR

/* Código para transformar Sector Control padrão em estilo AAS (Assault And Secure)
- Cada time terá seu setor de ataque e de defesa, os outros setores não contestaveis não terão ativação alguma, mas se o time oposto estiver nela, poderá atrasar a captura da mesma.
- Para saber qual setor seu time ataca e qual defende, foi alterado as marcações no mapa (e futuramente no HUD). Os setores não contestáveis terão as marcações padrões de um Sector Control.
*/

// Espera o jogo começar
// Wait Until game/mission starts
waitUntil {
	time > 0
};

// Todos os setores (nomeados) devem ser colocados aqui dentro do array
// All sectors (variable names) must be put inside this array
sectors = [sectorA, sectorB, sectorC, sectorD];

// Parametros iniciais para os setores
// Set initial parameters for the sectors

// Colocar todos os setores como não capturados
// Set all sectors to non-capturable
{
	// Trigger Area
	_trig = _x getVariable "areas" select 0;
	_trig setTriggerActivation[ "any", "present", false ];
	_trig setTriggerStatements[ "false", "", "" ];
	_trig setTriggerType "none";
	_trig setTriggerArea[ 0, 0, 0, false ];
	// Get markers from sectors
	_areas = _x getVariable "areas";
	_trigger = _areas select 0;
	// Change Markers Icon Text Position
	_triggerMarkerIconText = (_trigger getVariable "markers") select 2; // select 0 pega markerArea (grid), select 1 pega o markerIcon (icone do meio), select 2 pega o iconText (o nome do setor)
	_triggerMarkerIconText setMarkerPos (_x modelToWorld [-1,8,0]);
	// Hide areaMarker
	_triggerMarkerArea = (_trigger getVariable "markers") select 0;
	_triggerMarkerArea setMarkerAlpha 0;
}forEach sectors;

// Salva os padrões das marcações como formato, cor, etc. Pode ser qualquer setor como exemplo.
// Save marker default marker icons, marker colors.  Can be any named sector.
[sectorB] call PIG_fnc_saveDefaultMarker;

// Coloca os setores iniciais para cada time
// Set the initial capturable sectors for each side
currentWestSectors = [sectorA];
currentEastSectors = [sectorD];

// Executa a função responsável por atualizar os setores capturaveis para cada lado
// Execute the function responsable to update available sectors for each side
[currentWestSectors] remoteExec [ "PIG_fnc_updateSectors", west, "JIPWest" ];
[currentEastSectors] remoteExec [ "PIG_fnc_updateSectors", east, "JIPEast" ];

// Atualiza a marcação de ataque para cada lado
// Update attack marker color for each side
westAttackSector = currentWestSectors select 0; // First sector west side
eastAttackSector = currentEastSectors select 0; // First sector east side
[westAttackSector] remoteExec [ "PIG_fnc_updateAttackMarker", west, "JIPWest" ];
[eastAttackSector] remoteExec [ "PIG_fnc_updateAttackMarker", east, "JIPEast" ];

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
								[eastDefenseSector] remoteExec [ "PIG_fnc_updateDefenseMarker", east, "JIPEast" ];
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
									eastLockFowardSector = sectors select [_sectorIndex - 1] select 0;
									// Bloqueia o setor avançado e atualiza a marcação (para a cor do time inimigo)
									[[eastLockFowardSector]] remoteExec [ "PIG_fnc_lockSector", east, "JIPEast" ];
									[[eastLockFowardSector], east] remoteExec [ "PIG_fnc_defaultOpossiteMarker", east, "JIPEast" ];
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
					
					
					// Defense sector
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
	
	
	
// COMANDO PARA CAPTURAR SETOR
// sectorA setVariable ["owner", west]

/* TESTES
sleep 2;
sectorA setVariable ["owner", west];
sleep 2;
sectorB setVariable ["owner", west];
sleep 2;
sectorD setVariable ["owner", east];
sleep 2;
sectorC setVariable ["owner", east];
sleep 2;
sectorC setVariable ["owner", west];
sleep 2;
sectorC setVariable ["owner", east];