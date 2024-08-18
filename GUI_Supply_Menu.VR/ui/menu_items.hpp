/* 
Author: PiG13BR
missionconfigfile >> "PIG_RscMenuItems"
*/
class PIG_RscMenuItems
{
	idd = 1003;
	movingEnable = false;
    controlsBackground[] = {};
	class controls 
	{
		class baseFrame: RscFrame
		{
			idc = 1800;
			style = 80;

			x = 0.335996 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.314888 * safezoneW;
			h = 0.364081 * safezoneH;
			colorBackground[] = {0.2,0.23,0.18,1};
		};
		class grenadeButton: RscButton
		{
			idc = 1600;
			action = "[1] execVM 'scripts\supply_menu\lbFiller\getItems.sqf'";

			text = $STR_ITEMS_THROWABLE;
			x = 0.355676 * safezoneW + safezoneX;
			y = 0.331963 * safezoneH + safezoneY;
			w = 0.0656017 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class explosivesButton: RscButton
		{
			idc = 1601;
			action = "[2] execVM 'scripts\supply_menu\lbFiller\getItems.sqf'";

			text = $STR_ITEMS_EXPLOSIVES; 
			x = 0.355676 * safezoneW + safezoneX;
			y = 0.387975 * safezoneH + safezoneY;
			w = 0.0656017 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class medicalButton: RscButton
		{
			idc = 1602;
			action = "[3] execVM 'scripts\supply_menu\lbFiller\getItems.sqf'";

			text = $STR_ITEMS_MEDICAL; 
			x = 0.355676 * safezoneW + safezoneX;
			y = 0.443988 * safezoneH + safezoneY;
			w = 0.0656017 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class miscButton: RscButton
		{
			idc = 1603;
			action = "[4] execVM 'scripts\supply_menu\lbFiller\getItems.sqf'";

			text = "Misc"; 
			x = 0.355676 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0656017 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1503;
			x = 0.440959 * safezoneW + safezoneX;
			y = 0.345966 * safezoneH + safezoneY;
			w = 0.118083 * safezoneW;
			h = 0.266059 * safezoneH;
		};
		class button1x: RscButton
		{
			idc = 1604;
			action = "[1] execVM 'scripts\supply_menu\takeItems\takeItems.sqf'";

			text = "Add 1x"; 
			x = 0.578722 * safezoneW + safezoneX;
			y = 0.485997 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			action = "[10] execVM 'scripts\supply_menu\takeItems\takeItems.sqf'";

			text = "Add 10x"; 
			x = 0.578722 * safezoneW + safezoneX;
			y = 0.556012 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class backButton: RscButton
		{
			idc = 1606;
			action = "closeDialog 0; execVM 'scripts\supply_menu\openSupplyMenu.sqf'";

			text = $STR_ITEMS_BACK; 
			x = 0.349116 * safezoneW + safezoneX;
			y = 0.626028 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class itemPicture: RscPicture
		{
			idc = 1202;

			text = "#(argb,8,8,3)color(1,1,1,0)";
			x = 0.578722 * safezoneW + safezoneX;
			y = 0.359969 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0840187 * safezoneH;
		};
	}
}