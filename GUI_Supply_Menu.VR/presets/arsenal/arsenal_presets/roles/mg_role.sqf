PIG_arsenal_weapons = (PIG_lmgs);
PIG_arsenal_magazines = (PIG_mags + PIG_grenades);
PIG_arsenal_items = (PIG_uniforms + PIG_vests + PIG_helmets + PIG_facewears + PIG_lmgs_optics + PIG_rail_attach + PIG_rifles_bipod + PIG_binos + PIG_ace_commom_tools + PIG_ace_commom_medical_items + PIG_commom_items + PIG_radio + PIG_ace_misc);
PIG_arsenal_backpacks = (PIG_backpacks);

[] call compileFinal preprocessFileLineNumbers "presets\arsenal\init_arsenal.sqf";

clientReady = true;