/* 
Author: PiG13BR
missionconfigfile >> "PIG_RscMenuMain"
*/
class PIG_RscMenuMain
{
	idd = 1000;
	movingEnable = false;
    controlsBackground[] = {};
	class controls 
	{
		class RscFrame_1800: RscFrame
		{
			idc = 1800;
			style = 80;

			x = 0.362236 * safezoneW + safezoneX;
			y = 0.345966 * safezoneH + safezoneY;
			w = 0.288647 * safezoneW;
			h = 0.280062 * safezoneH;
			colorBackground[] = {0.2,0.23,0.18,1};
		};
		class RscText_1000: RscText
		{
			idc = 1000;

			text = "Menu de Suprimentos"; //--- ToDo: Localize;
			x = 0.440959 * safezoneW + safezoneX;
			y = 0.359969 * safezoneH + safezoneY;
			w = 0.137764 * safezoneW;
			h = 0.0560125 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			action = "closeDialog 0; execVM 'scripts\supply_menu\lbFiller\getWeapMag.sqf'; createDialog 'PIG_RscMenuAmmo';";

			text = "Munições"; //--- ToDo: Localize;
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.514003 * safezoneH + safezoneY;
			w = 0.0984025 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			action = "closeDialog 0; createDialog 'PIG_RscMenuItems';";

			text = "Explosivos e Itens"; //--- ToDo: Localize;
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.570016 * safezoneH + safezoneY;
			w = 0.0984025 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1600;
			action = "closeDialog 0; execVM 'scripts\supply_menu\lbFiller\getBoxes.sqf'; createDialog 'PIG_RscMenuBox';";

			text = "Caixas"; //--- ToDo: Localize;
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.457991 * safezoneH + safezoneY;
			w = 0.0984025 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class closeButton: RscButton
		{
			idc = 1603;
			action = "closeDialog 0";

			text = "Fechar"; //--- ToDo: Localize;
			x = 0.368797 * safezoneW + safezoneX;
			y = 0.584019 * safezoneH + safezoneY;
			w = 0.039361 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
	}
};