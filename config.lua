Config = Config or {}

--Config.ReloadTime = math.random(4000, 6000)

Config.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
}

Config.Throwables = {
    "ball",
    "bzgas",
    "flare",
    "grenade",
    "molotov",
    "pipebomb",
    "proxmine",
    "smokegrenade",
    "snowball",
    "stickybomb",
}

Config.DurabilityMultiplier = {
    -- Melee
    -- ['weapon_unarmed'] 				 = 0.15,
    ['weapon_dagger']                = 0.15,
    ['weapon_bat']                   = 0.15,
    ['weapon_bottle']                = 0.15,
    ['weapon_crowbar']               = 0.15,
    ['weapon_candycane']             = 0.15,
    -- ['weapon_flashlight'] 			 = 0.15,
    ['weapon_golfclub']              = 0.15,
    ['weapon_hammer']                = 0.15,
    ['weapon_hatchet']               = 0.15,
    ['weapon_knuckle']               = 0.15,
    ['weapon_knife']                 = 0.15,
    ['weapon_machete']               = 0.15,
    ['weapon_switchblade']           = 0.15,
    -- ['weapon_nightstick'] 			 = 0.15,
    ['weapon_wrench']                = 0.15,
    ['weapon_battleaxe']             = 0.15,
    ['weapon_poolcue']               = 0.15,
    ['weapon_briefcase']             = 0.15,
    ['weapon_briefcase_02']          = 0.15,
    ['weapon_garbagebag']            = 0.15,
    ['weapon_handcuffs']             = 0.15,
    ['weapon_bread']                 = 0.15,
    ['weapon_stone_hatchet']         = 0.15,

    -- Handguns
    ['weapon_pistol']                = 0.15,
    ['weapon_pistol_mk2']            = 0.15,
    ['weapon_combatpistol']          = 0.15,
    ['weapon_appistol']              = 0.15,
    -- ['weapon_stungun'] 				 = 0.15,
    -- ['weapon_stungun_mp'] 				 = 0.15,
    ['weapon_pistol50']              = 0.15,
    ['weapon_snspistol']             = 0.15,
    ['weapon_heavypistol']           = 0.15,
    ['weapon_vintagepistol']         = 0.15,
    ['weapon_flaregun']              = 0.15,
    ['weapon_marksmanpistol']        = 0.15,
    ['weapon_revolver']              = 0.15,
    ['weapon_revolver_mk2']          = 0.15,
    ['weapon_doubleaction']          = 0.15,
    ['weapon_snspistol_mk2']         = 0.15,
    ['weapon_raypistol']             = 0.15,
    ['weapon_ceramicpistol']         = 0.15,
    ['weapon_navyrevolver']          = 0.15,
    ['weapon_gadgetpistol']          = 0.15,
    ['weapon_pistolxm3']             = 0.15,

    -- Submachine Guns
    ['weapon_microsmg']              = 0.15,
    ['weapon_smg']                   = 0.15,
    ['weapon_smg_mk2']               = 0.15,
    ['weapon_assaultsmg']            = 0.15,
    ['weapon_combatpdw']             = 0.15,
    ['weapon_machinepistol']         = 0.15,
    ['weapon_minismg']               = 0.15,
    ['weapon_raycarbine']            = 0.15,

    -- Shotguns
    ['weapon_pumpshotgun']           = 0.15,
    ['weapon_sawnoffshotgun']        = 0.15,
    ['weapon_assaultshotgun']        = 0.15,
    ['weapon_bullpupshotgun']        = 0.15,
    ['weapon_musket']                = 0.15,
    ['weapon_heavyshotgun']          = 0.15,
    ['weapon_dbshotgun']             = 0.15,
    ['weapon_autoshotgun']           = 0.15,
    ['weapon_pumpshotgun_mk2']       = 0.15,
    ['weapon_combatshotgun']         = 0.15,

    -- Assault Rifles
    ['weapon_assaultrifle']          = 0.15,
    ['weapon_assaultrifle_mk2']      = 0.15,
    ['weapon_carbinerifle']          = 0.15,
    ['weapon_carbinerifle_mk2']      = 0.15,
    ['weapon_advancedrifle']         = 0.15,
    ['weapon_specialcarbine']        = 0.15,
    ['weapon_bullpuprifle']          = 0.15,
    ['weapon_compactrifle']          = 0.15,
    ['weapon_specialcarbine_mk2']    = 0.15,
    ['weapon_bullpuprifle_mk2']      = 0.15,
    ['weapon_militaryrifle']         = 0.15,
    ['weapon_heavyrifle']            = 0.15,

    -- Light Machine Guns
    ['weapon_mg']                    = 0.15,
    ['weapon_combatmg']              = 0.15,
    ['weapon_gusenberg']             = 0.15,
    ['weapon_combatmg_mk2']          = 0.15,

    -- Sniper Rifles
    ['weapon_sniperrifle']           = 0.15,
    ['weapon_heavysniper']           = 0.15,
    ['weapon_marksmanrifle']         = 0.15,
    ['weapon_remotesniper']          = 0.15,
    ['weapon_heavysniper_mk2']       = 0.15,
    ['weapon_marksmanrifle_mk2']     = 0.15,

    -- Heavy Weapons
    ['weapon_rpg']                   = 0.15,
    ['weapon_grenadelauncher']       = 0.15,
    ['weapon_grenadelauncher_smoke'] = 0.15,
    ['weapon_emplauncher']           = 0.15,
    ['weapon_minigun']               = 0.15,
    ['weapon_firework']              = 0.15,
    ['weapon_railgun']               = 0.15,
    ['weapon_hominglauncher']        = 0.15,
    ['weapon_compactlauncher']       = 0.15,
    ['weapon_rayminigun']            = 0.15,
    ['weapon_railgunxm3']            = 0.15,

    -- Throwables
    ['weapon_grenade']               = 0.15,
    ['weapon_bzgas']                 = 0.15,
    ['weapon_molotov']               = 0.15,
    ['weapon_stickybomb']            = 0.15,
    ['weapon_proxmine']              = 0.15,
    ['weapon_snowball']              = 0.15,
    ['weapon_pipebomb']              = 0.15,
    ['weapon_ball']                  = 0.15,
    ['weapon_smokegrenade']          = 0.15,
    ['weapon_flare']                 = 0.15,

    -- Miscellaneous
    ['weapon_petrolcan']             = 0.15,
    ['weapon_fireextinguisher']      = 0.15,
    ['weapon_hazardcan']             = 0.15,
    ['weapon_fertilizercan']         = 0.15,

     --Addon
     ['weapon_g17a'] 				= 0.15,
}

