/*
Author: PiG13BR
missionconfigfile >> "PIG_RscMenuManageItems"
*/

class PIG_RscMenuManageItems
{
	idd = 2000;
	movingEnable = false;
    controlsBackground[] = {};
	class controls 
	{
		class RscFrame_1800: RscFrame
		{
			idc = 1800;
			style = 80;

			x = 0.316315 * safezoneW + safezoneX;
			y = 0.219937 * safezoneH + safezoneY;
			w = 0.367369 * safezoneW;
			h = 0.546122 * safezoneH;
			colorBackground[] = {0.2,0.23,0.18,1};
		};
		class RscText_1000: RscText
		{
			idc = 1000;

			text = "Gerenciar Itens"; 
			x = 0.447518 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.118083 * safezoneW;
			h = 0.0420094 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
		};
		class RscListbox_1504: RscListBox
		{
			idc = 1504;

			x = 0.427838 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.236166 * safezoneW;
			h = 0.392087 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			action = "execVM 'scripts\supply_menu\lbFiller\get_items_box\get_box_all.sqf'; PIG_selection_item = 1";

			text = $STR_MANAGE_ALL; 
			x = 0.335996 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			action = "execVM 'scripts\supply_menu\lbFiller\get_items_box\get_box_magazines.sqf'; PIG_selection_item = 2";

			text = $STR_MANAGE_AMMUNITION; 
			x = 0.335996 * safezoneW + safezoneX;
			y = 0.359969 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			action = "execVM 'scripts\supply_menu\lbFiller\get_items_box\get_box_grenades.sqf'; PIG_selection_item = 3";

			text = $STR_MANAGE_THROWABLES; 
			x = 0.335996 * safezoneW + safezoneX;
			y = 0.415981 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			action = "execVM 'scripts\supply_menu\lbFiller\get_items_box\get_box_explosives.sqf'; PIG_selection_item = 4"

			text = $STR_MANAGE_EXPLOSIVES; 
			x = 0.335996 * safezoneW + safezoneX;
			y = 0.471994 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1604: RscButton
		{
			idc = 1604;
			action = "execVM 'scripts\supply_menu\lbFiller\get_items_box\get_box_medical.sqf'; PIG_selection_item = 5"

			text = $STR_MANAGE_MEDICAL; 
			x = 0.335996 * safezoneW + safezoneX;
			y = 0.528006 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			action = "execVM 'scripts\supply_menu\lbFiller\get_items_box\get_box_misc.sqf'; PIG_selection_item = 6"

			text = "Misc"; 
			x = 0.335996 * safezoneW + safezoneX;
			y = 0.584019 * safezoneH + safezoneY;
			w = 0.0721618 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscButton_1606: RscButton
		{
			idc = 1606;
			action = "execVM 'scripts\supply_menu\lbFiller\get_items_box\delete_items\deleteItem.sqf'"

			text = $STR_MANAGE_DELETE; 
			x = 0.427838 * safezoneW + safezoneX;
			y = 0.710047 * safezoneH + safezoneY;
			w = 0.0590415 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscButton_1607: RscButton
		{
			idc = 1607;
			action = "execVM 'scripts\supply_menu\lbFiller\get_items_box\delete_items\deleteItemsAll.sqf'"

			text = $STR_MANAGE_CLEAR; 
			x = 0.604963 * safezoneW + safezoneX;
			y = 0.710047 * safezoneH + safezoneY;
			w = 0.0590415 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class RscButton_1608: RscButton
		{
			idc = 1608;
			action = "closeDialog 0; execVM 'scripts\supply_menu\openSupplyMenu.sqf'"

			text = $STR_MANAGE_BACK; 
			x = 0.329436 * safezoneW + safezoneX;
			y = 0.72405 * safezoneH + safezoneY;
			w = 0.0459212 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
	}
}