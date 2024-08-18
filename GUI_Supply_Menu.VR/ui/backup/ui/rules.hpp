/* 
Author: PiG13BR
missionconfigfile >> "RscDialogRules"
(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)
*/

class RscDialogRules
{
	idd = 1133;
	movingEnable = false;
    controlsBackground[] = {};
	class controls
	{
		class baseFrame: RscFrame
		{
			idc = 1800;
			style = 80;
			type = CT_STATIC;

			x = 0.290075 * safezoneW + safezoneX;
			y = 0.0939094 * safezoneH + safezoneY;
			w = 0.413291 * safezoneW;
			h = 0.798178 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.8};
		};
		class rulesText1: RscText
		{
			idc = 1001;

			text = "1. Exemplo"; //--- ToDo: Localize;
			x = 0.296635 * safezoneW + safezoneX;
			y = 0.359969 * safezoneH + safezoneY;
			w = 0.39361 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class rulesText2: RscText
		{
			idc = 1002;

			text = "2. Exemplo"; //--- ToDo: Localize;
			x = 0.296635 * safezoneW + safezoneX;
			y = 0.415981 * safezoneH + safezoneY;
			w = 0.40017 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class buttonOkay: RscButton
		{
			idc = 1600;
			action = "closeDialog 1";

			text = "Aceitar"; //--- ToDo: Localize;
			x = 0.349116 * safezoneW + safezoneX;
			y = 0.794066 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0700156 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class rejectButton: RscButton
		{
			idc = 1601;
			action = "hint 'Você deve aceitar as regras para poder jogar'";

			text = "Rejeitar"; //--- ToDo: Localize;
			x = 0.598403 * safezoneW + safezoneX;
			y = 0.794066 * safezoneH + safezoneY;
			w = 0.0524813 * safezoneW;
			h = 0.0700156 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "Normas para os jogadores"; //--- ToDo: Localize;
			x = 0.414718 * safezoneW + safezoneX;
			y = 0.135919 * safezoneH + safezoneY;
			w = 0.177125 * safezoneW;
			h = 0.0560125 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;

			text = "images\spts_dialog.paa";
			x = 0.460639 * safezoneW + safezoneX;
			y = 0.163925 * safezoneH + safezoneY;
			w = 0.0984025 * safezoneW;
			h = 0.182041 * safezoneH;
		};
		class rulesText3: RscText
		{
			idc = 1002;

			text = "3. Exemplo"; //--- ToDo: Localize;
			x = 0.296635 * safezoneW + safezoneX;
			y = 0.471994 * safezoneH + safezoneY;
			w = 0.39361 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class rulesText4: RscText
		{
			idc = 1002;

			text = "4. Exemplo"; //--- ToDo: Localize;
			x = 0.296635 * safezoneW + safezoneX;
			y = 0.528006 * safezoneH + safezoneY;
			w = 0.39361 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class rulesText5: RscText
		{
			idc = 1002;

			text = "5. Exemplo"; //--- ToDo: Localize;
			x = 0.296635 * safezoneW + safezoneX;
			y = 0.584019 * safezoneH + safezoneY;
			w = 0.39361 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class rulesText6: RscText
		{
			idc = 1002;

			text = "6. Exemplo"; //--- ToDo: Localize;
			x = 0.296635 * safezoneW + safezoneX;
			y = 0.640031 * safezoneH + safezoneY;
			w = 0.39361 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
		class rulesText7: RscText
		{
			idc = 1002;

			text = "7. Exemplo"; //--- ToDo: Localize;
			x = 0.296635 * safezoneW + safezoneX;
			y = 0.696044 * safezoneH + safezoneY;
			w = 0.39361 * safezoneW;
			h = 0.0420094 * safezoneH;
		};
	}
}