Config.WeaponRepairPoints = {
    [1] = {
        coords = vector3(964.02, -1267.41, 34.97),
        IsRepairing = false,
        RepairingData = {},
    }
}

Config.WeaponRepairCosts = {
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["mg"] = 4000,
    ["rifle"] = 5000,
    ["sniper"] = 7000,
    ["shotgun"] = 6000
}

WeaponAttachments = {
    --███╗░░░███╗███████╗██╗░░░░░███████╗███████╗
    --████╗░████║██╔════╝██║░░░░░██╔════╝██╔════╝
    --██╔████╔██║█████╗░░██║░░░░░█████╗░░█████╗░░
    --██║╚██╔╝██║██╔══╝░░██║░░░░░██╔══╝░░██╔══╝░░
    --██║░╚═╝░██║███████╗███████╗███████╗███████╗
    --╚═╝░░░░░╚═╝╚══════╝╚══════╝╚══════╝╚══════╝

    ['WEAPON_KNUCKLE'] = {
        ['pimp'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_PIMP',
            item = 'knuckle_style_1',
        },
        ['ballas'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_BALLAS',
            item = 'knuckle_style_2',
        },
        ['hustler'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_DOLLAR',
            item = 'knuckle_style_3',
        },
        ['rock'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_DIAMOND',
            item = 'knuckle_style_4',
        },
        ['hater'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_HATE',
            item = 'knuckle_style_5',
        },
        ['lover'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_LOVE',
            item = 'knuckle_style_6',
        },
        ['player'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_PLAYER',
            item = 'knuckle_style_7',
        },
        ['king'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_KING',
            item = 'knuckle_style_8',
        },
        ['vagos'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_VAGOS',
            item = 'knuckle_style_9',
        },
    },
    ['WEAPON_SWITCHBLADE'] = {
        ['vip'] = {
            component = 'COMPONENT_SWITCHBLADE_VARMOD_VAR1',
            item = 'blade_style_1',
        },
        ['bodyguard'] = {
            component = 'COMPONENT_SWITCHBLADE_VARMOD_VAR2',
            item = 'blade_style_2',
        },
    },

    --██████╗░██╗░██████╗████████╗░█████╗░██╗░░░░░░██████╗
    --██╔══██╗██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██╔════╝
    --██████╔╝██║╚█████╗░░░░██║░░░██║░░██║██║░░░░░╚█████╗░
    --██╔═══╝░██║░╚═══██╗░░░██║░░░██║░░██║██║░░░░░░╚═══██╗
    --██║░░░░░██║██████╔╝░░░██║░░░╚█████╔╝███████╗██████╔╝
    --╚═╝░░░░░╚═╝╚═════╝░░░░╚═╝░░░░╚════╝░╚══════╝╚═════╝░

    ['WEAPON_PISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PISTOL_VARMOD_LUXE',
            item = 'luxury',
        },
    },
    ['WEAPON_COMBATPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER',
            item = 'luxury',
        },
    },
    ['WEAPON_APPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_APPISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_APPISTOL_VARMOD_LUXE',
            item = 'luxury',
        },
    },
    ['WEAPON_PISTOL50'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL50_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PISTOL50_VARMOD_LUXE',
            item = 'luxury',
        },
    },
    ['WEAPON_REVOLVER'] = {
        ['vipvariant'] = {
            component = 'COMPONENT_REVOLVER_VARMOD_GOON',
            item = 'revolver_vipvariant',
            type = 'skin',
        },
        ['bodyguardvariant'] = {
            component = 'COMPONENT_REVOLVER_VARMOD_BOSS',
            item = 'revolver_bodyguardvariant',
            type = 'skin',
        },
    },
    ['WEAPON_SNSPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SNSPISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
    },
    ['WEAPON_HEAVYPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYPISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
    },
    ['WEAPON_REVOLVER_MK2'] = {
        --[[['scope'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'pistol_scope_1',
            type = 'scope',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_MK2',
            item = 'pistol_scope_2',
            type = 'scope',
        },]]
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
    },
    ['WEAPON_SNSPISTOL_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH_03',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['tint1'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO',
            item = 'weapontintmk2_1',
            type = 'tint',
        },
        ['tint2'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_02',
            item = 'weapontintmk2_2',
            type = 'tint',
        },
    },
    ['WEAPON_PISTOL_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH_02',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP_02',
            item = 'pistol_suppressor',
        },
    },
    ['WEAPON_VINTAGEPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
            type = 'silencer',
        },
    },
    ['WEAPON_CERAMICPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
            type = 'silencer',
        },
    },

    --░██████╗███╗░░░███╗░██████╗░░██████╗
    --██╔════╝████╗░████║██╔════╝░██╔════╝
    --╚█████╗░██╔████╔██║██║░░██╗░╚█████╗░
    --░╚═══██╗██║╚██╔╝██║██║░░╚██╗░╚═══██╗
    --██████╔╝██║░╚═╝░██║╚██████╔╝██████╔╝
    --╚═════╝░╚═╝░░░░░╚═╝░╚═════╝░╚═════╝░

    ['WEAPON_MICROSMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MICROSMG_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'smg_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_MICROSMG_VARMOD_LUXE',
            item = 'luxury',
        },
    },
    ['WEAPON_SMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SMG_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SMG_CLIP_03',
            item = 'smg_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'smg_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_02',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'smg_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_SMG_VARMOD_LUXE',
            item = 'luxury',
        },
    },
    ['WEAPON_ASSAULTSMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSMG_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'smg_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER',
            item = 'luxury',
        },
    },
    ['WEAPON_MINISMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MINISMG_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
    },
    ['WEAPON_SMG_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SMG_MK2_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'smg_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SIGHTS_SMG',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'smg_suppressor',
        },
    },
    ['WEAPON_MACHINEPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_03',
            item = 'smg_drum',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'smg_suppressor',
        },
    },
    ['WEAPON_COMBATPDW'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_03',
            item = 'smg_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'smg_flashlight',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'smg_grip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'smg_scope',
        },
    },
    
    --░██████╗██╗░░██╗░█████╗░████████╗░██████╗░██╗░░░██╗███╗░░██╗░██████╗
    --██╔════╝██║░░██║██╔══██╗╚══██╔══╝██╔════╝░██║░░░██║████╗░██║██╔════╝
    --╚█████╗░███████║██║░░██║░░░██║░░░██║░░██╗░██║░░░██║██╔██╗██║╚█████╗░
    --░╚═══██╗██╔══██║██║░░██║░░░██║░░░██║░░╚██╗██║░░░██║██║╚████║░╚═══██╗
    --██████╔╝██║░░██║╚█████╔╝░░░██║░░░╚██████╔╝╚██████╔╝██║░╚███║██████╔╝
    --╚═════╝░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░░╚═════╝░░╚═════╝░╚═╝░░╚══╝╚═════╝░

    ['WEAPON_PUMPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'shotgun_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_SR_SUPP',
            item = 'shotgun_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER',
            item = 'luxury',
        },
    },
    ['WEAPON_SAWNOFFSHOTGUN'] = {
        ['luxuryfinish'] = {
            component = 'COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE',
            item = 'luxury',
        },
    },
    ['WEAPON_ASSAULTSHOTGUN'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02',
            item = 'shotgun_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'shotgun_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'shotgun_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'shotgun_grip',
        },
    },
    ['WEAPON_BULLPUPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'shotgun_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'shotgun_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'shotgun_grip',
        },
    },
    ['WEAPON_HEAVYSHOTGUN'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_02',
            item = 'shotgun_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_03',
            item = 'shotgun_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'shotgun_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'shotgun_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'shotgun_grip',
        },
    },
    ['WEAPON_COMBATSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'shotgun_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'shotgun_suppressor',
        },
    },
    
    --░█████╗░░██████╗░██████╗░█████╗░██╗░░░██╗██╗░░░░░████████╗  ██████╗░██╗███████╗██╗░░░░░███████╗
    --██╔══██╗██╔════╝██╔════╝██╔══██╗██║░░░██║██║░░░░░╚══██╔══╝  ██╔══██╗██║██╔════╝██║░░░░░██╔════╝
    --███████║╚█████╗░╚█████╗░███████║██║░░░██║██║░░░░░░░░██║░░░  ██████╔╝██║█████╗░░██║░░░░░█████╗░░
    --██╔══██║░╚═══██╗░╚═══██╗██╔══██║██║░░░██║██║░░░░░░░░██║░░░  ██╔══██╗██║██╔══╝░░██║░░░░░██╔══╝░░
    --██║░░██║██████╔╝██████╔╝██║░░██║╚██████╔╝███████╗░░░██║░░░  ██║░░██║██║██║░░░░░███████╗███████╗
    --╚═╝░░╚═╝╚═════╝░╚═════╝░╚═╝░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░  ╚═╝░░╚═╝╚═╝╚═╝░░░░░╚══════╝╚══════╝

    ['WEAPON_ASSAULTRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_03',
            item = 'rifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',--
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE',
            item = 'luxury',
        },
    },
    ['WEAPON_CARBINERIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_03',
            item = 'rifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE',
            item = 'luxury',
        },
    },
    ['WEAPON_ADVANCEDRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE',
            item = 'advancedrifle_luxuryfinish',
        },
    },
    ['WEAPON_SPECIALCARBINE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_03',
            item = 'rifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER',
            item = 'specialcarbine_luxuryfinish',
        },
    },
    ['WEAPON_BULLPUPRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW',
            item = 'bullpuprifle_luxuryfinish',
        },
    },
    ['WEAPON_BULLPUPRIFLE_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_SPECIALCARBINE_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'rifle_scope',
    },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_ASSAULTRIFLE_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SIGHTS',--
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_CARBINERIFLE_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_COMPACTRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_03',
            item = 'rifle_drum',
            type = 'clip',
        },
    },
    ['WEAPON_MILITARYRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MILITARYRIFLE_CLIP_02',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
    },
    
    --███╗░░░███╗░█████╗░░█████╗░██╗░░██╗██╗███╗░░██╗███████╗  ░██████╗░██╗░░░██╗███╗░░██╗░██████╗
    --████╗░████║██╔══██╗██╔══██╗██║░░██║██║████╗░██║██╔════╝  ██╔════╝░██║░░░██║████╗░██║██╔════╝
    --██╔████╔██║███████║██║░░╚═╝███████║██║██╔██╗██║█████╗░░  ██║░░██╗░██║░░░██║██╔██╗██║╚█████╗░
    --██║╚██╔╝██║██╔══██║██║░░██╗██╔══██║██║██║╚████║██╔══╝░░  ██║░░╚██╗██║░░░██║██║╚████║░╚═══██╗
    --██║░╚═╝░██║██║░░██║╚█████╔╝██║░░██║██║██║░╚███║███████╗  ╚██████╔╝╚██████╔╝██║░╚███║██████╔╝
    --╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝  ░╚═════╝░░╚═════╝░╚═╝░░╚══╝╚═════╝░

    ['WEAPON_MG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MG_CLIP_02',
            item = 'mg_extendedclip',
            type = 'clip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL_02',
            item = 'mg_scope',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_MG_VARMOD_LOWRIDER',
            item = 'luxury',
        },
    },
    ['WEAPON_COMBATMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATMG_CLIP_02',
            item = 'mg_extendedclip',
            type = 'clip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'mg_scope',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'mg_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_COMBATMG_VARMOD_LOWRIDER',
            item = 'luxury',
        },
    },
    ['WEAPON_COMBATMG_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATMG_MK2_CLIP_02',
            item = 'mg_extendedclip',
            type = 'clip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'mg_scope',
    },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'mg_grip',
        },
    },
    ['WEAPON_GUSENBERG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_GUSENBERG_CLIP_02',
            item = 'mg_extendedclip',
            type = 'clip',
        },
    },

    --░██████╗███╗░░██╗██╗██████╗░███████╗██████╗░░██████╗
    --██╔════╝████╗░██║██║██╔══██╗██╔════╝██╔══██╗██╔════╝
    --╚█████╗░██╔██╗██║██║██████╔╝█████╗░░██████╔╝╚█████╗░
    --░╚═══██╗██║╚████║██║██╔═══╝░██╔══╝░░██╔══██╗░╚═══██╗
    --██████╔╝██║░╚███║██║██║░░░░░███████╗██║░░██║██████╔╝
    --╚═════╝░╚═╝░░╚══╝╚═╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═════╝░

    ['WEAPON_SNIPERRIFLE'] = {
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'sniper_suppressor',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            item = 'sniper_scope',
            type = 'scope',
        },
    },
    ['WEAPON_HEAVYSNIPER'] = {
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            item = 'sniper_scope',
            type = 'scope',
        },
    },
    ['WEAPON_MARKSMANRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_02',
            item = 'sniper_extendedclip',
            type = 'clip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM',
            item = 'sniper_scope',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'sniper_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'sniper_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'sniper_grip',
        },
    },
    ['WEAPON_MARKSMANRIFLE_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02',
            item = 'sniper_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'sniper_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'sniper_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'sniper_grip',
        },
    },
    ['WEAPON_HEAVYSNIPER_MK2'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02',
            item = 'sniper_extendedclip',
            type = 'clip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE_MK2',
            item = 'sniper_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_SR_SUPP_03',
            item = 'sniper_suppressor',
        },
    },
    
    --██╗░░██╗███████╗░█████╗░██╗░░░██╗██╗░░░██╗
    --██║░░██║██╔════╝██╔══██╗██║░░░██║╚██╗░██╔╝
    --███████║█████╗░░███████║╚██╗░██╔╝░╚████╔╝░
    --██╔══██║██╔══╝░░██╔══██║░╚████╔╝░░░╚██╔╝░░
    --██║░░██║███████╗██║░░██║░░╚██╔╝░░░░░██║░░░
    --╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░░░░╚═╝░░░

    ['WEAPON_GRENADELAUNCHER'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'launcher_flashlight',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'launcher_grip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'launcher_scope',
        },
    },
    ['WEAPON_GRENADELAUNCHER_SMOKE'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'launcher_flashlight',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'launcher_grip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'launcher_scope',
        },
    },

    --░█████╗░██████╗░██████╗░░█████╗░███╗░░██╗
    --██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗░██║
    --███████║██║░░██║██║░░██║██║░░██║██╔██╗██║
    --██╔══██║██║░░██║██║░░██║██║░░██║██║╚████║
    --██║░░██║██████╔╝██████╔╝╚█████╔╝██║░╚███║
    --╚═╝░░╚═╝╚═════╝░╚═════╝░░╚════╝░╚═╝░░╚══╝

    ['WEAPON_G17A'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MARKOMODS_G17A_MAG_02',
            label = 'Glock 17 EXT Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_MARKOMODS_G17A_FLASH_01',
            label = 'Glock 17 Flashlight',
            item = 'pistol_flashlight',
        },
    },
}

local function getConfigWeaponAttachments(weapon)
    return WeaponAttachments[weapon]
end

exports('getConfigWeaponAttachments', getConfigWeaponAttachments)
