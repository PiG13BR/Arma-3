#include "\a3\ui_f\hpp\definecommongrids.inc"

class RscTitles
{
	class Rsc_deathScreen : RscTitle
	{
		idd = -1;
		fadein = 1;
		fadeout = 1;
		duration = 1e+011;
		class Controls
		{
			class skull
			{
				idc = 3101;
				style = ST_PICTURE;
				font = "RobotoCondensedBold";
				x = 0.325 * safezoneW + safezoneX;
				w = 0.35 * safezoneW;
				y = 0.2 * safezoneH + safezoneY;
				h = 0.6 * safezoneH;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
				text = "images\ui_skull.paa";
				lineSpacing = 1;
				sizeEx = 0.045;
				fixedWidth = 1;
				deletable = 0;
				fade = 0;
				access = 0;
				type = 0;
				shadow = 1;
				colorShadow[] = {0,0,0,0.5};
				tooltipColorText[] = {1,1,1,1};
				tooltipColorBox[] = {1,1,1,1};
				tooltipColorShade[] = {0,0,0,0.65};
			};
		}
	};
	class Default 
	{
		idd = -1;
		fadein = 0;
		fadeout = 0.5;
		duration = 0;
	};
}
