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

#if FSCC_ENABLED
	FSCC_CommandStruct command
	command.m_UsageUser = "changes <loadout/item/category>"
	command.m_Description = "View rebalance changes."
	command.m_Group = "REBALANCE"
	command.m_Abbreviations = ["rebalance","nerfs","nerf","buff","buffs","changelog","change"]
	command.Callback = infoCommand
	FSCC_RegisterCommand( "changes", command )
#endif

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

void function provideLoadout(entity player){
    array <int> itemIndex = []

    if ( !IsValid(player) || !IsAlive(player) || player.IsTitan() || player.GetMainWeapons().len() != 3 || !(player.GetOffhandWeapons().len()==4 || player.GetOffhandWeapons().len()==3) ){
    #if FSCC_ENABLED
        FSU_PrivateChatMessage( player, "%EUnable to get your loadout! %TAre you dead or in a titan?")
    #endif
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

#if FSCC_ENABLED
    FSU_PrivateChatMessage( player, "%HSummary of changes to your current loadout:")
    foreach(int i in itemIndex){
        FSU_PrivateChatMessage( player, "    " + changeData[i][summary])
    }
    FSU_PrivateChatMessage( player, "%HGood to know: %T" + goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )])
#else
    Chat_ServerPrivateMessage( player, "\x1b[38;5;153mSummary of changes to your current loadout:", false)
    foreach(int i in itemIndex){
        Chat_ServerPrivateMessage( player, "    " + changeData[i][summary], false)
    }
    Chat_ServerPrivateMessage( player, "\x1b[38;5;153mGood to know: \x1b[0m" + goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )], false)
#endif
}

#if FSCC_ENABLED
void function infoCommand( entity player, array < string > args ){

    if ( args.len() == 0 ){
        FSU_PrivateChatMessage( player, "%ENo argument! %TCorrect format is %H!changes <argument>")
        FSU_PrivateChatMessage( player, "    To see a summary of the changes to your loadout, use the word %Hloadout%T as the argument.")
        FSU_PrivateChatMessage( player, "    Other valid summary arguments are %Hordnance%T, %Htactical%T, %HSMG%T, etc.")
        FSU_PrivateChatMessage( player, "    You can also enter the name of a specific gun/ability/etc. for full details on it.")
        FSU_PrivateChatMessage( player, "%HGood to know: %T" + goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )])
        FSU_PrivateChatMessage( player, "%HRebalance version: %F" + REBALANCE_VERSION)
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

void function provideTypeSummary(entity player, string arg){
    string message = ""
    string selectedType = ""
    array <int> itemIndex = []

    if ( arg.find("ordnan") != null ){
        message = "Displaying summary of changes to Ordnance:"
        selectedType = "ordnance"
    }
    if ( arg.find("tactic") != null ){
        message = "Displaying summary of changes to Tacticals:"
        selectedType = "tactical"
    }
    if ( arg.find("gren") != null ){
        message = "Displaying summary of changes to Grenades:"
        selectedType = "grenadier"
    }
    if ( arg.find("smg") != null ){
        message = "Displaying summary of changes to SMGs:"
        selectedType = "smg"
    }
    if ( arg.find("lmg") != null ){
        message = "Displaying summary of changes to LMGs:"
        selectedType = "lmg"
    }
    if ( arg.find("assault") != null ){
        message = "Displaying summary of changes to Assault Rifles:"
        selectedType = "ar"
    }
    if ( arg.find("ar") != null ){
        message = "Displaying summary of changes to Assault Rifles:"
        selectedType = "ar"
    }
    if ( arg.find("snipe") != null ){
        message = "Displaying summary of changes to Snipers:"
        selectedType = "sniper"
    }
    if ( arg.find("pisto") != null ){
        message = "Displaying summary of changes to Pistols:"
        selectedType = "pistol"
    }
    if ( arg.find("shot") != null ){
        message = "Displaying summary of changes to Shotguns:"
        selectedType = "shotgun"
    }
    if ( arg.find("sidearm") != null ){
        message = "Displaying summary of changes to Sidearms:"
        selectedType = "sidearm"
    }
    if ( arg.find("anti") != null ){
        message = "Displaying summary of Anti-Titan weapon changes:"
        selectedType = "antititan"
    }

    for(int i = 0; i < changeData.len(); i++){
        if( changeData[i][category].find(selectedType) != null ){
            itemIndex.append(i)
        }
    }

    FSU_PrivateChatMessage( player, "%H" + message )
    foreach(int i in itemIndex){
        FSU_PrivateChatMessage( player, "    " + changeData[i][summary] )
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
        FSU_PrivateChatMessage( player, "%H" + changeData[itemIndex][name] + ":" )
        foreach(string message in split(changeData[itemIndex][details], "\n" )){
            FSU_PrivateChatMessage( player, "    " + message )
        }
    }
    else
        FSU_PrivateChatMessage( player, "%ENo match for that argument!")
}
#endif
