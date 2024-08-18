class PIG_RscCrewWeapons
{
	idd = 1301
	controlsBackground[] = {};
	class controls 
	{
		class RscFrame_1800: RscFrame
		{
			idc = 1800;
			style = 80;
			x = 0.349116 * safezoneW + safezoneX;
			y = 0.177928 * safezoneH + safezoneY;
			w = 0.314888 * safezoneW;
			h = 0.434097 * safezoneH;
			colorBackground[] = {0.2,0.23,0.18,1};
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.368797 * safezoneW + safezoneX;
			y = 0.247944 * safezoneH + safezoneY;
			w = 0.131203 * safezoneW;
			h = 0.294066 * safezoneH;
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
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.51312 * safezoneW + safezoneX;
			y = 0.247944 * safezoneH + safezoneY;
			w = 0.131203 * safezoneW;
			h = 0.154034 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Crew Weapon"; //--- ToDo: Localize;
			action = " buttonCrew = 2;"
			x = 0.545921 * safezoneW + safezoneX;
			y = 0.415981 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Crew All";
			action = "buttonCrew = 1;";
			x = 0.545921 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Delete Crew";
			action = "deleteCrew = 1";
			x = 0.545921 * safezoneW + safezoneX;
			y = 0.457991 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Close"; //--- ToDo: Localize;
			action = "closeDialog 0";
			x = 0.368797 * safezoneW + safezoneX;
			y = 0.570016 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Static Weapons"; //--- ToDo: Localize;
			x = 0.388477 * safezoneW + safezoneX;
			y = 0.205934 * safezoneH + safezoneY;
			w = 0.078722 * safezoneW;
			h = 0.0280062 * safezoneH;
		};

	}
}