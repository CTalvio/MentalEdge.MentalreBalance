global function GunTipsInit

// TODO Add tacticals

array<string> alreadySentTips = []

array<string> goodToKnowList = [

"The Hemlok no longer sucks, have at it!",
"The damage falloff of all SMGs has been made more severe.",
"The CAR has been nerfed overrall, but it actually does more headshot damage.",
"Sidearms are now only barely weaker than main weapons.",
"The EVA-8 fires no real bullets, damage is completely based on distance and angle.",
"The Doubletake is now able to one-shot, but only from far enough.",
"A-Wall only lasts 4 seconds and can take only 300 damage. But it can be used more often.",
"The Thunderbolt can now one-hit pilots, step aside EPG!",
"Some buffed weapons are the Doubletake, Mozambique and Hemlok.",
"Some buffed weapons are the B3 Wingman, Devotion and Cold War.",
"The buffed Ordnance are the Arc Grenade, Electric smoke and Satchel."

]

void function GunTipsInit(){
    int guntTipsEnable = GetConVarInt( "rebalance_tips" )
    if (guntTipsEnable == 1){
        printl("[GUNTIPS] Working")
        AddCallback_GameStateEnter( eGameState.Playing, Playing)
    }
}

void function Playing(){
    AddCallback_OnPlayerRespawned(OnPlayerSpawned)
    foreach (entity player in GetPlayerArray()){
        thread GunTipsThread(player, 20, 1)
    }
}

void function OnPlayerSpawned(entity player){
    thread GunTipsThread(player, 2, 1)
    thread GunTipsThread(player, 20, 2)
}

