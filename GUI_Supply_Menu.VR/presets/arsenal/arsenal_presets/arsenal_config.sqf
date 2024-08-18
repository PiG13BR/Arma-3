/*
Script By PiG13BR

Set up your arsenal inventory based on role selection here.
If you change these variables below, you need to change the files in presets\arsenal\arsenal_presets\roles
*/

//------------------------------------ For the roles
// Weapons
PIG_rifles_basic = [
    "rhs_weap_m16a4",                                               // M16A4
    "rhs_weap_m4_carryhandle",                                      // M4 (Carryhandle)
    "rhs_weap_m4a1_blockII_bk",                                     // M4A1 Block II (Black Rail)
    "rhs_weap_m4a1"                                                	// M4A1 PIP
];
PIG_rifles_special = [
    
];
PIG_rifles_granadier = [
    "rhs_weap_m16a4_carryhandle_M203",
    "rhs_weap_m4_carryhandle_m203",
    "rhs_weap_m4a1_blockII_M203_bk",
    "rhs_weap_m4a1_m203"
];
PIG_lmgs = [
    "rhs_weap_m249_light_L",                                        // M249 PIP (Long/Ltwt.)
    "rhs_weap_m249_light_S",                                        // M249 PIP (Short/Ltwt.)
    "rhs_weap_m249_pip_L_para",                                     // M249 PIP (Long/Para)
    "rhs_weap_m249_pip_L",                                          // M249 PIP (Long/Savit)
    "rhs_weap_m249_pip_ris",                                        // M249 PIP (RIS)
    "rhs_weap_m249_pip_S_para",                                     // M249 PIP (Short/Para)
    "rhs_weap_m249_pip_S",                                          // M249 PIP (Short/Savit)
    "rhs_weap_m249_pip",                                            // M249 PIP
    "rhs_weap_m249",                                                // M249
    "rhs_weap_m27iar"                                              	// M27 IAR
];
PIG_smgs = [
    "rhsusf_weap_MP7A2",
    "rhs_weap_m4a1"
];
PIG_rifles_marksman = [
    "rhs_weap_m14ebrri",
    "rhs_weap_mk17_LB"
];
PIG_snipers = [

];
PIG_shotguns = [
    "rhs_weap_M590_8RD",
    "rhs_weap_M590_5RD"
];
PIG_pistols = [
    "rhsusf_weap_glock17g4",
    "rhsusf_weap_m9"
];

//Bazookas
PIG_launchers_HAT = [
    "rhs_weap_fgm148"
];
PIG_launchers_LAT = [
    "rhs_weap_maaws",
    "rhs_weap_smaw"
];
PIG_discard_launchers = [
    "rhs_weap_m72a7",
    "rhs_weap_M136"
];
PIG_launchers_AA = [
    "rhs_weap_fim92"
];

// Magazines
PIG_mags = [
    // Rifles
    "rhs_mag_30Rnd_556x45_M193_Stanag",                            // 30rnd STANAG M193
    "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red",                 // 30rnd STANAG M196 (Tracer)
	"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",                 // 30rnd STANAG M856 (Tracer)
    "rhs_mag_30Rnd_556x45_M855_Stanag",                            // 30rnd STANAG M855
    // AR
    "rhsusf_100Rnd_556x45_M200_soft_pouch",                        // 100rnd M249 Softpack M200
    "rhsusf_100Rnd_556x45_M855_soft_pouch",                        // 100rnd M249 Softpack M855
    "rhsusf_100Rnd_556x45_soft_pouch",                              // 100rnd M249 Softpack M855A1
    // SMG
    "rhsusf_mag_40Rnd_46x30_AP",
    // MARKSMAN
    "rhs_mag_20Rnd_SCAR_762x51_m61_ap",
    "rhsusf_20Rnd_762x51_m118_special_Mag",
    "20Rnd_762x51_Mag",
    "rhsusf_20Rnd_762x51_m993_Mag",
    "rhsusf_20Rnd_762x51_m62_Mag",
    // SHOTGUN
    "rhsusf_8Rnd_00Buck",
    "rhsusf_8Rnd_Slug",
    "rhsusf_5Rnd_00Buck",
    "rhsusf_5Rnd_Slug",
    // PISTOLS
    "rhsusf_mag_17Rnd_9x19_FMJ",
    "rhsusf_mag_15Rnd_9x19_FMJ",
    // BAZOOKAS
    "rhs_fgm148_magazine_AT",
    "rhs_fim92_mag",
    "rhs_mag_maaws_HEAT",
    "rhs_mag_maaws_HEDP",
    "rhs_mag_maaws_HE",
    "rhs_mag_smaw_SR",
    "rhs_mag_smaw_HEAA",
    "rhs_mag_smaw_HEDP",
    // GRANADE LAUNCHER ROUNDS
    "rhs_mag_M433_HEDP",
    "rhs_mag_M397_HET",
    "rhs_mag_m714_White",
    "rhs_mag_m715_Green",
    "rhs_mag_m716_yellow",
    "rhs_mag_m713_Red"
];

