class Params
{	
	class GeneralOptions 
	{
        title = "---- OPÇÕES GERAIS ----";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
	class respawnTickets
	{
		title = "Número de tickets";
		values[] = { 25, 50, 75, 100 };
		texts[] = { "25", "50", "75", "100" };
		default = 50;
		function = "BIS_fnc_paramRespawnTickets";
	};
	class autoClean
	{
		title = "Tempo para limpar objetos (mortos e vazios)";
		values[] = { 300, 600, 900, 1200, 1800, 6000 };
		texts[] = { "5 min", "10 min", "15 min", "20 min", "30 min", "60 min" };
		default = 600;
	};
	class fuelConsumptionCoef
	{
		title = "Coeficiente de gasto de combustível x pylon armado";
		values[] = { 1, 1.2, 1.5, 2, 2.5 };
		texts[] = { "1x", "1.2x", "1.5x", "2x", "2.5x" };
		default = 2;
	};
	class Spacer0 
	{
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
	class weatherOptions 
	{
        title = "---- TEMPO/CLIMA E VISÃO ----";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
	class startTime
	{
		title = "Horário no mapa (inicio)";
		values[] = { 5, 12, 18, 0 };
		texts[] = { "Amanhecer", "Dia", "Entardecer", "Noite" };
		default = 12;
		function = "BIS_fnc_paramDaytime";
		isGlobal = 1;
	};
	class startWeather
	{
		title = "Clima";
		values[] = { 0, 0.4, 0.7};
		texts[] = { "Limpo", "Nublado", "Chuvoso" };
		default = 0;
	};
	class timeMultiplierDay
	{
		title = "Multiplicador de tempo (dia)";
		values[] = { 0, 6, 12, 24, 40, 60 };
		texts[] = { "Não", "6x", "12x", "24x", "40x", "60x"};
		default = 24;
	};
	class timeMultiplierNight
	{
		title = "Multiplicador de tempo (noite)";
		values[] = { 0, 6, 12, 24, 40, 60 };
		texts[] = { "Não", "6x", "12x", "24x", "40x", "60x"};
		default = 60;
	};
	class ViewDistance
	{
		title = "Visão de distância (Inicio)";
		values[] = { 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000 };
		texts[] = { "3 km", "4 km", "5 km", "6 km", "7 km", "8 km", "9 km", "10 km" };
		default = 5000;
		file = "scripts\start_viewDistance.sqf";
		isGlobal = 1;
	};
	class Spacer1 {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
	class ObjectivesOptions 
	{
        title = "---- OPÇÕES DOS OBJETIVOS ----";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
	class missionAvailable
	{
		title = "Missões disponíveis";
		values[] = { 0, 1, 2, 3, 4, 5 };
		texts[] = { "Nenhuma", "Todas", "Todas, exceto caçada", "Somente comboio", "Somente controle aéreo", "Somente destruir artilharias" };
		default = 1;
	};
	class minPlayerRequired
	{
		title = "Jogadores mínimos requeridos para iniciar a missão";
		values[] = { 0, 2, 4, 6, 8 };
		texts[] = { "0 (para testes)", "2", "4", "6", "8" };
		default = 2;
	};
	class missionSelectorDelay
	{
		title = "Tempo para selecionar missões";
		values[] = { 10, 180, 300, 600, 900 };
		texts[] = { "10 segundos (para testes)", "3 min", "5 min", "10 min", "15 min" };
		default = 300;
	};
	class airControlTimer
	{
		title = "Controle Aéreo (Contagem Regressiva)";
		values[] = { 180, 300, 520};
		texts[] = { "3 min", "5 min", "7 min" };
		default = 300;
	};
	class huntTimer
	{
		title = "Caçada de jogador (Contagem Regressiva)";
		values[] = { 120, 180, 240, 300};
		texts[] = { "2 min", "3 min", "4 min", "5 min" };
		default = 180;
	};
	class artyTimer
	{
		title = "Proteger/Atacar artilharias (Contagem Regressiva)";
		values[] = { 60, 600, 720, 900};
		texts[] = { "1 min (para testes)", "10 min", "12 min", "15 min" };
		default = 600;
	};
	class artyFakeFire
	{
		title = "Artilharia faz salvas de fogo falsas";
		values[] = { 1, 0 };
		texts[] = { "Sim", "Não" };
		default = 1;
	};
	class convoyLength
	{
		title = "Tamanho do comboio (número de veículos)";
		values[] = { 3, 4, 5, 6, 7, 8};
		texts[] = { "3", "4", "5", "6", "7", "8" };
		default = 4;
	};
};