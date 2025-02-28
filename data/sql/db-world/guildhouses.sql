-- The example of the creature --
DELETE FROM `creature_template` WHERE `entry`=55005;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(55005, 0, 0, 0, 0, 0, 'Guild House', 'AzerothCore', NULL, 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 20, 1, 0, 0, 1, 2000, 2000, 1, 1, 2, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 50, 50, 1, 1, 0, 0, 1, 0, 0, 0, 'guildmaster', 12340);

-- NPC MODEL
DELETE FROM `creature_template_model` WHERE `CreatureID` = 55005;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(55005, 0, 1525, 1, 1, 0);

-- All creatures for guild houses --
DELETE FROM `creature` WHERE id1=55005;
INSERT INTO `creature` (`guid`, `id1`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
(3110568, 55005, 1, 0, 0, 1, 1, 0, 16227.5, 16399.3, -64.3789, 4.68485, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3110802, 55005, 1, 0, 0, 1, 1, 0, 16231.4, 16397.4, -64.3789, 0.182949, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111008, 55005, 1, 0, 0, 1, 1, 0, 16217.2, 16266, 13.3868, 0, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111369, 55005, 1, 0, 0, 1, 1, 0, -10710.8, 2482.61, 7.9216, 3.45575, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111370, 55005, 0, 0, 0, 1, 1, 0, -8326.23, -343, 146.104, 0, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111371, 55005, 1, 0, 0, 1, 1, 0, 7367.73, -1560.1, 163.497, 2.40331, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111372, 55005, 0, 0, 0, 1, 1, 0, -4154.14, -1398.78, 198.509, 0.239546, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111375, 55005, 0, 0, 0, 1, 1, 0, -1853.08, -4251.12, 2.13495, 1.04065, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111382, 55005, 1, 0, 0, 1, 1, 0, -714.204, -1068.29, 178.94, 3.41648, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111383, 55005, 0, 0, 0, 1, 1, 0, -195.34, 1664.51, 79.7641, 2.72533, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111384, 55005, 0, 0, 0, 1, 1, 0, -6368, 1249.18, 9.12078, 2.23838, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111385, 55005, 0, 0, 0, 1, 1, 0, -8639.95, 577.091, 95.6907, 1.50404, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111386, 55005, 0, 0, 0, 1, 1, 0, -4843.59, -1063.84, 502.191, 4.69275, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111387, 55005, 0, 0, 0, 1, 1, 0, -4856.45, -1652.01, 504.782, 3.48324, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111388, 55005, 37, 0, 0, 1, 1, 0, 1146, -165, 313, 0, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111389, 55005, 0, 0, 0, 1, 1, 0, 4306, -2758.39, 16.6279, 3.6364, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111390, 55005, 37, 0, 0, 1, 1, 0, -124.306, 857.701, 298.467, 5.6313, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111396, 55005, 0, 0, 0, 1, 1, 0, -6159.4, -786.371, 422.552, 3.49502, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111397, 55005, 0, 0, 0, 1, 1, 0, -11789.9, -1641.98, 54.6441, 1.63755, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111400, 55005, 1, 0, 0, 1, 1, 0, -11797.4, -4765.58, 5.9446, 2.12058, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111401, 55005, 0, 0, 0, 1, 1, 0, -9290.91, 673.573, 131.835, 3.46282, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111402, 55005, 0, 0, 0, 1, 1, 0, 3414, -3380, 142.2, 0, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111403, 55005, 1, 0, 0, 1, 1, 0, 4657.38, -3773.25, 943.11, 2.93346, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111404, 55005, 1, 0, 0, 1, 1, 0, 2196.57, -4750.06, 55.1379, 3.85238, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111405, 55005, 1, 0, 0, 1, 1, 0, 1951.51, 1530.48, 247.288, 0, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111406, 55005, 1, 0, 0, 1, 1, 0, 2813.66, 2248.55, 215.525, 0, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111407, 55005, 1, 0, 0, 1, 1, 0, 9760.66, -34.3014, 11.9847, 4.01731, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111408, 55005, 0, 0, 0, 1, 1, 0, -3855, -3479, 578.951, 0, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111414, 55005, 0, 0, 0, 1, 1, 0, -5342.03, -2526.84, 485.299, 3.61283, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111415, 55005, 0, 0, 0, 1, 1, 0, -12855.5, -1392.8, 114.529, 3.60498, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111416, 55005, 0, 0, 0, 1, 1, 0, -11075.9, -1955.99, 38.772, 4.86555, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111417, 55005, 0, 0, 0, 1, 1, 0, -11069.5, -1795.7, 53.73, 3.19264, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111421, 55005, 0, 0, 0, 1, 1, 0, 1686.35, 287.029, -45.4511, 3.6089, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111424, 55005, 0, 0, 0, 1, 1, 0, -8517.9, 600.176, 101.399, 3.89558, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111425, 55005, 0, 0, 0, 1, 1, 0, -5930.56, 459.703, 509.272, 3.87987, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111426, 55005, 530, 0, 0, 1, 1, 0, -921.549, 7094.74, 170.429, 0.48302, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111427, 55005, 530, 0, 0, 1, 1, 0, -2145.69, 9141.49, 138.485, 0.20813, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111428, 55005, 530, 0, 0, 1, 1, 0, -469.856, 7465.62, 182.047, 3.53037, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0),
(3111429, 55005, 530, 0, 0, 1, 1, 0, 2383.12, 3199.98, 152.673, 5.20327, 300, 0, 0, 213700, 199700, 0, 0, 0, 0, '', 0);

DROP TABLE IF EXISTS `guildhouses`;
CREATE TABLE IF NOT EXISTS `guildhouses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guildid` bigint NOT NULL DEFAULT '0',
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `map` int NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=UTF8MB4  COMMENT='Guild House System';

INSERT INTO `guildhouses` (`id`, `guildid`, `x`, `y`, `z`, `map`, `comment`) VALUES
	(1, 0, 16222, 16266, 14.2, 1, 'GM Island'),
	(2, 0, -10711, 2483, 8, 1, 'Tauren village at Veiled Sea (Silithus)'),
	(3, 0, -8323, -343, 146, 0, 'Fishing outside an Northshire Abbey (Elwynn Forest'),
	(4, 0, 7368, -1560, 163, 1, 'Troll Village in mountains (Darkshore)'),
	(5, 0, -4151, -1400, 198, 0, 'Dwarven village outside Ironforge (Wetlands)'),
	(6, 0, -1840, -4233, 2.14, 0, 'Dwarven village (Arathi Highlands, Forbidding Sea)'),
	(8, 0, -723, -1076, 179, 1, 'Tauren camp (Mulgore, Red Rock)'),
	(9, 0, -206, 1666, 80, 0, 'Shadowfang Keep an outside instance (Silverpine Forest)'),
	(10, 0, -6374, 1262, 7, 0, 'Harbor house outside Stormwind (Elwynn Forest)'),
	(11, 0, -8640, 580, 96, 0, 'Empty jail between canals (Stormwind)'),
	(12, 0, -4844, -1066, 502, 0, 'Old Ironforge'),
	(13, 0, -4863, -1658, 503.5, 0, 'Ironforge Airport'),
	(14, 0, 1146, -165, 313, 37, 'Azshara Crater instance (Alliance entrance)'),
	(15, 0, -123, 858, 298, 37, 'Azshara Crater instance (Horde entrance)'),
	(16, 0, 4303, -2760, 16.8, 0, 'Quel\'Thalas Tower'),
	(17, 0, -6161, -790, 423, 0, 'Crashed gnome airplane (between Dun Morogh and Searing Gorge)'),
	(18, 0, -11790, -1640, 54.7, 0, 'Zul\'Gurub an outside instance (Stranglethorn Vale)'),
	(19, 0, -11805, -4754, 6, 1, 'Goblin village (Tanaris, South Seas)'),
	(20, 0, -9296, 670, 132, 0, 'Villains camp outside an Stormwind (Elwynn Forest)'),
	(21, 0, 3414, -3380, 142.2, 0, 'Stratholm an outside instance'),
	(22, 0, 4654, -3772, 944, 1, 'Kalimdor Hyjal (Aka World Tree)'),
	(23, 0, 2176, -4766, 55, 1, 'The Ring of Valor (Aka. Orgrimmar Arena)'),
	(24, 0, 1951.512085, 1530.475586, 247.288147, 1, 'Stonetalon Logging Camp'),
	(25, 0, 2813.660645, 2248.552979, 215.524643, 1, 'Stonetalon Ruins'),
	(28, 0, 9725.27, -21.43, 20.03, 1, 'Teldrassil Furbold camp'),
	(29, 0, -3855, -3479, 579, 0, 'Wetlands mountain camp'),
	(30, 0, -5362, -2540, 485, 0, 'Ortell\'s Hideout'),
	(31, 0, -12865, -1396, 115, 0, 'Stranglethorn Secret Cave'),
	(32, 0, -11073, -1956, 39, 0, 'Karazhan Smiley'),
	(33, 0, -11084, -1801, 53, 0, 'Well of the Forgotten (Aka. Karazhan Crypt or Lower Karazhan)'),
	(34, 0, 1683.235474, 286.458801, -45.451775, 0, 'Undercity Top Tier'),
	(35, 0, -8521.3, 599.5, 101.399338, 0, 'Stormwind Cut-Throat Alley'),
	(36, 0, -5933, 452, 509, 0, 'Forgotten gnome camp'),
	(37, 0, -920.231323, 7096.489258, 170.35289, 530, 'Outland Nagrand : Newton\'s Remains'),
	(38, 0, -2140.501953, 9142.6875, 137.041855, 530, 'Outland Nagrand : Tomb'),
	(39, 0, -483.401794, 7461.944824, 186.120987, 530, 'Outland Nagrand: Challe\'s Home for Little Tykes'),
	(40, 0, 2387.753906, 3191.757324, 152.669388, 530, 'Outland Netherstorm: Nova\'s Shrine');
