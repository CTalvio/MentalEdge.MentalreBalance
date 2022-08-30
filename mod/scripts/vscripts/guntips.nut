
global function GunTipsInit


array<string> alreadySentTips = []

void function GunTipsInit(){
    printl("[GUNTIPS] Working")
    AddCallback_GameStateEnter( eGameState.Playing, Playing)
}

void function Playing(){
    AddCallback_OnPlayerRespawned(OnPlayerSpawned)
    foreach (entity player in GetPlayerArray()){
        thread GunTipsThread(player, 20)
    }
}

void function OnPlayerSpawned(entity player){
    thread GunTipsThread(player, 2)
    thread GunTipsThread(player, 20)
}


//array<string> gunTipList = [

//"Set off a satchel while not holding the detonator, by double tapping reload.",
//"If a MENTAL server crashes or freezes, it should be back up in 50-70 seconds, restarts are automated."

//  ]

void function GunTipsThread(entity player, int waitTime){
    wait waitTime
    string weapon = "INFO:" + player.GetMainWeapons()[0] + player.GetMainWeapons()[1] + player.GetMainWeapons()[2]
    string messageString1 = ""
    string messageString2 = ""
    string messageString3 = ""
    string weaponid1 = ""
    string weaponid2 = ""
    string weaponid3 = ""

    if (weapon.find("wingman")){
        messageString2 = "The B3 has an increased fire rate, and buffed spread decay."
        weaponid2 = "wingman"
    }
    if (weapon.find("semipistol")){
        messageString2 = "The p2016 has a slightly increased rate of fire."
        weaponid2 = "semipistol"
    }
    if (weapon.find("autopistol")){
        messageString2 = "The effective range of the R45 is reduced."
        weaponid2 = "autopistol"
    }


    if (weapon.find("weapon_rspn101")){
        messageString1 = "The R101/R102 takes one more hit to kill, hipfire accuracy is reduced, ADS recoil is increased, while spread decay is improved."
        weaponid1 = "weapon_rspn101"
    }
    if (weapon.find("weapon_hemlok")){
        messageString1 = "Hemlok is buffed, it can kill in one burst and the burst delay is shorter. Hipfire accuracy is improved but ADS recoil is increased."
        weaponid1 = "weapon_hemlok"
    }
    if (weapon.find("weapon_g2")){
        messageString1 = "The G2 can now be fired faster at the cost accuracy. Fire calmly to hit where you aim."
        weaponid1 = "weapon_g2"
    }
    if (weapon.find("weapon_vinson")){
        messageString1 = "Flatline magazine capacity is reduced, hipfire accuracy and recoil are marginally worse."
        weaponid1 = "weapon_vinson"
    }


    if (weapon.find("weapon_car")){
        messageString1 = "SMG range is lower. CAR damage is reduced, while the headshot multiplier has been increased. Reload is slower."
        weaponid1 = "weapon_car"
    }
    if (weapon.find("weapon_alternator")){
        messageString1 = "SMG range is lower. Alternator damage is reduced and the magazine is smaller. ADS is buffed, but recoil is higher."
        weaponid1 = "weapon_alternator"
    }
    if (weapon.find("weapon_hemlok_smg")){
        messageString1 = "SMG range is lower. Volt magazine capacity and damage is worse, but recoil is improved overrall."
        weaponid1 = "weapon_hemlok_smg"
    }
    if (weapon.find("weapon_r97")){
        messageString1 = "SMG range is lower. R-97 damage has been reduced, recoil is more severe and reload is slower."
        weaponid1 = "weapon_r97"
    }


    if (weapon.find("weapon_lmg")){
        messageString1 = "Spitfire recoil and spread is greatly increased, damage and range is slightly reduced."
        weaponid1 = "weapon_lmg"
    }
    if (weapon.find("weapon_lstar")){
        messageString1 = "The L-STAR now overheats more easily, but also cools faster."
        weaponid1 = "weapon_lstar"
    }
    if (weapon.find("weapon_esaw")){
        messageString1 = "The Devotion has a shorter spin up, but now suffers from severe damage falloff at range."
        weaponid1 = "weapon_esaw"
    }


    if (weapon.find("weapon_shotgun")){
        messageString1 = "The EVA-8 does a bit less damage, but the shot spread is tighter."
        weaponid1 = "weapon_shotgun"
    }
    if (weapon.find("weapon_mastiff")){
        messageString1 = "The Mastiff is unchanged."
        weaponid1 = "weapon_mastiff"
    }


    if (weapon.find("weapon_smr")){
        messageString1 = "The SMR is unchanged."
        weaponid1 = "weapon_smr"
    }
    if (weapon.find("weapon_epg")){
        messageString1 = "The EPG can still one-shot, but splash damage and radius is reduced. The magazine is also smaller by one."
        weaponid1 = "weapon_epg"
    }
    if (weapon.find("weapon_softball")){
        messageString1 = "The Softball is unchanged."
        weaponid1 = "weapon_softball"
    }
    if (weapon.find("weapon_pulse")){
        messageString1 = "The Cold War now fires quicker. It reloads faster and damage is increased, but the splash radius is smaller."
        weaponid1 = "weapon_pulse"
    }


    if (weapon.find("weapon_sniper")){
        messageString1 = "The Kraber is unchanged."
        weaponid1 = "weapon_sniper"
    }
    if (weapon.find("weapon_doubletake")){
        messageString1 = "The Doubletake is now able to one-shot if both bolts hit beyond a certain range."
        weaponid1 = "weapon_doubletake"
    }
    if (weapon.find("weapon_dmr")){
        messageString1 = "The DMR fires 50% slower."
        weaponid1 = "weapon_dmr"
    }


    if (weapon.find("weapon_wingman_n")){
        messageString1 = "The Wingman Elite can now fire significantly faster, at the cost of greater recoil."
        weaponid1 = "weapon_wingman_n"
    }
    if (weapon.find("weapon_shotgun_pistol")){
        messageString1 = "The Mozambique can now one-shot at close range without a headshot. It also reloads faster."
        weaponid1 = "weapon_shotgun_pistol"
    }


    if (weapon.find("weapon_defender")){
        messageString3 = "The charge rifle now loses its charge very quickly. But it does more damage and now benefits from critical hits."
        weaponid3 = "weapon_defender"
    }
    if (weapon.find("weapon_mgl")){
        messageString3 = "The MGL is unchanged."
        weaponid3 = "weapon_mgl"
    }
    if (weapon.find("weapon_arc_lau")){
        messageString3 = "The Thunderbolt carries more ammo and it can one-hit pilots, reloads are slower."
        weaponid3 = "weapon_arc_lau"
    }
    if (weapon.find("weapon_rocket")){
        messageString3 = "The Archer is unchanged."
        weaponid3 = "weapon_rocket"
    }

    if (alreadySentTips.find(player.GetPlayerName() + "INFO") == -1){
        //NSSendInfoMessageToPlayer( player, "Guns on this server are rebalanced, equip different loadouts to get info on changes." )
        Chat_ServerPrivateMessage( player, "Guns on this server are rebalanced, equip different loadouts to get info on changes.", false)
        alreadySentTips.append(player.GetPlayerName() + "INFO")
        wait 5
    }

    if (alreadySentTips.find(player.GetPlayerName() + weaponid1) == -1){
        //NSSendInfoMessageToPlayer( player, messageString1 )
        Chat_ServerPrivateMessage( player, messageString1, false)
        alreadySentTips.append(player.GetPlayerName() + weaponid1)
    }

    wait 5

    if (alreadySentTips.find(player.GetPlayerName() + weaponid2) == -1 && alreadySentTips.find(player.GetPlayerName() + weaponid3) == -1){
        //NSSendInfoMessageToPlayer( player, messageString2 + " - " + messageString3 )
        Chat_ServerPrivateMessage( player, messageString2 + " - " + messageString3, false)
        alreadySentTips.append(player.GetPlayerName() + weaponid2)
        alreadySentTips.append(player.GetPlayerName() + weaponid3)
    }
    else if (alreadySentTips.find(player.GetPlayerName() + weaponid2) == -1){
        //NSSendInfoMessageToPlayer( player, messageString2 )
        Chat_ServerPrivateMessage( player, messageString2, false)
        alreadySentTips.append(player.GetPlayerName() + weaponid2)
    }
    else if (alreadySentTips.find(player.GetPlayerName() + weaponid3) == -1){
        //NSSendInfoMessageToPlayer( player, messageString3 )
        Chat_ServerPrivateMessage( player, messageString3, false)
        alreadySentTips.append(player.GetPlayerName() + weaponid3)
    }

    return
}
