// missionconfigfile >> "PIG_RscMenuAmmo"

class PIG_RscMenuAmmo
{
	idd = 1002;
	movingEnable = false;
    controlsBackground[] = {};
	class controls
	{
		class baseFrame: RscFrame
		{
			idc = 1800;
			style = 80;

			x = 0.244153 * safezoneW + safezoneX;
			y = 0.261947 * safezoneH + safezoneY;
			w = 0.511693 * safezoneW;
			h = 0.490109 * safezoneH;
			colorBackground[] = {0.2,0.23,0.18,1};
		};
		class weaponList: RscListBox
		{
			idc = 1500;

			x = 0.263834 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.150884 * safezoneW;
			h = 0.364081 * safezoneH;
		};
		class ButtonGetMag_1: RscButton
		{
			idc = 1600;
			action = "[1] execVM 'scripts\supply_menu\takeItems\takeMagazine.sqf'";

			text = "Add 1x"; //--- ToDo: Localize;
			x = 0.604963 * safezoneW + safezoneX;
			y = 0.696044 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class ButtonGetMag_10: RscButton
		{
			idc = 1600;
			action = "[10] execVM 'scripts\supply_menu\takeItems\takeMagazine.sqf'";

			text = "Add 10x"; //--- ToDo: Localize;
			x = 0.690245 * safezoneW + safezoneX;
			y = 0.696044 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class weaponPicture: RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,0)";
			x = 0.440959 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.124643 * safezoneW;
			h = 0.0980219 * safezoneH;
		};
		class magazinesList: RscListBox
		{
			idc = 1501;

			x = 0.585282 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.157444 * safezoneW;
			h = 0.364081 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;

			text = #STR_AMMO_WEAPONS; //--- ToDo: Localize;
			x = 0.316315 * safezoneW + safezoneX;
			y = 0.27595 * safezoneH + safezoneY;
			w = 0.0459212 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1003;

			text = $STR_AMMO_AMMUNITION; //--- ToDo: Localize;
			x = 0.637764 * safezoneW + safezoneX;
			y = 0.27595 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class backButton: RscButton
		{
			idc = 1606;
			action = "closeDialog 0; execVM 'scripts\supply_menu\openSupplyMenu.sqf'";

			text = $STR_AMMO_BACK; //--- ToDo: Localize;
			x = 0.250714 * safezoneW + safezoneX;
			y = 0.710047 * safezoneH + safezoneY;
			w = 0.0590415 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;

			text = "a3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";
			x = 0.440959 * safezoneW + safezoneX;
			y = 0.485997 * safezoneH + safezoneY;
			w = 0.118083 * safezoneW;
			h = 0.112025 * safezoneH;
		};
	}
}
