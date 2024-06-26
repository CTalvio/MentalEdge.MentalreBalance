# MENTAL PilotreBalance

This is my humble attempt at creating a different, balanced, titanfall 2 meta. The goal has been to make each gun worth using without noticably increasing the quick and intense TTK of titanfall, instead giving each gun strenghts and weaknesses making none a jack of all trades. Making any one gun more equally effective when wielded with skill and situational awareness, and fun, always. Changes are extensive, and the mod can be used server side only. Though there are some small "glitches", none of it is game-breaking, or even very noticable. Feedback is extremely welcome, as I can't possible ever test my changes in truly all possible situations, nor be equally skilled with every gun.

If you'd like to avoid the client-side glitches, simply install the mod client-side, as well.

The server side only issues are caused by client/server conflicts with guns that have modified clip size (client can try to reload even when server considers gun full).

If you'd like to contribute your complaints, suggestions or praises you can join my discord at https://discord.gg/HpjEjKgCZY

### !changes command

The mod also includes a script that will allow players to use the !changes chat command to access the changelog for any gun, as well as get summaries of changes to their current loadout or a category (such as "assault rifles"). This requires FSU to work.

Get FSU here: [Fifty's Server Utilities](https://northstar.thunderstore.io/package/Fifty/Server_Utilities/)

You CAN now run the rebalance without FSU. You will not be able to use the !changes command, but contextual gun change info can still be enabled in mod.json.

#### Thank you

These peeps have contributed a ton to the rebalance by play testing, discussing, suggesting, and sometimes complaining about, changes. It would not have turned out as good as it is without them.

- Mauer-Läufer#4236
- Illuin
- Sain't
- TiclanRaider (Plazma52)


### Changelog

#### 1.3.3

- SMG changes
    - Slightly more nerfed across the board
- R101/102 changes
- Flatline changes
- P2016 changes
- R45 changes
- Gravity star changes
- Doubletake changes

previous versions at the bottom

## Full Changelist

### General

    Silencers
    - Damage penalty removed

    Health regen
    - Start delay 5s > 3.8s (buff)
    - Start delay when using fast regen 2.5s > 2.9s
    - Regen is 15% slower

### Tactical

    A-Wall
    - Deployment time reduced 15s > 3.5s
    - Wall health reduced 1000 > 600
    - Cooldown reduced 30s > 20s (buff)

    Phase
    - Cooldown increased 20s > 24s
    - Phase duration increased 2s > 4s (buff)
    - Phase can be ended up to 2.5s early (buff)
    - Early cancel can shorten cooldown by up to 6 seconds.

    Holopilot
    - Provides cloak for 1.8 seconds on decoy creation (buff)
    - Decoy copies owner health bar appearance (buff)
    - Decoy health increased 50 > 65 (buff)
    - Cooldown increased, 20 seconds per charge
    - Second charge cannot be used before cloak expires

    Stim
    - Heals 25hp on activation (buff)
    - Regen while stimming is 20% slower

### Ordnance

    Frag Grenade
    - Unchanged

    Arc Grenade
    - Activates quicker 0.75s > 0.2s (buff)
    - Damage reduced 40 > 20
    - Splash radius changed 75 > 150 / 350 > 350

    Gravity Star
    - Pull time reduced 2s > 1.33s

    Fire Star
    - Unchanged

    Electric Smoke
    - Damage increased 150 > 170 (buff)
    - Effective radius increased 50 > 100 / 210 > 230 (buff)

    Satchel
    - Larger splash radius 120 > 200 / 250 > 250 (buff)
    - Titan damage decreased 2200 > 1250

### Sidearms

    All
    -Silencer damage penalty removed

    P2016
    - Fire rate increased 8 > 9 (buff)
    - Damage reduced 4 hit > 5 hit / 30 > 24 / 20 > 20 / 15 > 15
    - Headshto mutliplier reduced 2 > 1.5

    R45
    - Damage reduced 20 > 16 / 13 > 10
    - Damage falloff increased 750 > 500 / 1000 > 660

    Wingman B3
    - Increased fire rate 2.6 > 2.9 (buff)
    - Increased spread decay (buff)

### Assault Rifles

    R101/R102
    - Damage changed 25 > 20 / 17 > 18
    - Falloff changed 1500 > 750 / 2000 > 1800
    - Inaccuracy fade increased 5 > 7 (buff)

    Hemlok
    - Clip size reduced 24 > 18 / 30 > 24
    - Damage increased 3 hit > 3 hit / 33 > 30 / 15 > 25 (buff)
    - Burst delay reduced 0.25s > 0.18s (buff)
    - Headshot multiplier increased 1.5 > 2.5 (buff)
    - Spread decay increased 4 > 5 (buff)

    G2
    - Damage reduced 40 > 40 / 35 > 30
    - Falloff changed 1500 > 1800 / 2000 > 2300 (buff)
    - Spread decay increased 4 > 5 (buff)

    Flatline
    - Damage changes 30 > 22 / 20 > 20 / 15 > 12
    - Clip size reduced 30 > 26 / 36 > 32
    - Hipfire accuracy reduced
    - ADS recoil given a small vertical component

### SMGs

    All
    - Damage falloff to all increased 1000 > 750 / 1500 > 1200
    - Recoil is now incurred on the first shot

    C.A.R
    - Clip size reduced 30 > 24 / 36 > 28
    - Damage reduced 4 hit > 6 hit / 25 > 17 / 13 > 10 / 10 > 8
    - Reload time increased by 20%
    - Headshot multiplier increased 1.5 > 1.9 (buff)

    Alternator
    - Clip size reduced 20 > 18 / 25 > 22
    - Damage reduced 3 hit > 4 hit / 35 > 26 / 18 > 16 / 14 > 12
    - Overrall recoil increased by ≈10%
    - ADS recoil reduced to closer match hipfire (buff)

    Volt
    - Clip size reduced 33 > 30 / 40 > 36
    - Damage reduced 4 hit > 5 hit / 25 > 21 / 15 > 14 / 12 > 10
    - Recoil reduced by ≈8% (buff)

    R-97
    - Damage reduced 4 hit > 7 hit / 20 > 15 / 12 > 10 / 10 > 8
    - Recoil increased by ≈15%
    - Reload time increased by 10%

### LMGs

    Spitfire
    - Damage reduced 3 hit > 4 hit / 35 > 30 / 25 > 20 / 20 > 12
    - Damage falloff moved up 1800 > 1500 / 2000 > 1800
    - ADS inaccuracy introduced

    L-STAR
    - Overheats a bit more easily
    - Cooling speed increased (buff)
    - Falloff changed 1000 > 800 / 2000 > 1300

    Devotion
    - Damage changed 25 > 30 / 20 > 16 / 15 > 8
    - Damage falloff moved up 1500 > 1000 / 1800 > 1500
    - Spin up time reduced 1.75s > 1.5s (buff)

### Shotguns

    EVA-8
    - Damage reduced 200 > 145 / 10 > 10
    - Max range increased 750 > 900 (buff)
    - Added angle based damage boost/penalty

    Mastiff
    - Unchanged

### Grenadier

    SMR
    - Unchanged

    EPG
    - Splash damage reduced 90 > 80
    - Splash damage radius reduced 150 > 130

    Softball
    - Unchanged

    Cold War
    - Damage increased 30 > 40 (buff)
    - Charge time reduced 0.5s > 0.3s (buff)
    - Burst delay increased 0.5s > 0.8s
    - Splash damage radius reduced 96 > 40 / 150 > 130
    - Reload time reduced by 20% (buff)

### Snipers

    Kraber
    - Unchanged

    Double Take
    - Rate of fire reduced 2.0 > 1.7
    - Clip size reduced 6 > 5 / 8 > 7
    - Damage increased 4 hit > 3 hit / 30 > 30 / 30 > 40 (buff)
    - Damage falloff inverted 4500 > 1000 / 15000 > 1200
    - Hipfire accuracy slightly increased by ≈25% (buff)
    - Reload time increased by 15%

    DMR
    - Rate of fire reduced 3.0 > 2.0

### Pistols

    All
    - Silencer damage penalty removed

    Wingman Elite
    - Fire rate increased 2.6 > 3.5 (buff)
    - Rapid hipfire incurrs a small amount of spread

    Mozambique
    - Fire rate decreased 3.0 > 2.8
    - Damage increased 4 hit > 3 hit / 30 > 34 / 25 > 23 (buff)
    - Damage falloff moved up 750 > 175
    - Reduced reload time by 15% (buff)

### Anti-Titan

    Charge Rifle
    - Ammo stash reduced 20 > 10 / 25 > 14
    - Titan damage increased 1025 > 1425 / 725 > 1125 (buff)
    - Damage falloff moved up 4800 > 1500 / 5300 > 2200
    - Rate of fire reduced 1 > 0.6
    - Titan weak spot crits introduced (1.25 multiplier) (buff)

    MGL
    - Pilot damage increased 30 > 35 (buff)
    - Splash radius increased 50 > 80 / 100 > 160

    Thunderbolt
    - Ammo stash increased 6 > 8 / 9 > 12 (buff)
    - Reload time increased by 20%
    - Pilot damage increased 70 > 120  (buff)

    Archer
    - Unchanged

### Previous versions

#### 1.3.2

- General attempt at making the rebalance less annoying to play
    - G2 changes
    - Spitfire changes
    - Wingman changes
    - Hemlok changes
    - Satchel changes
    - L-Star changes

#### 1.3.1

- Bugfix

#### 1.3.0

- Updated for FSU2!
- Now also works without FSU, without the !changes command
- No rebalance changes

#### 1.2.4

- Fixed weapon match not working when spaces are used
- Re-added contextual loadout tips
- Eva-8 changes
- L-STAR changes
- Charge Rifle changes

#### 1.2.3

- Mozambique changes
- Doubletake changes
- !changes now provides rebalance version number
- Overarching chat color theme support using MentalEdge.theme (included)

#### 1.2.2

- Mozambique changes
- R101/102 changes
- Hemlok changes
- FSU is now "required" to use the new !changes command to access the changelog database in-game
- If you do not wish to use FSU, swap out guntips.nut for guntipsold.nut

#### 1.2.1

- Fixed crash that could occur when activating stim (while dead, somehow)

#### 1.2.0

- Phase shift changes
- Stim changes
- Holopilot changes
- R101/102 changes
- EPG changes
- Health regen is now balanced
- FSU support for a !changes info command

#### 1.1.10

- Eva-8 changes
- Double take changes
- Electric smoke changes
- R45 changes
- Arc Grenade changes
- R101/102 changes
- Hemlok changes

#### 1.1.7

- Charge Rifle changes
- Fixed Double Take damage values being flipped
- Fixed silencer bug on both wingmen

#### 1.1.6

- Fixed yet another crash bug

#### 1.1.5

- Silencers no longer have a damage penalty
- Hemlok changes
- A-Wall changes

#### 1.1.4

- Fixed crash that happens if tips tries to read weapons when a player is in a titan

#### 1.1.3

- Now modifies A-Wall and Phase
- Now provides random good-to-know changes about guns other than those a player is using
- Fixed two ways the mod would crash
- The contextual/random tips can now be disabled/enabled with a convar

#### 1.1.2

- Bugfix

#### 1.1.1

- Now modifies ordnance
- Eva-8 changes
- MGL changes

#### 1.1.0

- The mod now contextually tells players about changes to the particular guns they are using
- Fixed folder layout
