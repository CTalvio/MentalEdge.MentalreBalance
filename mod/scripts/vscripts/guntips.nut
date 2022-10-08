global function GunTipsInit

int category = 0
int id = 1
int name = 2
int summary = 3
int details = 4

array<string> alreadySentTips = []

array<string> goodToKnowList = [
"The Hemlok no longer sucks, have at it!",
"The damage falloff of all SMGs has been made more severe.",
"The CAR has been nerfed overrall, but it actually does more headshot damage.",
"Sidearms are now only barely weaker than main weapons.",
"The EVA-8 fires no real bullets, damage is completely based on distance and angle.",
"The Doubletake is now able to one-shot, but only from far enough.",
"A-Wall only lasts 3.5 seconds and can take only 600 damage. But it can be used more often.",
"The Thunderbolt can now one-hit pilots, step aside EPG!",
"Some buffed weapons are the Doubletake, Mozambique and Hemlok.",
"Some buffed weapons are the B3 Wingman, Devotion and Cold War.",
"The buffed Ordnance are the Arc Grenade, Electric smoke and Satchel.",
"Holo now comes with a moment of cloak on decoy activation.",
"Health regen has been changed, it is slower but kicks in faster.",
"Fast Regen only heals 0.8 seconds sooner than without it.",
"Silencers no longer have a damage penalty.",
"When phasing, you can now cancel it early to recoup some if its cooldown.",
"Stim heals slower, but it now gives some health instantly on activation.",
"The Charge Rifle comes with less ammo, but it can now do close up titan crits for massive damage."
]


void function GunTipsInit(){
    FSU_RegisterCommand( "changes", AccentOne( FSU_GetString("FSU_PREFIX") + "changes <loadout/item/category>") + " - view rebalance changes.", "edg", infoCommand, ["rebalance","nerfs","nerf","buff","buffs","changelog","change"] )

    if (GetConVarInt( "rebalance_tips" ) == 1){
        AddCallback_GameStateEnter( eGameState.Playing, Playing)
    }
}

void function Playing(){
    printl("[REBALANCETIPS] Rebalance tips enabled")
    AddCallback_OnPlayerRespawned(OnPlayerSpawned)
    foreach (entity player in GetPlayerArray()){
        thread GunTipsThread(player, 2)
        thread GunTipsThread(player, 20)
    }
}

void function OnPlayerSpawned(entity player){
    printl("[REBALANCETIPS] Running on spawn")
    thread GunTipsThread(player, 2)
    thread GunTipsThread(player, 20)
}

void function GunTipsThread(entity player, int waitTime){
    wait waitTime
    if ( !IsValid(player) || !IsAlive(player) || player.IsTitan() || player.GetMainWeapons().len() != 3 || player.GetOffhandWeapons().len() != 3 ) {
        printl("[REBALANCETIPS] Interrupted, player no longer needs tips")
        return
    }
    string weapon = player.GetMainWeapons()[0].GetWeaponClassName() + player.GetMainWeapons()[1].GetWeaponClassName() + player.GetMainWeapons()[2].GetWeaponClassName()
    string offhand = player.GetOffhandWeapons()[0].GetWeaponClassName() + player.GetOffhandWeapons()[1].GetWeaponClassName() + player.GetOffhandWeapons()[2].GetWeaponClassName()

    if (alreadySentTips.find(weapon+offhand+player.GetPlayerName()) == -1){
        provideLoadout(player)
        alreadySentTips.append(weapon+offhand+player.GetPlayerName())
    }
}

void function infoCommand( entity player, array < string > args ){

    if ( args.len() == 0 ){
        Chat_ServerPrivateMessage( player, ErrorColor("No argument!") + " Correct format is " + AccentOne("!changes <argument>"),false)
        Chat_ServerPrivateMessage( player, baseTextColor + "To see a summary of the changes to your loadout, use the word " + AccentOne("loadout") + " as the argument.",false)
        Chat_ServerPrivateMessage( player, baseTextColor + "Other valid summary arguments are " + AccentOne("ordnance") + ", " + AccentOne("tactical") + ", " + AccentOne("SMG") + ", etc.",false)
        Chat_ServerPrivateMessage( player, baseTextColor + "You can also enter the name of a specific gun/ability/etc. for full details on it.",false)
        Chat_ServerPrivateMessage( player, AccentTwo("Good to know: ") + goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )],false)
        Chat_ServerPrivateMessage( player, AccentTwo("Rebalance version: ") + AccentOne(REBALANCE_VERSION), false)
        return
    }

    string arg = ""
    foreach(string part in args){
        arg += part
    }

    if ( arg.find("load") != null ){
        provideLoadout( player )
        return
    }

    if ( arg.find("ordnan") != null || arg.find("tactic") != null || arg.find("gren") != null || arg.find("smg") != null || arg.find("lmg") != null || arg.find("assault") != null || arg == "ar" || arg == "ars" || arg.find("snipe") != null || arg.find("pisto") != null || arg.find("shot") != null || arg.find("sidearm") != null || arg.find("anti") != null ){
        provideTypeSummary( player, arg )
        return
    }

    provideItem( player, arg )
}


