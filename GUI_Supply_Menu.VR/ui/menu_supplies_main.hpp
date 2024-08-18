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

			x = 0.375357 * safezoneW + safezoneX;
			y = 0.359969 * safezoneH + safezoneY;
			w = 0.262407 * safezoneW;
			h = 0.322072 * safezoneH;
			colorBackground[] = {0.2,0.23,0.18,1};
		};
		class RscText_1000: RscText
		{
			idc = 1000;

			text = $STR_MAIN_TITLE_SUPPLIES; 
			x = 0.427838 * safezoneW + safezoneX;
			y = 0.373972 * safezoneH + safezoneY;
			w = 0.157444 * safezoneW;
			h = 0.0560125 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			action = "closeDialog 0; execVM 'scripts\supply_menu\lbFiller\getWeapMag.sqf'; createDialog 'PIG_RscMenuAmmo';";

			text = $STR_MAIN_AMMO; 
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.514003 * safezoneH + safezoneY;
			w = 0.0918423 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			action = "closeDialog 0; createDialog 'PIG_RscMenuItems';";

			text = $STR_MAIN_ITEMS; 
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.570016 * safezoneH + safezoneY;
			w = 0.0918423 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1600;
			action = "closeDialog 0; execVM 'scripts\supply_menu\lbFiller\getBoxes.sqf'; createDialog 'PIG_RscMenuBox';";

			text = $STR_MAIN_BOXES; 
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.457991 * safezoneH + safezoneY;
			w = 0.0918423 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class closeButton: RscButton
		{
			idc = 1603;
			action = "closeDialog 0";

			text = $STR_MAIN_MAIN_CLOSE; 
			x = 0.388477 * safezoneW + safezoneX;
			y = 0.640031 * safezoneH + safezoneY;
			w = 0.039361 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1604: RscButton
		{
			idc = 1601;
			action = "closeDialog 0; execVM 'scripts\supply_menu\manage_items.sqf';";

			text = "Gerenciar Itens"; 
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.626028 * safezoneH + safezoneY;
			w = 0.0918423 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
	}
};