// Grenades & explosives
PIG_grenades = [
    "B_IR_Grenade",                                                 // IR Grenade [NATO]
    "Chemlight_blue",                                               // Chemlight (Blue)
    "Chemlight_green",                                              // Chemlight (Green)
    "Chemlight_red",                                                // Chemlight (Red)
    "Chemlight_yellow",                                             // Chemlight (Yellow)
	"SmokeShell",
	"SmokeShellYellow",
	"SmokeShellGreen",
	"SmokeShellRed",
	"SmokeShellPurple",
	"SmokeShellOrange",
	"SmokeShellBlue",
    "rhs_mag_mk3a2",                                                // MK3A2 Concussion Grenade
    "rhs_mag_mk84",                                                 // M84 Stun Grenade
    "rhs_mag_m67",                                                  // M67 Fragmentation Grenade
    "rhs_mag_m7a3_cs"                                               // M7A3 CS Gas Grenade
];

PIG_explosives = [
    "rhsusf_m112_mag",
    "rhsusf_m112x4_mag",
    "rhsusf_mine_m14_mag",
    "rhs_mine_M19_mag"
];

// Weapons attachment
PIG_rifles_optics = [
    "rhsusf_acc_ACOG2_USMC",
    "rhsusf_acc_compm4"
];

PIG_lmgs_optics = [
    "rhsusf_acc_ELCAN",
    "rhsusf_acc_ACOG2_USMC"
];

PIG_marskman_optics = [

];

PIG_rail_attach = [
    "rhsusf_acc_anpeq15_wmx",
    "rhsusf_acc_anpeq15_bk",
    "rhsusf_acc_anpeq16a",
    "rhsusf_acc_anpeq16a_top"
];

PIG_rifles_grip = [
    "rhsusf_acc_grip3",
    "rhsusf_acc_grip2",
    "rhsusf_acc_grip1"
];

PIG_rifles_bipod = [
    "rhsusf_acc_harris_bipod"
];