void function GunTipsThread(entity player, int waitTime, int iteration){

    wait waitTime

    if ( !IsValid(player) || !IsAlive(player) ){
        return
    }

    string weapon = "INFO:" + player.GetMainWeapons()[0] + player.GetMainWeapons()[1] + player.GetMainWeapons()[2]
    string offhand = "INFO:" + player.GetOffhandWeapons()[0] + player.GetOffhandWeapons()[1] + player.GetOffhandWeapons()[2]
    string messageString1 = ""
    string messageString2 = ""
    string messageString3 = ""
    string messageString4 = ""
    string messageString5 = ""
    string weaponid1 = ""
    string weaponid2 = ""
    string weaponid3 = ""
    string offhandid1 = ""
    string offhandid2 = ""

    //Sidearms
    if (weapon.find("wingman")){
        messageString2 = "The B3 has an increased fire rate, as well as buffed spread decay"
        weaponid2 = "wingman"
    }
    if (weapon.find("semipistol")){
        messageString2 = "The p2016 has a slightly increased rate of fire"
        weaponid2 = "semipistol"
    }
    if (weapon.find("autopistol")){
        messageString2 = "The effective range of the R45 is reduced"
        weaponid2 = "autopistol"
    }

    //Assault Rifles
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

    //SMGs
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

    //LMGs
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

    //Shotguns
    if (weapon.find("weapon_shotgun")){
        messageString1 = "The EVA-8 does less damage, but also now has an angle based damage boost/penalty, and longer range."
        weaponid1 = "weapon_shotgun"
    }
    if (weapon.find("weapon_mastiff")){
        messageString1 = "The Mastiff is unchanged."
        weaponid1 = "weapon_mastiff"
    }

    //Grenadier
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

    //Snipers
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

    //Pistols
    if (weapon.find("weapon_wingman_n")){
        messageString1 = "The Wingman Elite can now fire significantly faster, at the cost of greater recoil."
        weaponid1 = "weapon_wingman_n"
    }
    if (weapon.find("weapon_shotgun_pistol")){
        messageString1 = "The Mozambique can now one-shot at close range without a headshot. It also reloads faster."
        weaponid1 = "weapon_shotgun_pistol"
    }

    //Anti-titan
    if (weapon.find("weapon_defender")){
        messageString3 = "The charge rifle now loses its charge very quickly. But it does more damage and now benefits from critical hits."
        weaponid3 = "weapon_defender"
    }
    if (weapon.find("weapon_mgl")){
        messageString3 = "The MGL now does decent damage to pilots."
        weaponid3 = "weapon_mgl"
    }
    if (weapon.find("weapon_arc_lau")){
        messageString3 = "The Thunderbolt carries more ammo and it can one-hit pilots, reloading is slower."
        weaponid3 = "weapon_arc_lau"
    }
    if (weapon.find("weapon_rocket")){
        messageString3 = "The Archer is unchanged."
        weaponid3 = "weapon_rocket"
    }

    //Ordnance
    if (offhand.find("weapon_frag_grenade")){
        messageString4 = "Frag Grenade is unchanged."
        offhandid1 = "weapon_frag_grenade"
    }
    if (offhand.find("weapon_grenade_electric")){
        messageString4 = "Electric Smoke Grenade does more damage."
        offhandid1 = "weapon_grenade_electric"
    }
    if (offhand.find("weapon_grenade_emp")){
        messageString4 = "Arc Grenade activates sooner."
        offhandid1 = "weapon_grenade_emp"
    }
    if (offhand.find("weapon_grenade_gravity")){
        messageString4 = "Gravity Star is unchanged."
        offhandid1 = "weapon_grenade_gravity"
    }
    if (offhand.find("weapon_thermite_grenade")){
        messageString4 = "Fire Star is unchanged."
        offhandid1 = "weapon_thermite_grenade"
    }
    if (offhand.find("weapon_satchel")){
        messageString4 = "Satchel has a somewhat larger killradius."
        offhandid1 = "weapon_satchel"
    }


    if (offhand.find("ability_shifter")){
        messageString5 = "When phasing, you can now stay in the up-side-down for a little longer, the cooldown is longer."
        offhandid2 = "ability_shifter"
    }
    if (offhand.find("deployable_cover")){
        messageString5 = "Your A-Wall will only last a moment and can only take a moderate amount of fire, but you can use it more often."
        offhandid2 = "deployable_cover"
    }

    if ( !IsValid(player) || !IsAlive(player) ){
        return
    }

    // Send initial notification.
    if (alreadySentTips.find(player.GetPlayerName() + "INFO") == -1){
        //NSSendInfoMessageToPlayer( player, "Pilot weapons on this server are rebalanced, equip different loadouts to get info on changes." )
        Chat_ServerPrivateMessage( player, "Pilot weapons on this server are rebalanced, equip different loadouts to get info on changes.", false)
        alreadySentTips.append(player.GetPlayerName() + "INFO")
        wait 5
    }
    else if (alreadySentTips.find(player.GetPlayerName() + "GOODTOKNOW") == -1){
        //NSSendInfoMessageToPlayer( player, "Something good to know: " goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )])
        Chat_ServerPrivateMessage( player, "Good to know: " + goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )], false)
        alreadySentTips.append(player.GetPlayerName() + "GOODTOKNOW")
        wait 5
    }

    if ( !IsValid(player) || !IsAlive(player) ){
        return
    }

    // Send main weapon info, if that is sent, send tacitcal info
    if (alreadySentTips.find(player.GetPlayerName() + weaponid1) == -1){
        //NSSendInfoMessageToPlayer( player, messageString1 )
        Chat_ServerPrivateMessage( player, messageString1, false)
        alreadySentTips.append(player.GetPlayerName() + weaponid1)
        wait 5
    }
    else if (alreadySentTips.find(player.GetPlayerName() + offhandid2) == -1 && messageString5 != "" && iteration == 1){
        //NSSendInfoMessageToPlayer( player, messageString5 )
        Chat_ServerPrivateMessage( player, messageString5, false)
        alreadySentTips.append(player.GetPlayerName() + offhandid2)
        wait 5
    }

    if ( !IsValid(player) || !IsAlive(player) ){
        return
    }

    // Send ordnance and/or sidearm info, if that is sent, send AT weapon info
    if (alreadySentTips.find(player.GetPlayerName() + weaponid2) == -1 && alreadySentTips.find(player.GetPlayerName() + offhandid1) == -1){
        //NSSendInfoMessageToPlayer( player, messageString2 + " - " + messageString4 )
        Chat_ServerPrivateMessage( player, messageString2 + " and the " + messageString4, false)
        alreadySentTips.append(player.GetPlayerName() + weaponid2)
        alreadySentTips.append(player.GetPlayerName() + offhandid1)
    }
    else if (alreadySentTips.find(player.GetPlayerName() + weaponid2) == -1){
        //NSSendInfoMessageToPlayer( player, messageString2 + "." )
        Chat_ServerPrivateMessage( player, messageString2 + "." , false)
        alreadySentTips.append(player.GetPlayerName() + weaponid2)
    }
    else if (alreadySentTips.find(player.GetPlayerName() + offhandid1) == -1){
        //NSSendInfoMessageToPlayer( player, messageString4 )
        Chat_ServerPrivateMessage( player, "The " + messageString4, false)
        alreadySentTips.append(player.GetPlayerName() + offhandid1)
    }
    else if (alreadySentTips.find(player.GetPlayerName() + weaponid3) == -1 && iteration == 1){
        //NSSendInfoMessageToPlayer( player, messageString3 )
        Chat_ServerPrivateMessage( player, messageString3, false)
        alreadySentTips.append(player.GetPlayerName() + weaponid3)
    }

    return
}
