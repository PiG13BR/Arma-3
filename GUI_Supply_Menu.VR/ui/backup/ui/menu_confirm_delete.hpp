class PIG_RscConfirmDelete
{
	idd = 1004;
	movingEnable = false;
    controlsBackground[] = {};
	class controls 
	{
		class RscFrame_1800: RscFrame
		{
			idc = 1800;
			style = ST_BACKGROUND;
			x = 0.362236 * safezoneW + safezoneX;
			y = 0.387975 * safezoneH + safezoneY;
			w = 0.288647 * safezoneW;
			h = 0.238053 * safezoneH;
			colorBackground[] = {0.2,0.23,0.18,1};
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Você tem certeza?"; //--- ToDo: Localize;
			x = 0.447519 * safezoneW + safezoneX;
			y = 0.401978 * safezoneH + safezoneY;
			w = 0.118083 * safezoneW;
			h = 0.0560125 * safezoneH;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Sim"; //--- ToDo: Localize;
			action = "execVM 'scripts\supply_menu\checkArea\deleteBox.sqf'";
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0984025 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Não"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM 'scripts\supply_menu\returnToBoxMenu.sqf'";
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.570016 * safezoneH + safezoneY;
			w = 0.0984025 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
	}
}