void function provideLoadout(entity player){
    array <int> itemIndex = []

    if ( !IsValid(player) || !IsAlive(player) || player.IsTitan() || player.GetMainWeapons().len() != 3 || player.GetOffhandWeapons().len() != 3 ) {
        Chat_ServerPrivateMessage( player, ErrorColor("Unable to get your loadout!") + "Are you dead or in a titan?", false)
        return
    }

    for(int i = 0; i < changeData.len(); i++){
        if( player.GetMainWeapons()[0].GetWeaponClassName().find( changeData[i][id] ) ){
            itemIndex = [i]
        }
    }
    for(int i = 0; i < changeData.len(); i++){
        if( player.GetMainWeapons()[1].GetWeaponClassName().find( changeData[i][id] ) ){
            itemIndex.append(i)
        }
    }
    for(int i = 0; i < changeData.len(); i++){
        if( player.GetMainWeapons()[2].GetWeaponClassName().find( changeData[i][id] ) ){
            itemIndex.append(i)
        }
    }
    for(int i = 0; i < changeData.len(); i++){
        if( player.GetOffhandWeapons()[0].GetWeaponClassName().find( changeData[i][id] ) ){
            itemIndex.append(i)
        }
    }
    for(int i = 0; i < changeData.len(); i++){
        if( player.GetOffhandWeapons()[1].GetWeaponClassName().find( changeData[i][id] ) ){
            itemIndex.append(i)
        }
    }

    Chat_ServerPrivateMessage( player, AccentTwo("Summary of changes to your current loadout:") ,false )
    foreach(int i in itemIndex){
        Chat_ServerPrivateMessage( player, changeData[i][summary] ,false )
    }
    Chat_ServerPrivateMessage( player, AccentTwo("Good to know: ") +  goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )],false)
}

void function provideTypeSummary(entity player, string arg){
    string message = ""
    string selectedType = ""
    array <int> itemIndex = []

    if ( arg.find("ordnan") != null ){
        message = AccentTwo("Displaying summary of changes to Ordnance:")
        selectedType = "ordnance"
        print("thisran 7")
    }
    if ( arg.find("tactic") != null ){
        message = AccentTwo("Displaying summary of changes to Tacticals:")
        selectedType = "tactical"
    }
    if ( arg.find("gren") != null ){
        message = AccentTwo("Displaying summary of changes to Grenades:")
        selectedType = "grenadier"
    }
    if ( arg.find("smg") != null ){
        message = AccentTwo("Displaying summary of changes to SMGs:")
        selectedType = "smg"
    }
    if ( arg.find("lmg") != null ){
        message = AccentTwo("Displaying summary of changes to LMGs:")
        selectedType = "lmg"
    }
    if ( arg.find("assault") != null ){
        message = AccentTwo("Displaying summary of changes to Assault Rifles:")
        selectedType = "ar"
    }
    if ( arg.find("ar") != null ){
        message = AccentTwo("Displaying summary of changes to Assault Rifles:")
        selectedType = "ar"
    }
    if ( arg.find("snipe") != null ){
        message = AccentTwo("Displaying summary of changes to Snipers:")
        selectedType = "sniper"
    }
    if ( arg.find("pisto") != null ){
        message = AccentTwo("Displaying summary of changes to Pistols:")
        selectedType = "pistol"
    }
    if ( arg.find("shot") != null ){
        message = AccentTwo("Displaying summary of changes to Shotguns:")
        selectedType = "shotgun"
    }
    if ( arg.find("sidearm") != null ){
        message = AccentTwo("Displaying summary of changes to Sidearms:")
        selectedType = "sidearm"
    }
    if ( arg.find("anti") != null ){
        message = AccentTwo("Displaying summary of Anti-Titan weapon changes:")
        selectedType = "antititan"
    }

    for(int i = 0; i < changeData.len(); i++){
        if( changeData[i][category].find(selectedType) != null ){
            itemIndex.append(i)
        }
    }

    Chat_ServerPrivateMessage( player, message ,false )
    foreach(int i in itemIndex){
        Chat_ServerPrivateMessage( player, changeData[i][summary] ,false )
    }
}

void function provideItem(entity player, string arg){
    int itemIndex = -1

    for(int i = 0; i < changeData.len(); i++){
        array <string> term = split(changeData[i][name], " ")
        string terms = ""
        foreach(string part in term){
            terms += part
        }
        if( terms.tolower().find(arg) != null ){
            itemIndex = i
        }
    }

    if(itemIndex != -1){
        Chat_ServerPrivateMessage( player, AccentTwo(changeData[itemIndex][name] + ":") ,false)
        foreach(string message in split(changeData[itemIndex][details], "\n" )){
            Chat_ServerPrivateMessage( player, baseTextColor + message ,false)
        }
    }
    else
        Chat_ServerPrivateMessage( player, ErrorColor("No match for that argument!"), false)
}
