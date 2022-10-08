global const REBALANCE_VERSION = "1.2.4"
// Data structure: "category","id","name","summary","details"
global array <array <string> > changeData = [

//     [
//         "", "", "", "", ""
//     ],

    // Sidearms
    [
        "sidearm", "wingman", "Wingman B3", "The B3 has an increased fire rate, as well as buffed spread decay.",
        "- Silencer damage penalty removed" + "\n" +
        "- Increased fire rate 2.6 > 2.9 (buff)" + "\n" +
        "- Increased spread decay (buff)"
    ],[
        "sidearm", "semipistol", "p2016", "The p2016 has a slightly increased rate of fire.",
        "- Silencer damage penalty removed" + "\n" +
        "- Fire rate increased 8 > 9 (buff)"
    ],[
        "sidearm", "autopistol", "R45", "The effective range and damage of the R45 is somewhat reduced."
        "- Silencer damage penalty removed" + "\n" +
        "- Damage reduced 20 > 18 / 13 > 10" + "\n" +
        "- Damage falloff increased 750 > 500 / 1000 > 660"
    ],

    // Assault rifles
    [
        "ar", "weapon_rspn101","R101/R102", "The R101/R102 has changed damage falloff, hipfire and ADS recoil is reduced, spread decay is improved.",
        "- Damage changed 25 > 25 / 17 > 18" + "\n" +
        "- Falloff changed 1500 > 750 / 2000 > 1800" + "\n" +
        "- Hipfire accuracy reduced by ≈10%" + "\n" +
        "- ADS recoil increased by ≈20%" + "\n" +
        "- Spread decay 5 > 7 (buff)"
    ],[
        "ar", "weapon_hemlok","Hemlok", "The Hemlok can kill in one burst, however ADS recoil is increased and the mag is smaller.",
        "- Clip size reduced 24 > 18 / 30 > 24" + "\n" +
        "- Damage increased 4 hit > 3 hit / 33 > 35 / 25 > 30 / 20 > 20 (buff)" + "\n" +
        "- Spread decay increased 4 > 5 (buff)" + "\n" +
        "- Recoil in ADS introduced"
    ],[
        "ar", "weapon_g2","G2", "The G2 can now be fired faster at the cost accuracy. Fire calmly to hit where you aim.",
        "- Damage reduced 40 > 40 / 35 > 30" + "\n" +
        "- Hipfire accuracy increased by ≈20% (buff)" + "\n" +
        "- Fire rate increase 5.5 > 6.1 (buff)" + "\n" +
        "- Spread kick increased by ≈100%" + "\n" +
        "- Recoil introduced"
    ],[
        "ar", "weapon_vinson","Flatline", "Flatline magazine capacity is reduced, hipfire accuracy and recoil are marginally worse.",
        "- Damage changes 30 > 30 / 20 > 20 / 15 > 12" + "\n" +
        "- Clip size reduced 30 > 26 / 36 > 32" + "\n" +
        "- Hipfire accuracy reduced" + "\n" +
        "- ADS recoil given a small vertical component"
    ],


    //SMGs
    [
        "smg","weapon_car","CAR","SMG range is lower. CAR damage is reduced, headshot multiplier increased. Reload is slower.",
        "- Damage falloff increased 1000 > 750 / 1500 > 1200" + "\n" +
        "- Clip size reduced 30 > 24 / 36 > 28" + "\n" +
        "- Damage reduced 4 hit > 6 hit / 25 > 18 / 13 > 12 / 10 > 8" + "\n" +
        "- Reload time increased by 20%" + "\n" +
        "- Headshot multiplier increased 1.5 > 2.2 (buff)"
    ],[
        "smg","weapon_alternator","Alternator","SMG range is lower. Alternator has smaller mags and less damage. ADS is buffed, but recoil is higher.",
        "- Damage falloff increased 1000 > 750 / 1500 > 1200" + "\n" +
        "- Clip size reduced 20 > 18 / 25 > 22" + "\n" +
        "- Damage reduced 3 hit > 4 hit / 35 > 30 / 18 > 16 / 14 > 12" + "\n" +
        "- Overrall recoil increased by ≈10%" + "\n" +
        "- ADS recoil reduced to closer match hipfire (buff)"
    ],[
        "smg","weapon_hemlok_smg","Volt","SMG range is lower. Volt magazine capacity and damage is lower, but recoil is improved.",
        "- Damage falloffincreased 1000 > 750 / 1500 > 1200" + "\n" +
        "- Clip size reduced 33 > 30 / 40 > 36" + "\n" +
        "- Damage reduced 4 hit > 5 hit / 25 > 22 / 15 > 14 / 12 > 10" + "\n" +
        "- Recoil reduced by ≈8% (buff)"
    ],[
        "smg","weapon_r97","R97","SMG range is lower. R-97 damage has been reduced, recoil is more severe and reload is slower.",
        "- Damage falloff to all increased 1000 > 750 / 1500 > 1200" + "\n" +
        "- Damage reduced 4 hit > 5 hit / 20 > 17 / 12 > 10 / 10 > 9" + "\n" +
        "- Recoil increased by ≈15%" + "\n" +
        "- Reload time increased by 10%"
    ],


    //LMGs
    [
        "lmg","weapon_lmg","Spitfire","Spitfire recoil and spread is greatly increased, damage and range is slightly reduced.",
        "- Damage reduced 3 hit > 4 hit / 35 > 30 / 25 > 20 / 20 > 12" + "\n" +
        "- Damage falloff moved up 1800 > 1500 / 2000 > 1800" + "\n" +
        "- ADS inaccuracy introduced" + "\n" +
        "- Spread increased by ≈10%" + "\n" +
        "- ADS recoil increased by ≈40%"
    ],[
        "lmg","weapon_lstar","L-STAR","The L-STAR now overheats more easily, but also cools faster.",
        "- Overheats a bit more easily" + "\n" +
        "- Cooling speed increased (buff)"
    ],[
        "lmg","weapon_esaw","Devotion","The Devotion has a shorter spin up, but now suffers from severe damage falloff at range.",
        "- Damage changed 25 > 30 / 20 > 16 / 15 > 8" + "\n" +
        "- Damage falloff moved up 1500 > 1000 / 1800 > 1500" + "\n" +
        "- Spin up time reduced 1.75s > 1.5s (buff)"
    ],


    //Shotguns
    [
        "shotgun","weapon_shotgun","EVA-8","The EVA-8 now has an angle based damage boost/penalty, as well as longer range.",
        "- Damage reduced 200 > 145 / 10 > 10" + "\n" +
        "- Max range increased 750 > 900 (buff)" + "\n" +
        "- Added angle based damage boost/penalty"
    ],[
        "shotgun","weapon_mastiff","Mastiff","The Mastiff is unchanged.",
        "- No changes"
    ],


    //Grenadier
    [
        "grenadier","weapon_smr","SMR","The SMR is unchanged.",
        "- No changes"
    ],[
        "grenadier","weapon_epg","EPG","The EPG can still one-shot, but splash damage and radius is reduced."
        "- Splash damage reduced 90 > 80" + "\n" +
        "- Splash damage radius reduced 150 > 130"
    ],[
        "grenadier","weapon_softball","Softball","The Softball is unchanged.",
        "- No changes"
    ],[
        "grenadier","weapon_pulse","Cold War","The Cold War has faster firing and reloading. More damage but with a splash radius.",
        "- Damage increased 30 > 40 (buff)" + "\n" +
        "- Charge time reduced 0.5s > 0.3s (buff)" + "\n" +
        "- Burst delay increased 0.5s > 0.8s" + "\n" +
        "- Splash damage radius reduced 96 > 40 / 150 > 130" + "\n" +
        "- Reload time reduced by 20% (buff)"
    ],


    //Snipers
    [
        "sniper","weapon_sniper","Kraber","The Kraber is unchanged.",
        "- No changes"
    ],[
        "sniper","weapon_doubletake","Double Take","The Double Take can one-shot, but only at range. Slower reload and rate of fire.",
        "- Rate of fire reduced 2.0 > 1.7" + "\n" +
        "- Clip size reduced 6 > 5 / 8 > 7" + "\n" +
        "- Damage increased 4 hit > 3 hit / 30 > 30 / 30 > 40 (buff)" + "\n" +
        "- Damage falloff inverted 4500 > 900 / 15000 > 1100" + "\n" +
        "- Hipfire accuracy slightly increased by ≈25% (buff)" + "\n" +
        "- Reload time increased by 15%"
    ],[
        "sniper","weapon_dmr","DMR","The DMR fires 50% slower.",
        "- Rate of fire reduced 3.0 > 2.0"
    ],


    // Pistols
    [
        "pistol","weapon_wingman_n","Wingman Elite","The Wingman Elite can now fire significantly faster, at the cost of greater recoil.",
        "- Silencer damage penalty removed" + "\n" +
        "- Fire rate increased 2.6 > 3.5 (buff)" + "\n" +
        "- Recoil increased by ≈160%"
    ],[
        "pistol","weapon_shotgun_pistol","Mozambique","The Mozambique can now one-shot at close range without a headshot. It also reloads faster.",
        "- Silencer damage penalty removed" + "\n" +
        "- Fire rate decreased 3.0 > 2.8" + "\n" +
        "- Damage increased 4 hit > 3 hit / 30 > 34 / 25 > 23 (buff)" + "\n" +
        "- Damage falloff moved up 750 > 175" + "\n" +
        "- Reduced reload time by 15% (buff)"
    ],


    //Anti-titan
    [
        "antititan","weapon_defender","Charge Rifle","The Charge Rifle does more damage and now benefits from critical hits, but comes with less ammo.",
        "- Ammo stash reduced 20 > 10 / 25 > 14" + "\n" +
        "- Titan damage increased 1025 > 1425 / 725 > 1125 (buff)" + "\n" +
        "- Damage falloff moved up 4800 > 1500 / 5300 > 2200" + "\n" +
        "- Rate of fire reduced 1 > 0.6" + "\n" +
        "- Titan weak spot crits introduced (1.25 multiplier) (buff)"
    ],[
        "antititan","weapon_mgl","MGL","The MGL now does decent damage to pilots.",
        "- Pilot damage increased 30 > 35 (buff)" + "\n" +
        "- Splash radius increased 50 > 80 / 100 > 160"
    ],[
        "antititan","weapon_arc_lau","Thunderbolt","The Thunderbolt carries more ammo and it can one-hit pilots, reloading is slower.",
        "- Ammo stash increased 6 > 8 / 9 > 12 (buff)" + "\n" +
        "- Reload time increased by 20%" + "\n" +
        "- Pilot damage increased 70 > 120  (buff)"
    ],[
        "antititan","weapon_rocket","Archer","The Archer is unchanged.",
        "- No changes"
    ],


    //Ordnance
    [
        "ordnance","weapon_frag_grenade","Frag Grenade","Frag Grenade is unchanged.",
        "- No changes"
    ],[
        "ordnance","weapon_grenade_electric","Electric Smoke Grenade","Electric Smoke Grenade does more damage, in a larger radius.",
        "- Damage increased 150 > 170 (buff)"
        "- Effective radius increased 50 > 100 / 210 > 230 (buff)"
    ],[
        "ordnance","weapon_grenade_emp","Arc Grenade","Arc Grenade activates faster.",
        "- Activates quicker 0.75s > 0.2s (buff)"
        "- Damage reduced 40 > 20"
        "- Splash radius changed 75 > 150 / 350 > 350"
    ],[
        "ordnance","weapon_grenade_gravity","Gravity Star","Gravity Star is unchanged.",
        "- No changes"
    ],[
        "ordnance","weapon_thermite_grenade","Fire Star","Fire Star is unchanged.",
        "- No changes"
    ],[
        "ordnance","weapon_satchel","Satchel","Satchel has a somewhat larger killradius.",
        "- Larger splash radius 120 > 200 / 250 > 250 (buff)"
    ],


    // Tacticals
    [
        "tactical","ability_shifter","Phase Shift","When phasing, you can cancel early or extend to 4 seconds. The phase lenght affects cooldown.",
        "- Cooldown increased 20s > 24s" + "\n" +
        "- Phase duration increased 2s > 4s (buff)" + "\n" +
        "- Phase can be ended up to 2.5s early (buff)" + "\n" +
        "- Early cancel can shorten cooldown by up to 6 seconds."
    ],[
        "tactical","deployable_cover","A-Wall","A-Wall will only last a moment, but the cooldown is greatly reduced.",
        "- Deployment time reduced 15s > 3.5s" + "\n" +
        "- Wall health reduced 1000 > 600" + "\n" +
        "- Cooldown reduced 30s > 20s (buff)"
    ],[
        "tactical","ability_holopilot","Holopilot","Holo activation will cloak you for a moment. The decoy will also mimic your health status.",
        "- Provides cloak for 1.8 seconds on decoy creation (buff)" + "\n" +
        "- Decoy copies owner health bar appearance (buff)" + "\n" +
        "- Decoy health increased 50 > 65 (buff)" + "\n" +
        "- Cooldown increased, 20 seconds per charge" + "\n" +
        "- Second charge cannot be used before cloak expires"

    ],[
        "tactical","ability_heal","Stim","Stim heals 25 health instantly, but the regen provided during it is slower.",
        "- Heals 25hp on activation (buff)" + "\n" +
        "- Regen while stimming is 20% slower"
    ]
]
