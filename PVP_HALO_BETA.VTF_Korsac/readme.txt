// High Altitude Low Opening (HALO) parachute jump script
// By PiG13BR
// Features: PVP purposes; Halo jump in a group.
// Each side will have a location marked on the map to paradrop.
// In this particular scenario, the Teams don't have acess to the arsenal. So if the player has access to it, it's better to have an script that closes arsenal when doing halo.

// The idea of this script is to make the halo jump avaiable just for groups in particular.
// Only the leader can see the addAction, so only him can decide where to paradrop. The rest of the group must be ready.
// The leader and its group will be teleported to a location by map single click with a "x" altitude.
// If player doesn't have parachute, the script will add one.
// if player does have a backpack, it will save it and restore it after landing
// The halo jump is to be used in the beggining of a mission.

// On the ground, the group leader can airdrop a crate that will be used to set a respawn for his group only.
// The respawn point can be destroyed by the enemy.

GAMEPLAY:
// Sua estrutura consiste básicamente no paraquedismo inicial, setagem de respawn, captura de setores, e a contagem de tickets. 
1) Todos irão nascer nas suas respectivas bases. Cada time estará composto por 10 jogadores dividido em dois grupos de 5, com kits pré-determinados.
// Não haverá ARSENAL por questões de tempo e equilibrio do jogo, apenas contendo uma caixa com inventório básico e necessário.
// A base será somente acessada ao inicio da partida para o briefing inicial de cada time.
// O BRIEFING INICIAL É DE 5 MINUTOS!
2) Após o briefing, cada líder de cada grupo poderá acessar o HALO JUMP que estará em suas respectivas bandeiras.
// Apenas o líder terá acesso ao HALO, o restante do grupo deverá estar preparado para saltar assim que o líder decidir o lugar.
// Cada time terá sua área designada de paraquedismo, não sendo possível realizar-lo fora das mesmas.
/ Basta APENAS UM CLIQUE na área desginada para ativar o halo jump, por tanto, tenha certeza pois pode ser determinante para jogada do seu time.
// Todos os membros do grupo serão teleportados para o halo jump, juntamente com o líder.
3) Após o halo jump, não será mais possível voltar à base. O grupo em específico se encontrará em um "vão", sem a possibilidade de respawn.
// Assim que o líder do grupo específico atingir o solo, ele terá a habilidade de aerodropar uma caixa que servirá como objeto para o respawn do GRUPO.
// A caixa poderá ser empurrada para qualquer lado antes de setar o respawn.
// Ao colocar o respawn, a caixa será trocada por outros objetos.
4) Sobre o respawn:
// O respawn será FIXO e será para SEU GRUPO UNICAMENTE, NÃO SÃO COMPARTIDOS ENTRE AS EQUIPES DO TIME.
// O respawn será habilitado APÓS 5 MINUTOS transcurridos a partir da colocação do mesmo pelo líder.
// Equipamentos e munições estarão disponíveis APÓS 10 MINUTOS transcurridos a partir da colocação do respawn pelo líder. Elas estarão na caixa, onde ficará o respawn.
4) MIDGAME:
// A partir da ativação do respawn, será possível fazer RALLY POINT, onde o acesso principal para o teleporte até o rally point do líder do grupo será feita através da caixa no respawn. ATENÇÃO: O rally point conta com mecanismos que impedem de teleportar você se haver inimigos próximos, tanto do local que você está tanto do destino.
// Ambos times devem capturar os setores como objetivo. Os setores servem para concentrar o combate em pontos específicos. Cada vez que um time captura o setor do outro time, este perde 10 tickets.
// Cada respawn do jogador custa 1 ticket para o time.
// Se o time capturar todos os setores, o outro time sangra 1 ticket por cada 5 segundos.
// OS RESPAWN PODERÃO SER DESTRUIDOS!

TESTES REQUERIDOS:
- BRIEFING TIME
- HALO JUMP EM GRUPO
- HALO JUMP PARA CADA LÍDER
- AÇÃO NO LÍDER
- NOTIFICAÇÕES