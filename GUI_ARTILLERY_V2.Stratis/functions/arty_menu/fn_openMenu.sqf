/* 
Author: PiG13BR
fn_openMenu.sqf

Description:
Opens the artillery dialog and fetch the information about the available artillery

Parameter(s):
-

Return:
-
*/

createDialog "PIG_RscArtyMenu";

[] spawn PIG_fnc_fetchArtyInfo;
[] spawn PIG_fnc_checkDialog;