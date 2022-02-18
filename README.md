# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore
## mod-guild-zone-system
### This is a module for [AzerothCore](http://www.azerothcore.org)
- Latest build status with azerothcore: [![Build Status](https://github.com/azerothcore/mod-guild-zone-system/workflows/core-build/badge.svg?branch=master&event=push)](https://github.com/azerothcore/mod-guild-zone-system)

### Features:
- Allows Guild Masters to Purchase/Sell Zones.
- Once purchased, Guild Masters and Guild members can port to your designated Guild House location set for that Zone.


### This module currently requires:
- AzerothCore v1.0.1+


### How to install
1. Simply place the module under the `modules` folder of your AzerothCore source folder.
2. Re-run cmake and launch a clean build of AzerothCore
3. Navigate to `modules`, apply the SQL files in the correct databases.


### Usage
- Spawn NPC ID 55005 `.npc a 55005`
- Create a guild `.guild create MyCharacter "MyGuild"`
- Talk to the NPC


### Uninstall

To remove the SQL, use these queries in the `world` database:
```SQL
-- The example of the creature --
DELETE FROM `creature_template` WHERE entry=55005;

-- All creatures for guild houses --
DELETE FROM `creature` WHERE id1=55005;

DROP TABLE `guildhouses`;
```


### Credits
* Bloodication: Original author *probably* 
* Poszer: Port into a module 

AzerothCore: [repository](https://github.com/azerothcore) - [website](http://azerothcore.org/) - [discord chat community](https://discord.gg/PaqQRkd)
<!-- - Latest build status with azerothcore: [![Build Status](https://travis-ci.org/azerothcore/mod-guildhouse-system.svg?branch=master)](https://travis-ci.org/azerothcore/mod-guildhouse-system) -->
