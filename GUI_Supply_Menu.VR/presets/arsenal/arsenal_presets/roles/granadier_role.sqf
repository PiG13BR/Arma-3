// Put all weapons here
PIG_arsenal_weapons = (PIG_rifles_granadier + PIG_pistols);
// Put all Magazines, and throwable items such as grenades
PIG_arsenal_magazines = (PIG_mags + PIG_grenades);
// Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
PIG_arsenal_items = (PIG_uniforms + PIG_vests + PIG_helmets + PIG_facewears + PIG_rifles_optics + PIG_rifles_optics + PIG_rail_attach + PIG_rifles_grip + PIG_binos + PIG_ace_commom_tools + PIG_ace_commom_medical_items + PIG_commom_items + PIG_radio + PIG_ace_misc);
// Put only backpacks here
PIG_arsenal_backpacks = (PIG_backpacks);

[] call compileFinal preprocessFileLineNumbers "presets\arsenal\init_arsenal.sqf";