// Uniforms, Vests, helmets, backpacks, facewears
PIG_uniforms = [
    "rhs_uniform_FROG01_wd"                                        // FROG MARPAT-WD
];
PIG_vests = [
    "rhsusf_spc_corpsman",                                          // SPC (Corpsman)
    "rhsusf_spc_crewman",                                           // SPC (Crewman)
    "rhsusf_spc_iar",                                               // SPC (IAR)
    "rhsusf_spc_light",                                             // SPC (Light)
    "rhsusf_spc_marksman",                                          // SPC (Marksman)
    "rhsusf_spc_mg",                                                // SPC (Machinegunner)
    "rhsusf_spc_patchless_radio",                                   // SPC (Patchless/Radio)
    "rhsusf_spc_patchless",                                         // SPC (Patchless)
    "rhsusf_spc_rifleman",                                          // SPC (Rifleman)
    "rhsusf_spc_sniper",                                            // SPC (Scout Sniper)
    "rhsusf_spc_squadleader",                                       // SPC (Squadleader)
    "rhsusf_spc_teamleader",                                        // SPC (Teamleader)
    "rhsusf_spc"   
];
PIG_helmets = [
    "rhsusf_lwh_helmet_marpatwd_blk_ess",                           // LWH MARPAT-WD (Black ESS)
    "rhsusf_lwh_helmet_marpatwd_ess",                               // LWH MARPAT-WD (Tan ESS)
    "rhsusf_lwh_helmet_marpatwd_headset_blk",                       // LWH MARPAT-WD (Headset/Black ESS)
    "rhsusf_lwh_helmet_marpatwd_headset_blk2",                      // LWH MARPAT-WD (Headset)
    "rhsusf_lwh_helmet_marpatwd_headset",                           // LWH MARPAT-WD (Headset/Tan ESS)
    "rhsusf_lwh_helmet_marpatwd"                                   // LWH MARPAT-WD
];
PIG_caps = [
    "rhs_8point_marpatwd"
];
PIG_backpacks = [
    "rhsusf_assault_eagleaiii_coy",                                 // Eagle A-III Coyote
    "rhsusf_falconii_coy"                                           // Falcon-II Coyote
];
PIG_backpacks_radio = [
    "tfw_ilbe_whip_wd2"
];
PIG_facewears = [
    "G_aviator",
    "g_Shades_black",
    "G_spectacles_Tinted",
    "rhs_ess_black",                                                // Ballistic Goggles (Black)
    "rhs_googles_black",                                            // Ballistic Glasses (Black)
    "rhs_googles_clear",                                            // Ballistic Glasses (Clear)
    "rhs_googles_orange",                                           // Ballistic Glasses (Clear)
    "rhs_googles_yellow",                                           // Ballistic Glasses (Clear)
    "rhsusf_oakley_goggles_blk",                                    // SI Ballistic 2.0 (Black)
    "rhsusf_oakley_goggles_clr",                                    // SI Ballistic 2.0 (Clear)
    "rhsusf_oakley_goggles_ylw",                                    // SI Ballistic 2.0 (Yellow)
    "rhsusf_shemagh_gogg_grn",                                      // Shemagh w/ Goggles (Green)
    "rhsusf_shemagh_gogg_od",                                       // Shemagh w/ Goggles (OD)
    "rhsusf_shemagh_gogg_tan",                                      // Shemagh w/ Goggles (Tan)
    "rhsusf_shemagh_grn",                                           // Shemagh (Green)
    "rhsusf_shemagh_od",                                            // Shemagh (OD)
    "rhsusf_shemagh_tan",                                           // Shemagh (Tan)
    "rhsusf_shemagh2_gogg_grn",                                     // Shemagh w/ Goggles (Green/alt)
    "rhsusf_shemagh2_gogg_od",                                      // Shemagh w/ Goggles (OD/alt)
    "rhsusf_shemagh2_gogg_tan",                                     // Shemagh w/ Goggles (Tan/alt)
    "rhsusf_shemagh2_grn",                                          // Shemagh (Green/alt)
    "rhsusf_shemagh2_od",                                           // Shemagh (OD/alt)
    "rhsusf_shemagh2_tan"                                          // Shemagh (Tan/alt)
];

// Nightvision
PIG_nvgs = [

];

// Binoculars
PIG_binos = [
    "rhsusf_bino_lerca_1200_black",
    "rhsusf_bino_m24",
    "Laserdesignator_01_khk_F"
];

PIG_ace_commom_tools = [
    "ACE_EntrenchingTool",
    "ACE_Flashlight_MX991",
    "ACE_Clacker",
    "ACE_Flashlight_XL50",
    "ACE_microDAGR",
    "ACE_Tripod",
    "ACE_wirecutter"
];

PIG_ace_eng_tools = [
    "ACE_DefusalKit",
    "ToolKit",
    "MineDetector"
];

PIG_ace_commom_medical_items = [
    "ACE_fieldDressing",
    "ACE_elasticBandage",
    "ACE_packingBandage",
    "ACE_quikclot",
    "ACE_epinephrine",
    "ACE_morphine",
    "ACE_personalAidKit"
];

PIG_ace_medic_items = [
    "ACE_adenosine",
    "ACE_bloodIV",
    "ACE_bloodIV_250",
    "ACE_bloodIV_500",
    "ACE_plasmaIV",
    "ACE_plasmaIV_250",
    "ACE_plasmaIV_500",
    "ACE_salineIV",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_splint",
    "ACE_surgicalKit",
    "ACE_suture",
    "ACE_tourniquet"
];

PIG_ace_misc = [
    "ACE_EarPlugs",
    "ACE_IR_Strobe_Item",
    "ACE_CableTie"
];

PIG_radio = [ 
    "TFAR_anprc152"
];

// Items & Communication
PIG_commom_items = [
    "ItemMap",
    "ItemGPS",
    "ItemCompass",
    "ItemWatch"
];

allArsenalReady = true;
/*
sleep 1;
[] call compileFinal preprocessFileLineNumbers "presets\arsenal\arsenal_presets\role_selection.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\supply_menu\menu_config.sqf";