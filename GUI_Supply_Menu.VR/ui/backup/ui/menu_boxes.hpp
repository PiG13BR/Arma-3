class PIG_RscMenuBox
{
	idd = 1001;
	movingEnable = true;
    controlsBackground[] = {};
	class controls 
	{
		class baseFrame: RscFrame
		{
			idc = 1800;
			style = ST_BACKGROUND;
			x = 0.349116 * safezoneW + safezoneX;
			y = 0.27595 * safezoneH + safezoneY;
			w = 0.321448 * safezoneW;
			h = 0.476106 * safezoneH;
			colorBackground[] = {0.2,0.23,0.18,1};
		};
		class BoxesListBox: RscListbox
		{
			idc = 1502;
			x = 0.368797 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.124643 * safezoneW;
			h = 0.308069 * safezoneH;
		};
		class boxPictures: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.51312 * safezoneW + safezoneX;
			y = 0.373972 * safezoneH + safezoneY;
			w = 0.131203 * safezoneW;
			h = 0.168037 * safezoneH;
		};
		class spawnButton: RscButton
		{
			idc = 1600;
			action = "execVM 'scripts\supply_menu\takeItems\takeBox.sqf'";
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.401597 * safezoneW + safezoneX;
			y = 0.626028 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0560125 * safezoneH;
		};
		class deleteBox: RscButton
		{
			idc = 1601;
			action = "execVM 'scripts\supply_menu\checkArea\checkBoxInArea.sqf'";
			text = "Deletar Caixa"; //--- ToDo: Localize;
			x = 0.51312 * safezoneW + safezoneX;
			y = 0.710047 * safezoneH + safezoneY;
			w = 0.0656017 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class clearAreaButton: RscButton
		{
			idc = 1602;
			action = "execVM 'scripts\supply_menu\checkArea\checkArea.sqf'";
			text = "Limpar Área"; //--- ToDo: Localize;
			x = 0.591842 * safezoneW + safezoneX;
			y = 0.710047 * safezoneH + safezoneY;
			w = 0.0656017 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class backButton: RscButton
		{
			idc = 1603;
			action = "closeDialog 0; execVM 'scripts\supply_menu\openSupplyMenu.sqf'";
			text = "Voltar"; //--- ToDo: Localize;
			x = 0.362236 * safezoneW + safezoneX;
			y = 0.710047 * safezoneH + safezoneY;
			w = 0.0459212 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
	}
}