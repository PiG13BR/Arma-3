class RscTitles {
    class intro1 {
        name = "intro1";
        duration = 4;
        idd = -1;
        movingEnable = false;
        controls[]= {
            GenericLabelShadow, GenericLabel2
        };
        class GenericLabel2 {
            idc = -1;
            type =  CT_STATIC ;
            style = ST_CENTER;
            colorText[] = COLOR_WHITE;
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx = 0.035 * safezoneH;
            x = 0.3 * safezoneW + safezoneX;
            w = 0.4 * safezoneW;
            y = 0.65 * safezoneH + safezoneY;
            h = 0.1 * safezoneH;
            text = "OPERAÇÃO EM CONJUNTO";
            shadow = 1;
        };
        class GenericLabelShadow: GenericLabel2 {
            shadow = 2;
        };
    };
    class intro2 {
        name = "intro2";
        duration = 7;
        idd = -1;
        movingEnable = false;
        controls[] = {
            VersionLabelShadow, Splash, VersionLabel
        };
        class Splash {
            idc = -1;
            type =  CT_STATIC;
            style = ST_PICTURE;
            colorText[] = COLOR_WHITE;
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx = 0.1 * safezoneH;
            x = 0.325 * safezoneW + safezoneX;
            w = 0.35 * safezoneW;
            y = 0.2 * safezoneH + safezoneY;
            h = 0.6 * safezoneH;
            text = "images\usmcvsvdv.paa";
        };
        class VersionLabel {
            idc = -1;
            type =  CT_STATIC ;
            style = ST_CENTER;
            shadow = 1;
            colorText[] = COLOR_WHITE;
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx = 0.035 * safezoneH;
            x = 0.45 * safezoneW + safezoneX;
            w = 0.3 * safezoneW;
            y = 0.65 * safezoneH + safezoneY;
            h = 0.1 * safezoneH;
            text = $STR_MISSION_VERSION;
        };
        class VersionLabelShadow: VersionLabel {
            shadow = 2;
            font = FontM;
        };
    };
}