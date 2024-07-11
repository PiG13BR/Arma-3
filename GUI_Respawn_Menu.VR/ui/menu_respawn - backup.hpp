/*
Author: PiG13BR

missionConfigFile >> "PiG_RscRespawnMenu"
*/

class PiG_RscRespawnMenu
{
	idd = 1000;
	movingEnable = false;
    controlsBackground[] = {};
	class controls
	{
		class baseFrame: RscFrame
		{
			idc = 1800;
			style = ST_BACKGROUND;
			colorBackground[] = COLOR_DARK_GRAY;
			x = 0.342556 * safezoneW + safezoneX;
			y = 0.219938 * safezoneH + safezoneY;
			w = 0.328008 * safezoneW;
			h = 0.210047 * safezoneH;
		};
		class buttonRespawn: RscButton
		{
			idc = 1600;
			text = "Deploy"; 
			action = "deploy = 1";
			colorDisabled[] = COLOR_LIGHTGRAY_ALPHA;
			colorBackground[] = COLOR_LIGHTGRAY_ALPHA;
			colorBackgroundDisabled[] = COLOR_LIGHTGRAY_ALPHA;
			colorBackgroundActive[] = COLOR_BROWN;
			colorFocused[] = COLOR_LIGHTGRAY_ALPHA;
			x = 0.480319 * safezoneW + safezoneX;
			y = 0.359969 * safezoneH + safezoneY;
			w = 0.0590415 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class textMenu: RscText
		{
			idc = 1000;
			text = "Respawn Menu"; 
			x = 0.454079 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.118083 * safezoneW;
			h = 0.0280062 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
		};
		class textSelect: RscText
		{
			idc = 1001;
			text = "Select Position:"; 
			x = 0.349116 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.301768 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class comboBox: RscCombo
		{
			idc = 2100;
			x = 0.434398 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.190245 * safezoneW;
			h = 0.0280062 * safezoneH;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				shadow = 0;
				scrollSpeed = 0.06;
				width = 0;
				height = 0;
				autoScrollEnabled = 0;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
			};
		};
		class buttonRefresh: RscButton
		{
			idc = 1601;
			action = "refresh = 1";
			style = ST_PICTURE;

			text = "a3\modules_f\data\portraitrespawn_ca.paa";
			x = 0.631203 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.0131203 * safezoneW;
			h = 0.0280062 * safezoneH;
			colorDisabled[] = COLOR_LIGHTGRAY_ALPHA;
			colorBackground[] = COLOR_LIGHTGRAY_ALPHA;
			colorBackgroundDisabled[] = COLOR_LIGHTGRAY_ALPHA;
			colorBackgroundActive[] = COLOR_BROWN;
			colorFocused[] = COLOR_LIGHTGRAY_ALPHA;
		};
	}
}