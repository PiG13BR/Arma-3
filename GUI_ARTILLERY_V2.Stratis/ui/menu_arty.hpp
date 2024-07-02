// missionconfigfile >> "PIG_RscArtyMenu"

class PIG_RscArtyMenu
{
	idd = 1000;
	movingEnable = false;
    controlsBackground[] = {};
	class controls
	{
		class baseFrame: RscFrame
		{
			idc = 1800;
			style = 80;

			x = 0.224473 * safezoneW + safezoneX;
			y = 0.149922 * safezoneH + safezoneY;
			w = 0.557614 * safezoneW;
			h = 0.742166 * safezoneH;
			colorBackground[] = {0.3,0.25,0.2,0.75};
		};
		class RscMapControl
		{
			deletable = 0;
			fade = 0;
			access = 0;
			type = CT_MAP_MAIN;
			idc = 51;
			style = ST_MULTI + ST_TITLE_BAR;
			colorBackground[] = {0.969,0.957,0.949,1};
			colorOutside[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "RobotoCondensedLight";
			sizeEx = 0.04; // "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"
			colorSea[] = {0.467,0.631,0.851,0.5};
			colorForest[] = {0.624,0.78,0.388,0.5};
			colorRocks[] = {0,0,0,0.3};
			colorCountlines[] = {0.572,0.354,0.188,0.25};
			colorMainCountlines[] = {0.572,0.354,0.188,0.5};
			colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
			colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
			colorForestBorder[] = {0,0,0,0};
			colorRocksBorder[] = {0,0,0,0};
			colorPowerLines[] = {0.1,0.1,0.1,1};
			colorRailWay[] = {0.8,0.2,0,1};
			colorNames[] = {0.1,0.1,0.1,0.9};
			colorInactive[] = {1,1,1,0.5};
			colorLevels[] = {0.286,0.177,0.094,0.5};
			colorTracks[] = {0.84,0.76,0.65,0.15};
			colorRoads[] = {0.7,0.7,0.7,1};
			colorMainRoads[] = {0.9,0.5,0.3,1};
			colorTracksFill[] = {0.84,0.76,0.65,1};
			colorRoadsFill[] = {1,1,1,1};
			colorMainRoadsFill[] = {1,0.6,0.4,1};
			colorGrid[] = {0.1,0.1,0.1,0.6};
			colorGridMap[] = {0.1,0.1,0.1,0.6};
			stickX[] = {0.2,["Gamma",1,1.5]};
			stickY[] = {0.2,["Gamma",1,1.5]};
			class Legend
			{
				colorBackground[] = {1,1,1,0.5};
				color[] = {0,0,0,1};
				x = "SafeZoneX + (((safezoneW / safezoneH) min 1.2) / 40)";
				y = "SafeZoneY + safezoneH - 4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
				h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				font = "RobotoCondensed";
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			};
			class ActiveMarker
			{
				color[] = {0.3,0.1,0.9,1};
				size = 50;
			};
			class Command
			{
				color[] = {1,1,1,1};
				icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};
			class Task
			{
				taskNone = "#(argb,8,8,3)color(0,0,0,0)";
				taskCreated = "#(argb,8,8,3)color(0,0,0,1)";
				taskAssigned = "#(argb,8,8,3)color(1,1,1,1)";
				taskSucceeded = "#(argb,8,8,3)color(0,1,0,1)";
				taskFailed = "#(argb,8,8,3)color(1,0,0,1)";
				taskCanceled = "#(argb,8,8,3)color(1,0.5,0,1)";
				colorCreated[] = {1,1,1,1};
				colorCanceled[] = {0.7,0.7,0.7,1};
				colorDone[] = {0.7,1,0.3,1};
				colorFailed[] = {1,0.3,0.2,1};
				color[] =
				{
					"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
					"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
					"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
					"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
				};
				icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
				iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
				iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
				iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
				iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
				size = 27;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};
			class CustomMark
			{
				color[] = {1,1,1,1};
				icon = "\a3\ui_f\data\map\mapcontrol\custommark_ca.paa";
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};
			class Tree
			{
				color[] = {0.45,0.64,0.33,0.4};
				icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
				size = 12;
				importance = "0.9 * 16 * 0.05";
				coefMin = 0.25;
				coefMax = 4;
			};
			class SmallTree
			{
				color[] = {0.45,0.64,0.33,0.4};
				icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
				size = 12;
				importance = "0.6 * 12 * 0.05";
				coefMin = 0.25;
				coefMax = 4;
			};
			class Bush
			{
				color[] = {0.45,0.64,0.33,0.4};
				icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
				size = "14/2";
				importance = "0.2 * 14 * 0.05 * 0.05";
				coefMin = 0.25;
				coefMax = 4;
			};
			class Church
			{
				color[] = {1,1,1,1};
				icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class Chapel
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class Cross
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class Rock
			{
				color[] = {0.1,0.1,0.1,0.8};
				icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
				size = 12;
				importance = "0.5 * 12 * 0.05";
				coefMin = 0.25;
				coefMax = 4;
			};
			class Bunker
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
				size = 14;
				importance = "1.5 * 14 * 0.05";
				coefMin = 0.25;
				coefMax = 4;
			};
			class Fortress
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
				size = 16;
				importance = "2 * 16 * 0.05";
				coefMin = 0.25;
				coefMax = 4;
			};
			class Fountain
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
				size = 11;
				importance = "1 * 12 * 0.05";
				coefMin = 0.25;
				coefMax = 4;
			};
			class ViewTower
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
				size = 16;
				importance = "2.5 * 16 * 0.05";
				coefMin = 0.5;
				coefMax = 4;
			};
			class Lighthouse
			{
				color[] = {1,1,1,1};
				icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class Quay
			{
				color[] = {1,1,1,1};
				icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class Fuelstation
			{
				color[] = {1,1,1,1};
				icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class Hospital
			{
				color[] = {1,1,1,1};
				icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class BusStop
			{
				color[] = {1,1,1,1};
				icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class LineMarker
			{
				textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
				lineWidthThin = 0.008;
				lineWidthThick = 0.014;
				lineDistanceMin = 3e-005;
				lineLengthMin = 5;
			};
			class Transmitter
			{
				color[] = {1,1,1,1};
				icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class Stack
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
				size = 16;
				importance = "2 * 16 * 0.05";
				coefMin = 0.4;
				coefMax = 2;
			};
			class Ruin
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
				size = 16;
				importance = "1.2 * 16 * 0.05";
				coefMin = 1;
				coefMax = 4;
			};
			class Tourism
			{
				color[] = {0,0,0,1};
				icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
				size = 16;
				importance = "1 * 16 * 0.05";
				coefMin = 0.7;
				coefMax = 4;
			};
			class Watertower
			{
				color[] = {1,1,1,1};
				icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
			};
			class Waypoint
			{
				color[] = {1,1,1,1};
				importance = 1;
				coefMin = 1;
				coefMax = 1;
				icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
				size = 18;
			};
			class WaypointCompleted
			{
				color[] = {1,1,1,1};
				importance = 1;
				coefMin = 1;
				coefMax = 1;
				icon = "\a3\ui_f\data\map\mapcontrol\waypointcompleted_ca.paa";
				size = 18;
			};
			moveOnEdges = 1;
			x = 0.244153 * safezoneW + safezoneX;
			y = 0.345966 * safezoneH + safezoneY;
			w = 0.511693 * safezoneW;
			h = 0.434097 * safezoneH;
			shadow = 0;
			ptsPerSquareSea = 5;
			ptsPerSquareTxt = 20;
			ptsPerSquareCLn = 10;
			ptsPerSquareExp = 10;
			ptsPerSquareCost = 10;
			ptsPerSquareFor = 9;
			ptsPerSquareForEdge = 9;
			ptsPerSquareRoad = 6;
			ptsPerSquareObj = 9;
			showCountourInterval = 0;
			scaleMin = 0.001;
			scaleMax = 1;
			scaleDefault = 0.16;
			maxSatelliteAlpha = 0.85;
			alphaFadeStartScale = 2;
			alphaFadeEndScale = 2;
			colorTrails[] = {0.84,0.76,0.65,0.15};
			colorTrailsFill[] = {0.84,0.76,0.65,0.65};
			widthRailWay = 4;
			fontLabel = "RobotoCondensed";
			sizeExLabel = 0.05;
			fontGrid = "TahomaB";
			sizeExGrid = 0.02;
			fontUnits = "TahomaB";
			sizeExUnits = 0.05;
			fontNames = "RobotoCondensed"; 
			sizeExNames = 0.05;
			fontInfo = "RobotoCondensedLight";
			sizeExInfo = 0.05;
			fontLevel = "TahomaB";
			sizeExLevel = 0.02;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			idcMarkerColor = -1;
			idcMarkerIcon = -1;
			textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
			showMarkers = 1;
			class power
			{
				icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
				color[] = {1,1,1,1};
			};
			class powersolar
			{
				icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
				color[] = {1,1,1,1};
			};
			class powerwave
			{
				icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
				color[] = {1,1,1,1};
			};
			class powerwind
			{
				icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
				color[] = {1,1,1,1};
			};
			class Shipwreck
			{
				icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
				size = 24;
				importance = 1;
				coefMin = 0.85;
				coefMax = 1;
				color[] = {0,0,0,1};
			};
		};
		class buttonFire: RscButton
		{
			idc = 1600;
			action = "execVM 'scripts\arty_menu\checkParams.sqf'; PIG_fire_button = 1;";

			text = "Fire"; //--- ToDo: Localize;
			x = 0.467199 * safezoneW + safezoneX;
			y = 0.808069 * safezoneH + safezoneY;
			w = 0.0590415 * safezoneW;
			h = 0.0560125 * safezoneH;
			colorBackground[] = {0.372549,0.00392157,0.00392157,1};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
		};
		class titleText: RscText
		{
			idc = 1001;

			text = "Artillery Menu"; //--- ToDo: Localize;
			x = 0.447519 * safezoneW + safezoneX;
			y = 0.163925 * safezoneH + safezoneY;
			w = 0.111523 * safezoneW;
			h = 0.0280062 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
		};
		class buttonClose: RscButton
		{
			idc = 1601;
			action = "closeDialog 0";

			text = "Close"; //--- ToDo: Localize;
			x = 0.231033 * safezoneW + safezoneX;
			y = 0.836075 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;

			text = "Artillery"; //--- ToDo: Localize;
			x = 0.290075 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.0459212 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1003;

			text = "Ammunition"; //--- ToDo: Localize;
			x = 0.467199 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.0656017 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;

			text = "Rounds"; //--- ToDo: Localize;
			x = 0.657444 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.0459212 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class listBoxArty: RscCombo
		{
			idc = 2100;
			x = 0.250714 * safezoneW + safezoneX;
			y = 0.27595 * safezoneH + safezoneY;
			w = 0.137764 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class listBoxAmmo: RscCombo
		{
			idc = 2101;
			x = 0.427838 * safezoneW + safezoneX;
			y = 0.27595 * safezoneH + safezoneY;
			w = 0.144324 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class listBoxRounds: RscCombo
		{
			idc = 2102;
			x = 0.604963 * safezoneW + safezoneX;
			y = 0.27595 * safezoneH + safezoneY;
			w = 0.144324 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
	}
}