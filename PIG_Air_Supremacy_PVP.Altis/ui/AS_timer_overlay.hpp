class RscTitles 
{
	class PIG_RscTimer
	{
		idd = -1;
		name = "PIG_RscTimer";
		duration = 99999;
		movingEnable = false;
		controlsBackground[] = {};
		onLoad = "uiNamespace setVariable ['PIG_timer', _this select 0];";
		class controls
		{
			class TimerCount: RscText {
				idc = 100;
				text = "";
				font = "RobotoCondensedBold";
				style = ST_CENTER;
				sizeEx = 0.030 * safezoneH;
				x = 0.467199 * safezoneW + safezoneX;
				y = 0.0659032 * safezoneH + safezoneY;
				w = 0.0656017 * safezoneW;
				h = 0.0280062 * safezoneH;
				colorText[] = {0.85, 0.4, 0, 1};
				colorBackground[] = {0,0,0,0};
				lineSpacing = 1;
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
	}
}
