
-- Mimiron Tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

-- Mimiron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_mimiron' WHERE `entry` = 33350;

-- Leviathan MKII
UPDATE `creature_template` SET `vehicleid` = 370, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk' WHERE `entry` = 33432;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34106;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk_turret' WHERE `entry` = 34071;
DELETE FROM vehicle_template_accessory WHERE entry = 33432;
INSERT INTO vehicle_template_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret', 8, 0);
UPDATE creature_template SET ScriptName = 'npc_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33432,33651);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(33432,46598,0,0,0,1,0,0,0), -- Leviatan MKII - Ride Vehicle Hardcoded
(33651,46598,0,0,0,1,0,0,0); -- VX 001 - Ride Vehicle Hardcoded

-- VX-001
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `vehicleid` = 371, `ScriptName` = 'boss_vx_001' WHERE `entry` = 33651;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34108;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 34050;
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34211;
UPDATE `creature_template` SET `ScriptName` = 'npc_rocket_strike' WHERE `entry` = 34047;

-- Aerial Command Unit
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_aerial_unit', `vehicleid` = 372 WHERE `entry` = 33670;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34109;
UPDATE `creature_template` SET `ScriptName` = 'npc_magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'npc_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148, `ScriptName` = 'npc_emergency_bot' WHERE `entry` = 34147;

-- HardMode
UPDATE `gameobject_template` SET `flags` = 32, `ScriptName` = 'go_not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `difficulty_entry_1` = 34361, `ScriptName` = 'npc_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'npc_mimiron_flame_trigger' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_flame_spread' WHERE `entry` = 34121;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_bomb_bot' WHERE `entry` = 33836;

-- CleanUp
DELETE FROM creature WHERE id IN (34071, 33856);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 34143;

-- Leviathan Hitpoints
UPDATE `creature_template` SET `exp`=0 WHERE `entry` IN (33432,34071,34106);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63414;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,63414,18,1,33651);

DELETE FROM `spell_script_names` WHERE `spell_id`=63382;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63382, 'spell_rapid_burst');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (64570,65192,64626,65333,64619);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64570,18,1,34121),
(13,64570,18,1,34363),
(13,65192,18,1,34121),
(13,65192,18,1,34363),
(13,64626,18,1,34121),
(13,64626,18,1,34363),
(13,65333,18,1,34121),
(13,65333,18,1,34363),
(13,64619,18,1,34121),
(13,64619,18,1,34363);

UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (34149,34361);

-- Junk Bot
UPDATE `creature_template` SET `difficulty_entry_1`=34114 WHERE `entry`=33855;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `dmg_multiplier`=15 WHERE `entry`=34114;

-- not-so-friendly fire + rocket strike targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (63041,65040,65346);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,63041,18,1,33836),
(13,63041,18,1,34362),
(13,63041,18,1,33855),
(13,63041,18,1,34057),
(13,63041,18,1,34147),
(13,63041,18,1,0),
-- only players
(13,65040,18,1,0),
(13,65346,18,1,0);

-- not-so-friendly fire
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10405,10406) AND `type`=18;

-- firefighter
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10450,10463);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10450,10463) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10450,11,0,0, 'achievement_firefighter'),
(10463,11,0,0, 'achievement_firefighter');
DELETE FROM `creature_addon` WHERE `guid` = 137619;
DELETE FROM `creature_addon` WHERE `guid` between 137621 and 137629;


-- Thorim
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `speed_walk` = 1.66667, `baseattacktime` = 1500, `equipment_id` = 1844, `mechanic_immune_mask` = 650854239 WHERE `entry` = 33147;
DELETE FROM `creature` WHERE `id`=32865;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(32865, 603, 3, 1, 28977, 0, 2134.967, -298.962, 438.331, 1.57, 604800, 0, 0, 4183500, 425800, 1);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

-- Charge Orb
DELETE FROM conditions WHERE SourceEntry = 62016;
INSERT INTO `conditions` VALUES
('13','0','62016','0','18','1','33378','0','0','',NULL);
UPDATE `creature_template` SET `unit_flags` = 33685508 WHERE `entry` = 33378;

-- Gate
DELETE FROM `gameobject_scripts` WHERE `id`=55194;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(55194, 0, 11, 34155, 15, '0', 0, 0, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','35','48','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0');
UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;

-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32885, 32883, 32908, 32907, 32882, 33110, 32886, 32879, 32892, 33140, 33141, 33378, 32874, 32875)
OR guid IN (136694, 136695, 136666, 136706, 136754, 136653, 136756, 136757, 136725, 136718);

-- Pre adds
UPDATE `creature_template` SET `equipment_id` = 1849, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 33153;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32883;
UPDATE `creature_template` SET `equipment_id` = 1847 WHERE `entry` = 33152;
UPDATE `creature_template` SET `equipment_id` = 1850, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32908;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 33151;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32907;
UPDATE `creature_template` SET `equipment_id` = 1852 WHERE `entry` = 33150;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32882;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32886;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);

-- Thorim Mini bosses
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `ScriptName`='npc_runic_smash' WHERE `entry`=33140;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_ancient_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_sif' WHERE `entry` = 33196;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875, 33110);
DELETE FROM `creature_addon` WHERE `guid`IN (136059, 136816);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('136059','0','0','0','1','0','40775 0'),
('136816','0','0','0','1','0','40775 0');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62942,62466,62976,64098);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13, 62942, 18, 1, 33110),
(13, 62942, 18, 1, 32874),
(13, 62942, 18, 1, 32872),
(13, 62942, 18, 1, 32875),
(13, 62466, 18, 1, 32780),
(13, 64098, 18, 1, 32865),
(13, 62976, 18, 1, 34055);

UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35 WHERE `entry`=34055;

-- thorim - lightning orb (temporary)
UPDATE `creature_template` SET `speed_run`=9.6, `dmg_multiplier`=200, `baseattacktime`=1000, `Health_mod`=100 WHERE `entry`=33138;

DELETE FROM `spell_script_names` WHERE `spell_id`=62042;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62042, 'spell_stormhammer_targeting');

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32865;
UPDATE `creature_template` SET `dmg_multiplier`=40 WHERE `entry`=33147;
UPDATE `creature` SET `position_z`=440.331 WHERE `id`=32865;
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
UPDATE `creature` SET `MovementType`=0 WHERE `guid`=10201240;
UPDATE `creature` SET `MovementType`=0 WHERE `guid`=10201241;
UPDATE `creature_addon` SET `auras`='40775' WHERE `guid`=136816;
UPDATE `creature_addon` SET `auras`='40775' WHERE `guid`=136059;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10304,10313) AND `type` IN (11,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10304,11,0,0, 'achievement_who_needs_bloodlust'),
(10313,11,0,0, 'achievement_who_needs_bloodlust');

UPDATE `creature_template` SET `equipment_id` = 28053, `RegenHealth` = 0  WHERE `entry` = 32871; 
DELETE FROM `creature_equip_template` WHERE (`entry`= 28053);
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES (28053, 45985, 45985, 0);

UPDATE `creature_template` SET `ScriptName` = 'mob_algalon_asteroid_trigger' WHERE `entry` = 33104;
UPDATE `creature_template` SET `ScriptName` = 'mob_living_constellation' WHERE `entry` = 33052;
UPDATE `creature_template` SET `ScriptName` = 'mob_collapsing_star' WHERE `entry` = 32955;
UPDATE `creature_template` SET `ScriptName` = 'mob_black_hole' WHERE `entry` = 32953;
UPDATE `creature_template` SET `ScriptName` = 'mob_dark_matter_algalon' WHERE `entry` = 33089;

UPDATE `creature_template` SET `equipment_id` = 1857, `ScriptName` = 'mob_brann_algalon' WHERE `entry` = 34064;

UPDATE `gameobject_template` SET `ScriptName` = 'go_celestial_console' WHERE `entry` = 194628;
UPDATE `gameobject_template` SET `flags` = 34 WHERE `entry` = 194628;

DELETE FROM `creature` WHERE `id`=32871; 
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(255916, 32871, 603, 1, 1, 0, 28053, 1632.11, -303.365, 432.321, 1.57079, 300, 0, 0, 8367000, 0, 0, 0, 0, 0);

DELETE FROM `gameobject` WHERE `id`=194628; 
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(152446, 194628, 603, 1, 1, 1646.28, -175.381, 427.257, 1.57079, 0, 0, 0.723219, 0.690619, 300, 0, 1);

DELETE FROM `conditions` WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN (62304,64996,64597,62168);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
( '13','0','62304','0','18','1','33104','0','0','','Algalon Cosmic Smash Missle'), -- 10 man
( '13','0','64597','0','18','1','33104','0','0','','Algalon Cosmic Smash Missle'), -- 25 man
( '13','0','64996','0','18','1','34246','0','0','','Algalon Reorigination'), -- visual
( '13','0','62168','0','18','1','0','0','0','','Black Hole Shift'); -- Players Only


DELETE FROM `spell_script_names` WHERE `spell_id` IN(64412,62293,62295,62311,64596,64443,64584,62168,62301,64598,64487,65312);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES 
( '64412','spell_algalon_phase_punch'),
( '62295','spell_algalon_summon_asteroid_stalkers'),
( '62293','spell_algalon_summon_asteroid_stalkers'),
( '62311','spell_algalon_cosmic_smash_damage'),
( '64596','spell_algalon_cosmic_smash_damage'),
( '64443','spell_algalon_big_bang'),
( '64584','spell_algalon_big_bang'),
( '62168','spell_algalon_black_hole'),
( '62301','spell_algalon_cosmic_smash_initial'), 
( '64598','spell_algalon_cosmic_smash_initial'),
( '64487','spell_algalon_ascend_to_the_heavens');


DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN(62168);
INSERT INTO `spell_linked_spell`(`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES ( '62168','62169','2','Algalon - Black Hole Damage');

DELETE FROM `creature_text` WHERE `entry` IN(32871,34064);

insert into `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) values
('32871','0','0','Your actions are illogical. All possible results for this encounter have been calculated. The Pantheon will receive the Observer''s message regardless of outcome.','14','0','100','1','0','15386','Algalon Aggro'),
('32871','1','0','Loss of life, unavoidable.','14','0','100','0','0','15837','Algalon JustKilled1'),
('32871','1','1','I do what I must.','14','0','100','0','0','15838','Algalon JustKilled2'),
('32871','2','0','See your world through my eyes: A universe so vast as to be immeasurable - incomprehensible even to your greatest minds.','14','0','100','1','0','15390','Algalon FirstEngaged'),
('32871','3','0','The stars come to my aid.','14','0','100','0','0','15392','Algalon SummonCollapsingStars'),
('32871','4','0','I have seen worlds bathed in the Makers'' flames. Their denizens fading without so much as a whimper. Entire planetary systems born and raised in the time that it takes your mortal hearts to beat once. Yet all throughout, my own heart, devoid of emotion... of empathy. I... have... felt... NOTHING! A million, million lives wasted. Had they all held within them your tenacity? Had they all loved life as you do?','12','0','100','0','0','15393','Algalon Death1'),
('32871','6','0','Perhaps it is your imperfection that which grants you free will. That allows you to persevere against all cosmically calculated odds. You prevailed where the Titans'' own perfect creations have failed.','12','0','100','1','0','15401','Algalon Death2'),
('32871','7','0','I''ve rearranged the reply code. Your planet will be spared. I cannot be certain of my own calculations anymore.','12','0','100','1','0','15402','Algalon Death3'),
('32871','8','0','I lack the strength to transmit the signal. You must hurry. Find a place of power close to the skies.','12','0','100','1','0','15403','Algalon Death4'),
('32871','9','0','Do not worry about my fate Bronzen. If the signal is not transmitted in time re-origination will proceed regardless. Save. Your. World.','12','0','100','1','0','15404','Algalon Death5'),
('32871','10','0','You are... out of time.','14','0','100','0','0','15394','Algalon Berserk'),
('32871','11','0','Witness the fury of the cosmos!','14','0','100','0','0','15396','Algalon BigBang'),
('32871','12','0','Behold the tools of creation!','14','0','100','0','0','15397','Algalon Phaseswitch'),
('32871','13','0','Trans-location complete. Commencing planetary analysis of Azeroth.','12','0','100','0','0','15405','Algalon Summon1'),
('32871','14','0','Stand back, mortals. I am not here to fight you.','12','0','100','0','0','15406','Algalon Summon2'),
('32871','15','0','It is in the universe''s best interest to re-originate this planet should my analysis find systemic corruption. Do not interfere.','12','0','100','0','0','15407','Algalon Summon3'),
('32871','16','0','Analysis complete. There is partial corruption in the planet''s life-support systems as well as complete corruption in most of the planet''s defense mechanisms.','14','0','100','1','0','15398','Algalon Timeout'),
('32871','17','0','Begin uplink: Reply Code: ''Omega''. Planetary re-origination requested..','14','0','100','1','0','15399','Algalon Timeout2'),
('32871','18','0','Farewell, mortals. Your bravery is admirable, for such flawed creatures.','14','0','100','1','0','15400','Algalon Timeout3'),
('32871','19','0','Algalon the Observer begins to Summon Collapsing Stars!','41','0','100','0','0','0','Algalon Summon Stars'),
('32871','20','0','Algalon the Observer begins to cast Cosmic Smash','41','0','100','0','0','0','Algalon Cosmic Smash'),
('32871','21','0','Algalon the Observer begins to cast Big Bang!','41','0','100','0','0','0','Algalon Big Bang'),
('34064','0','0','We did it, lads! We got here before Algalon''s arrival. Maybe we can rig the systems to interfere with his analysis--','14','0','100','0','0','15824','Brann AlgalonSummoned01'),
('34064','1','0','I''ll head back to the archivum and see if I can jam his signal. I might be able to buy us some time while you take care of him.','14','0','100','0','0','15825','Brann AlgalonSummoned02'),
('34064','2','0','I know just the place. Will you be all right?','12','0','100','0','0','15823','Brann AlgalonDefeated');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` = 10678;
INSERT INTO `achievement_criteria_data` VALUES
(10678,11,0,0,'achievement_herald_of_the_titans');

UPDATE creature_template SET scriptname = 'boss_sara' WHERE entry = 33134;
UPDATE script_texts SET npc_entry = 33134 WHERE npc_entry = 33288 AND entry IN (-1603330,-1603331,-1603332,-1603333);
UPDATE script_texts SET content_default = "Help me! Please get them off me!" WHERE npc_entry = 33134 AND entry = -1603310;
UPDATE script_texts SET content_default = "What do you want from me? Leave me alone!" WHERE npc_entry = 33134 AND entry = -1603311;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` = 33134;
UPDATE creature_template SET scriptname = 'npc_ominous_cloud' WHERE entry = 33292;
UPDATE creature_template SET scriptname = 'npc_guardian_of_yogg_saron' WHERE entry = 33136;
UPDATE creature_template SET scriptname = 'npc_yogg_saron_tentacle' WHERE entry in (33966,33985,33983);
UPDATE creature_template SET scriptname = 'npc_descend_into_madness' WHERE entry = 34072;
UPDATE creature_template SET scriptname = 'npc_brain_of_yogg_saron' WHERE entry = 33890;
UPDATE creature_template SET scriptname = 'boss_yogg_saron' WHERE entry = 33288;
UPDATE creature_template SET scriptname = 'npc_influence_tentacle' WHERE entry in (33716,33720,33719,33717,33433,33567);
UPDATE creature_template SET scriptname = 'npc_immortal_guardian' WHERE entry = 33988;
UPDATE creature_template SET scriptname = 'npc_support_keeper' WHERE entry in (33410,33411,33412,33413);
UPDATE creature_template SET scriptname = 'npc_sanity_well' WHERE entry = 33991;
UPDATE creature_template SET modelid1 = 11686, modelid2 = 11686 WHERE entry = 33991;
UPDATE creature_template SET scriptname = 'npc_death_orb' WHERE entry = 33882;
UPDATE creature_template SET modelid1 = 16946, modelid2 = 16946 WHERE entry = 33882;
UPDATE creature_template SET scriptname = 'npc_death_ray' WHERE entry = 33881;
UPDATE creature_template SET modelid1 = 17612, modelid2 = 17612 WHERE entry = 33881;
UPDATE creature_template SET minlevel = 80, maxlevel = 80, scriptname = 'npc_laughting_skull' WHERE entry = 33990;
UPDATE creature_template SET modelid1 = 15880, modelid2 = 15880 WHERE entry = 33990;
UPDATE creature_template SET scriptname = 'npc_keeper_help' WHERE entry IN(33241,33244,33242,33213);
UPDATE `creature_template` SET `minlevel`=80  , `maxlevel`=80 WHERE `entry` = 33943;

UPDATE gameobject_template SET scriptname = 'go_flee_to_surface' WHERE entry = 194625;
UPDATE item_template SET scriptname = 'item_unbound_fragments_of_valanyr' WHERE entry = 45896;

UPDATE creature_template SET RegenHealth = 0 WHERE entry IN (33134,34332,33890,33954);

-- Secound Damage Effekt of ShadowNova only on other Guardians or Sara
DELETE FROM conditions WHERE SourceEntry = 65209;
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,65209,0,18,1,33136,0,0,'','Effekt only for Guardian of YoggSaron'),
(13,0,65209,0,18,1,33134,0,0,'','Effekt only for Sara');

DELETE FROM gameobject WHERE id = 194625;
INSERT INTO gameobject
(guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state)
VALUES
(603001, 194625, 603, 3, 1, 2001.40, -59.66, 245.07, 0, 0, 0, 0, 0, 60, 100, 1),
(603002, 194625, 603, 3, 1, 1941.61, -25.88, 244.98, 0, 0, 0, 0, 0, 60, 100, 1),
(603003, 194625, 603, 3, 1, 2001.18,  9.409, 245.24, 0, 0, 0, 0, 0, 60, 100, 1);

-- Auren shouldnt hit other friendly NPCs
DELETE FROM spell_script_names WHERE spell_id IN (62670,62671,62702,62650);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(62670,'spell_keeper_support_aura_targeting'),
(62671,'spell_keeper_support_aura_targeting'),
(62702,'spell_keeper_support_aura_targeting'),
(62650,'spell_keeper_support_aura_targeting');

-- Script for Target Faces Caster
DELETE FROM spell_script_names WHERE spell_id IN (64164,64168);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64164,'spell_lunatic_gaze_targeting'),
(64168,'spell_lunatic_gaze_targeting');

-- Trigger Effekt on Near Player with Brain Link
DELETE FROM spell_script_names WHERE spell_id IN (63802);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(63802,'spell_brain_link_periodic_dummy');

-- Needed for Titanic Storm
-- Script for Target have Weakened Aura
DELETE FROM spell_script_names WHERE spell_id IN (64172);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64172,'spell_titanic_storm_targeting');

-- Condition because NPCs need this else no hit
DELETE FROM conditions WHERE SourceEntry in (64172,64465);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,64172,0,18,1,33988,0,0,'','Effekt only for Immortal Guardians'),
(13,0,64465,0,18,1,33988,0,0,'','Effekt only for Immortal Guardians');

-- Hodir Secound Aura Script
DELETE FROM spell_script_names WHERE spell_id IN (64174);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64174,'spell_hodir_protective_gaze');

-- Insane Death trigger on Remove
DELETE FROM spell_script_names WHERE spell_id IN (63120);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(63120,'spell_insane_death_effekt');

-- Deathray Effekt on Death Orb
DELETE FROM conditions WHERE SourceEntry IN (63882,63886);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,63882,0,18,1,33882,0,0,'','Effekt on Death Orb'),
(13,0,63886,0,18,1,33882,0,0,'','Effekt on Death Orb');

-- Correct Summon Position of Tentacle
DELETE FROM spell_script_names WHERE spell_id IN (64139,64143,64133);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64139,'spell_summon_tentacle_position'),
(64143,'spell_summon_tentacle_position'),
(64133,'spell_summon_tentacle_position');

-- Heal Trigger for Empowering Shadows
DELETE FROM spell_script_names WHERE spell_id IN (64466);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64466,'spell_empowering_shadows');

-- Create Val'anyr on Yogg-Saron
DELETE FROM conditions WHERE SourceEntry IN (64184);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,64184,0,18,1,33288,0,0,'','Effekt on YoggSaron');

-- Missing Says Vision
DELETE FROM script_texts WHERE entry BETWEEN -1603360 AND -1603342;
INSERT INTO script_texts (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES
(33436,-1603342,'Bad news sire.',15538,0,0,0,'Garona KingLlaneVision_Say1'),
(33436,-1603343,'The clans are united under Blackhand in this assault. They will stand together until Stormwind has fallen.',15539,0,0,0,'Garona KingLlaneVision_Say2'),
(33436,-1603344,'Gul\'dan is bringing up his warlocks by nightfall. Until then, the Blackrock clan will be trying to take the Eastern Wall.',15540,0,0,0,'Garona KingLlaneVision_Say3'),
(33288,-1603345,'A thousand deaths... or one murder.',15762,0,0,0,'YoggSaron KingLlaneVision_Say1'),
(33288,-1603346,'',15763,0,0,0,'YoggSaron KingLlianeVision_Say2'),
(33437,-1603347,'We will hold until the reinforcements come. As long as men with stout hearts are manning the walls and throne Stormwind will hold.',15585,0,0,0,'KingLlane KingLlaneVision_Say'),
(33436,-1603348,'The orc leaders agree with your assessment.',15541,0,0,0,'Garona KingLlaneVision_Say4'),
(33288,-1603349,'Your petty quarrels only make me stronger!',15764,0,0,0,'YoggSaron KingLlaneVision_Say3'),

(33441,-1603350,'Your resilience is admirable.',15598,0,0,0,'TheLichKing LichKingVision_Say1'),
(33442,-1603351,'Arrrrrrgh!',15470,1,0,0,'ImmolatedChampion LichKingVision_Say1'),
(33442,-1603352,'I\'m not afraid of you!',15471,0,0,0,'ImmolatedChampion LichKingVision_Say2'),
(33441,-1603353,'I will break you as I broke him.',15599,0,0,0,'TheLichKing LichKingVision_Say2'),
(33288,-1603354,'Yrr n\'lyeth... shuul anagg!',15766,0,0,0,'YoggSaron LichKingVision_Say1'),
(33288,-1603355,'He will learn... no king rules forever, only death is eternal!',15767,0,0,0,'YoggSaron LichKingVision_Say2'),

(33523,-1603356,'It is done... All have been given that which must be given. I now seal the Dragon Soul forever...',15631,0,0,0,'Neltharion DragonSoulVision_Say1'),
(33495,-1603357,'That terrible glow... should that be?',15702,0,0,0,'Ysera DragonSoulVision_Say'),
(33523,-1603358,'For it to be as it must, yes.',15632,0,0,0,'Neltharion DragonSoulVision_Say2'),
(33535,-1603359,'It is a weapon like no other. It must be like no other.',15610,0,0,0,'Malygos DragonSoulVision_Say'),
(33288,-1603360,'His brood learned their lesson before too long, you shall soon learn yours!',15765,0,0,0,'YoggSaron DragonSoulVision_Say1');


INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (10202228, 33213, 603, 1, 1, 0, 0, 1939.1, -90.6097, 411.357, 1.00923, 300, 0, 0, 14433075, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (10202230, 33241, 603, 1, 1, 0, 0, 2058.13, -24.3408, 421.532, 3.13766, 300, 0, 0, 14433075, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (10202236, 33242, 603, 1, 1, 0, 0, 2036.31, -73.9809, 411.355, 2.26823, 300, 0, 0, 14433075, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (10202234, 33244, 603, 1, 1, 0, 0, 2036.92, 25.5315, 411.358, 3.91757, 300, 0, 0, 14433075, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `npcflag`=1 WHERE `entry` IN (33213,33241,33242,33244);

DELETE FROM `gameobject` WHERE `id` =194200;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (2712204, 194200, 603, 1, 1, 2036.11, -201.289, 432.687, 3.17535, 0, 0, 0.999858, -0.0168795, -604800, 255, 1);

-- Mimiron 10 man Hard loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=27086;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27086','1','100','1','0','-34129','1'),
('27086','45982','0','1','2','1','1'),
('27086','45988','0','1','2','1','1'),
('27086','45989','0','1','2','1','1'),
('27086','45990','0','1','2','1','1'),
('27086','45993','0','1','2','1','1'),
('27086','45647','0','1','1','1','1'),
('27086','45648','0','1','1','1','1'),
('27086','45649','0','1','1','1','1'),
('27086','45787','-100','1','0','1','1'),
('27086','40753','100','1','0','1','1'),
('27086','45624','100','1','0','1','1');

-- Mimiron 25 man Hard loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=26967;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26967','1','10','1','0','-34154','1'),
('26967','2','100','1','0','-34180','2'),
('26967','45038','18','1','0','1','1'),
('26967','45087','75','1','0','1','1'),
('26967','45489','0','1','1','1','1'),
('26967','45490','0','1','1','1','1'),
('26967','45491','0','1','1','1','1'),
('26967','45492','0','1','1','1','1'),
('26967','45493','0','1','1','1','1'),
('26967','45494','0','1','2','1','1'),
('26967','45495','0','1','2','1','1'),
('26967','45496','0','1','2','1','1'),
('26967','45497','0','1','2','1','1'),
('26967','45620','0','1','2','1','1'),
('26967','45624','100','1','0','2','2'),
('26967','45663','0','1','2','1','1'),
('26967','45816','-100','1','0','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34180;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34180','45641','0','1','1','1','1'),
('34180','45642','0','1','1','1','1'),
('34180','45643','0','1','1','1','1');

-- Thorim 10 man Hard loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=27074;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27074','1','100','1','0','-34130','1'),
('27074','45928','0','1','2','1','1'),
('27074','45929','0','1','2','1','1'),
('27074','45930','0','1','2','1','1'),
('27074','45931','0','1','2','1','1'),
('27074','45933','0','1','2','1','1'),
('27074','45659','0','1','1','1','1'),
('27074','45660','0','1','1','1','1'),
('27074','45661','0','1','1','1','1'),
('27074','45784','-100','1','0','1','1'),
('27074','40753','100','1','0','1','1'),
('27074','45624','100','1','0','1','1');

-- Thorim 25 man loot
UPDATE `gameobject_template` SET `data1`=27075 WHERE `entry`=194315;
DELETE FROM `reference_loot_template` WHERE `entry`=34181;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34181','45638','0','1','1','1','1'),
('34181','45639','0','1','1','1','1'),
('34181','45640','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE `entry`=27075;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27075','1','10','1','0','-34154','1'),
('27075','2','100','1','0','-34181','2'),
('27075','45038','18','1','0','1','1'),
('27075','45087','75','1','0','1','1'),
('27075','45463','0','1','1','1','1'),
('27075','45466','0','1','1','1','1'),
('27075','45467','0','1','1','1','1'),
('27075','45468','0','1','1','1','1'),
('27075','45469','0','1','1','1','1'),
('27075','45624','100','1','0','1','1');


-- Freya 25 man loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=27079;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27079','2','100','1','0','-34154','1'),
('27079','3','100','1','0','-12020','2'),
('27079','4','100','2','0','-12021','1'),
('27079','5','100','4','0','-12022','1'),
('27079','45038','18','1','0','1','1'),
('27079','45087','100','1','0','1','1'),
('27079','45479','0','1','1','1','1'),
('27079','45480','0','1','1','1','1'),
('27079','45481','0','1','1','1','1'),
('27079','45482','0','1','1','1','1'),
('27079','45483','0','1','1','1','1'),
('27079','45624','100','1','0','1','1'),
('27079','46110','100','1','0','1','1');

-- Freya 25 man 3 elder loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=26962;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26962','1','100','1','0','-34154','1'),
('26962','2','100','1','0','-12020','2'),
('26962','45038','18','1','0','1','1'),
('26962','45087','100','1','0','3','3'),
('26962','45479','0','1','1','1','1'),
('26962','45480','0','1','1','1','1'),
('26962','45481','0','1','1','1','1'),
('26962','45482','0','1','1','1','1'),
('26962','45483','0','1','1','1','1'),
('26962','45484','0','2','2','1','1'),
('26962','45485','0','2','2','1','1'),
('26962','45486','0','2','2','1','1'),
('26962','45487','0','2','2','1','1'),
('26962','45488','0','2','2','1','1'),
('26962','45613','0','2','2','1','1'),
('26962','45624','100','1','0','5','5'),
('26962','45814','-100','1','0','1','1'),
('26962','46110','100','1','0','1','1');



-- Runeforged Sentry
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=7.5,`AIName`='SmartAI' WHERE `entry`=34234;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=13 WHERE `entry`=34235;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34234;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34234;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34234,0,0,0,0,0,100,0,2000,2000,10000,10000,11,64852,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Runeforged Sentry - Cast Flaming Rune'),
(34234,0,1,0,0,0,100,0,3000,5000,5000,7000,11,64870,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Runeforged Sentry - Cast Lava Burst'),
(34234,0,2,0,0,0,100,0,2500,3000,12000,15000,11,64847,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Runeforged Sentry - Cast Runed Flame Jets');
-- Steelforged Defender
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=7.5,`AIName`='SmartAI' WHERE `entry`=33236;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=13 WHERE `entry`=34113;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33236;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33236;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33236,0,0,0,0,0,100,0,4000,6000,15000,20000,11,62845,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Steelforged Defender - Cast Hamstring'),
(33236,0,1,0,0,0,100,0,0,4000,6000,8000,11,57780,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Steelforged Defender - Cast Lightning Bolt'),
(33236,0,2,0,0,0,100,0,5000,6000,4000,6000,11,50370,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Steelforged Defender - Cast Sunder Armor');
-- Mechagnome Battletank
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=417,`maxdmg`=582,`attackpower`=968,`minrangedmg`=341,`maxrangedmg`=506,`baseattacktime`=2000,`dmg_multiplier`=7.5,`AIName`='SmartAI' WHERE `entry`=34164;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=417,`maxdmg`=582,`attackpower`=968,`minrangedmg`=341,`maxrangedmg`=506,`baseattacktime`=2000,`dmg_multiplier`=13 WHERE `entry`=34165;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34164;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34164;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34164,0,0,0,0,0,100,0,3000,4000,6000,8000,11,64693,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Mechagnome Battletank - Cast Flame Cannon'),
(34164,0,1,0,0,0,100,0,10000,10000,15000,20000,11,64953,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Mechagnome Battletank - Cast Jump Attack');
-- Ironwork Cannon - NEED HELP!
/*UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|8,`unit_flags`=`unit_flags`|4,`mindmg`=417,`maxdmg`=582,`attackpower`=968,`minrangedmg`=341,`maxrangedmg`=506,`baseattacktime`=2000,`AIName`='SmartAI' WHERE `entry`=34164;
UPDATE `creature_model_info` SET `bounding_radius`=2.06,`combat_reach`=3 WHERE `modelid` IN (26161,27101,25723,28471);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34164;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34164;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34164,0,0,0,0,0,100,0,3000,4000,6000,8000,11,64693,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Ironwork Cannon - Cast Flame Cannon');*/

-- Molten Colossus
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`attackpower`=982,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34069;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`attackpower`=982,`dmg_multiplier`=18 WHERE `entry`=34185;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34069;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34069;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34069,0,0,0,0,0,100,0,6000,10000,10000,12000,11,64697,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Molten Colossus - Cast Earthquake'),
(34069,0,1,0,0,0,100,0,2000,4000,5000,6000,11,64698,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Molten Colossus - Cast Pyroblast');
-- Magma Rager
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33557296,`AIName`='SmartAI' WHERE `entry`=34086;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33557296 WHERE `entry`=34201;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34086;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34086;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34086,0,0,0,0,0,100,0,2000,4000,6000,8000,11,64773,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Magma Rager - Cast Fire Blast'),
(34086,0,1,0,0,0,100,0,6000,16000,12000,20000,11,64746,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Magma Rager - Cast Superheated Winds');
-- Superheated Winds
UPDATE `creature_template` SET `unit_flags`=33718790,`modelid1`=11686,`modelid2`=0,`AIName`='' WHERE `entry`=34194;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34194;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34194;
DELETE FROM `creature_template_addon` WHERE `entry`=34194;
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES
(34194,'64724');
-- Forge Construct
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34085;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34186;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34085;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34085;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34085,0,0,0,0,0,100,0,8000,12000,10000,15000,11,64719,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Forge Construct - Cast Charge'),
(34085,0,1,0,0,0,100,2,2000,6000,6000,9000,11,64720,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forge Construct - Cast Flame Emission 10'),
(34085,0,2,0,0,0,100,4,2000,6000,6000,9000,11,64721,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forge Construct - Cast Flame Emission 25');

-- XB-488 Disposalbot
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34273;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34274;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34273;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34273;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34273,0,0,0,2,0,100,0,30,40,0,0,11,65084,1,0,0,0,0,1,0,0,0,0,0,0,0, 'XB-488 Disposalbot - Cast Self Destruct'),
(34273,0,1,0,0,0,100,2,2000,6000,6000,10000,11,65080,0,0,0,0,0,2,0,0,0,0,0,0,0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 10'),
(34273,0,2,0,0,0,100,4,2000,6000,6000,10000,11,65104,0,0,0,0,0,2,0,0,0,0,0,0,0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 25');
-- Parts Recovery Technician
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554432,`AIName`='SmartAI' WHERE `entry`=34267;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554432 WHERE `entry`=34268;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34267;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34267;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34267,0,0,0,0,0,100,0,6000,8000,10000,12000,11,65071,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Parts Recovery Technician - Cast Mechano Kick'),
(34267,0,1,0,0,0,100,0,8000,12000,15000,20000,11,65070,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Parts Recovery Technician - Cast Defense Matrix');
-- XD-175 Compactobot
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34271;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34272;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34271;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34271;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34271,0,0,0,0,0,100,2,8000,12000,15000,20000,11,65073,0,0,0,0,0,6,0,0,0,0,0,0,0, 'XD-175 Compactobot - Cast Trash Compactor 10'),
(34271,0,1,0,0,0,100,4,8000,12000,15000,20000,11,65106,0,0,0,0,0,6,0,0,0,0,0,0,0, 'XD-175 Compactobot - Cast Trash Compactor 25');
-- XR-949 Salvagebot
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34269;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34270;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34269;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34269;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34269,0,0,0,0,0,100,0,4000,6000,6000,8000,11,65099,0,0,0,0,0,5,0,0,0,0,0,0,0,'XR-949 Salvagebot - Cast Deploy Salvage Saws'),
(34269,0,1,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,9,34288,0,100,0,0,0,0,'XR-949 Salvagebot - on Death - Despawn Salvagebot Sawblade');
-- Salvagebot Sawblade
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`unit_flags`=33554560,`AIName`='SmartAI' WHERE `entry`=34288;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`unit_flags`=33554560 WHERE `entry`=34291;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34288;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34288;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34288,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,5,0,0,0,0,0,0,0,'Salvagebot Sawblade - on Summon - attack random Hostile'),
(34288,0,1,0,60,0,100,0,5000,5000,5000,5000,49,0,0,0,0,0,0,5,0,0,0,0,0,0,0,'Salvagebot Sawblade - every 5sec - attack random Hostile');

-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34199;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34237;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34199;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34199;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34199,0,0,0,0,0,100,2,0,0,6000,8000,11,64889,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(34199,0,1,0,0,0,100,4,0,0,6000,8000,11,64975,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');
-- Hardened Iron Golem
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34190;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496 WHERE `entry`=34229;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34190;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34190;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34190,0,0,0,0,0,100,0,4000,8000,10000,15000,11,64877,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardened Iron Golem - Cast Harden Fists'),
(34190,0,1,0,0,0,100,2,5000,7000,15000,20000,11,64874,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Hardened Iron Golem - Cast Rune Punch 10'),
(34190,0,2,0,0,0,100,4,5000,7000,15000,20000,11,64967,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Hardened Iron Golem - Cast Rune Punch 25');
-- Iron Mender
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34198;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34236;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34198;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34198;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34198,0,0,0,0,0,100,2,2000,4000,4000,6000,11,64918,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Iron Mender - Cast Electro Shock 10'),
(34198,0,1,0,0,0,100,4,2000,4000,4000,6000,11,64971,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Iron Mender - Cast Electro Shock 25'),
(34198,0,2,0,0,0,100,2,3000,6000,10000,15000,11,64903,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Iron Mender - Cast Fuse Lightning 10'),
(34198,0,3,0,0,0,100,4,3000,6000,10000,15000,11,64970,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Iron Mender - Cast Fuse Lightning 25'),
(34198,0,4,0,0,0,100,2,10000,15000,20000,25000,11,64897,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Iron Mender - Cast Fuse Metal 10'),
(34198,0,5,0,0,0,100,4,10000,15000,20000,25000,11,64968,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Iron Mender - Cast Fuse Metal 25');
-- Rune Etched Sentry
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554496,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34196;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554496,`dmg_multiplier`=18 WHERE `entry`=34245;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34196;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34196;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34196,0,0,0,0,0,100,0,2000,2000,10000,10000,11,64852,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Flaming Rune'),
(34196,0,1,0,0,0,100,2,3000,5000,5000,7000,11,64870,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Lava Burst 10'),
(34196,0,2,0,0,0,100,4,3000,5000,5000,7000,11,64991,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Lava Burst 25'),
(34196,0,3,0,0,0,100,2,2500,3000,12000,15000,11,64847,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Runed Flame Jets 10'),
(34196,0,4,0,0,0,100,4,2500,3000,12000,15000,11,64988,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Runed Flame Jets 25');
-- Chamber Overseer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34197;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=32,`mechanic_immune_mask`=33554496 WHERE `entry`=34226;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34197;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34197;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34197,0,0,0,0,0,100,0,7000,9000,8000,10000,11,64783,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Displacement Device'),
(34197,0,1,0,0,0,100,2,4000,8000,6000,9000,11,64820,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Devastating Leap 10'),
(34197,0,2,0,0,0,100,4,4000,8000,6000,9000,11,64943,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Devastating Leap 25'),
(34197,0,3,0,0,0,100,2,8000,10000,8000,12000,11,64825,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Staggering Roar 10'),
(34197,0,4,0,0,0,100,4,8000,10000,8000,12000,11,64944,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Staggering Roar 25');
-- Displacement Device
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`unit_flags`=33554560,`speed_walk`=0.2,`speed_run`=0.3,`dmg_multiplier`=1,`unit_flags`=514,`InhabitType`=1,`MovementType`=1,`AIName`='SmartAI' WHERE `entry`=34203;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`unit_flags`=33554560,`speed_walk`=0.2,`speed_run`=0.3,`dmg_multiplier`=1,`unit_flags`=514,`InhabitType`=1,`MovementType`=1 WHERE `entry`=34227; 
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34203;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34203;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34203,0,0,0,54,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Displacement Device - on Summon - set react state passive');
DELETE FROM `creature_template_addon` WHERE `entry` IN (34203,34227);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES
(34203,'64793'),
(34227,'64941');
-- Champion of Hodir
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34133;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34139;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34133;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34133;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34133,0,0,0,0,0,100,2,3000,6000,8000,10000,11,64639,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Champion of Hodir - Cast Stomp 10'),
(34133,0,1,0,0,0,100,4,3000,6000,8000,10000,11,64652,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Champion of Hodir - Cast Stomp 25');
-- Winter Jormungar
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34137;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34140;
UPDATE `creature_template_addon` SET `auras`='47677' WHERE `entry`=34137;
UPDATE `creature` SET `spawndist`=2 WHERE`id`=34137;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34137;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34137;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34137,0,0,0,0,0,100,0,3000,6000,6000,9000,11,64638,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Winter Jormungar - Cast Acidic Bite');
-- Winter Revenant
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554496,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34134;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554496,`dmg_multiplier`=18 WHERE `entry`=34141;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34134;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34134;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34134,0,0,0,0,0,100,2,8000,10000,12000,15000,11,64642,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Winter Revenant - Cast Blizzard 10'),
(34134,0,1,0,0,0,100,4,8000,10000,12000,15000,11,64653,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Winter Revenant - Cast Blizzard 25'),
(34134,0,2,0,0,0,100,0,3000,5000,10000,12000,11,64643,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Winter Revenant - Cast Whirling Strike'),
(34134,0,3,0,0,0,100,1,15000,20000,0,0,11,64644,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Winter Revenant - Cast Shield of the Winter Revenant');
-- Winter Rumbler
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34135;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34142;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34135;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34135;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34135,0,0,0,0,0,100,2,6000,10000,8000,12000,11,64645,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Winter Rumbler - Cast Cone of Cold 10'),
(34135,0,1,0,0,0,100,4,6000,10000,8000,12000,11,64655,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Winter Rumbler - Cast Cone of Cold 25'),
(34135,0,2,0,0,0,100,2,3000,6000,6000,10000,11,64647,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Winter Rumbler - Cast Snow Blindness 10'),
(34135,0,3,0,0,0,100,4,3000,6000,6000,10000,11,64654,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Winter Rumbler - Cast Snow Blindness 25');
-- Guardian Lasher
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=33430;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496 WHERE `entry`=33732;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33430;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33430;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33430,0,0,0,4,0,100,0,0,0,0,0,75,63007,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Guardian Lasher - on Aggro - add Aura Guardian Pheromones'),
(33430,0,1,0,0,0,100,2,3000,6000,8000,12000,11,63047,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Guardian Lasher - Cast Guardian''s Lash 10'),
(33430,0,2,0,0,0,100,4,3000,6000,8000,12000,11,63550,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Guardian Lasher - Cast Guardian''s Lash 25');
-- Forest Swarmer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33431;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33731;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33431;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33431;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33431,0,0,0,0,0,100,0,3000,4000,6000,8000,11,63059,0,0,0,0,0,9,33430,0,25,0,0,0,0, 'Forest Swarmer - Cast Pollinate on Guardian Lasher');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63059;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,63059,0,18,1,33430,0,0,'','Spell: Polite only target Guardian Lasher (10)'),
(13,0,63059,1,18,1,33732,0,0,'','Spell: Polite only target Guardian Lasher (25)');
-- Guardian of Life
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33528;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33733;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33528;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33528;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33528,0,0,0,0,0,100,2,6000,9000,15000,20000,11,63226,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Guardian of Life - Cast Poison Breath 10'),
(33528,0,1,0,0,0,100,4,6000,9000,15000,20000,11,63551,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Guardian of Life - Cast Poison Breath 25');
-- Nature's Blade
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33527;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33741;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33527;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33527;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33527,0,0,0,0,0,100,2,8000,10000,15000,25000,11,63247,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Nature''s Blade - Cast Living Tsunami 10'),
(33527,0,1,0,0,0,100,4,8000,10000,15000,25000,11,63568,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Nature''s Blade - Cast Living Tsunami 25');
-- Ironroot Lasher
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33526;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33734;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33526;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33526;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33526,0,0,0,16,0,100,2,63240,20,10000,20000,11,63240,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Ironroot Lasher - on missing Buff - Cast Ironroot Thorns 10'),
(33526,0,1,0,16,0,100,4,63553,20,10000,20000,11,63553,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Ironroot Lasher - on missing Buff - Cast Ironroot Thorns 25');
-- Mangrove Ent
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33525;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33735;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33525;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33525;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33525,0,0,0,0,0,100,0,10000,10000,15000,15000,11,63272,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Mangrove Ent - Cast Hurricane'),
(33525,0,1,0,0,0,100,2,12500,12500,15000,15000,11,63242,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Mangrove Ent - Cast Nourish 10'),
(33525,0,2,0,0,0,100,4,12500,12500,15000,15000,11,63556,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Mangrove Ent - Cast Nourish 25'),
(33525,0,3,0,0,0,100,2,15000,15000,16000,16000,11,63241,1,0,0,0,0,1,0,0,0,0,0,0,0, 'Mangrove Ent - Cast Tranquility 10'),
(33525,0,4,0,0,0,100,4,15000,15000,16000,16000,11,63554,1,0,0,0,0,1,0,0,0,0,0,0,0, 'Mangrove Ent - Cast Tranquility 25');
-- Misguided Nymph
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33355;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`AIName`='' WHERE `entry`=33737;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33355;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33355;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33355,0,0,0,0,0,100,2,8000,12000,20000,25000,11,63082,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Bind Life 10'),
(33355,0,1,0,0,0,100,4,8000,12000,20000,25000,11,63559,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Bind Life 25'),
(33355,0,2,0,0,0,100,2,4000,6000,10000,12000,11,63111,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Frost Spear 10'),
(33355,0,3,0,0,0,100,4,4000,6000,10000,12000,11,63562,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Frost Spear 25'),
(33355,0,4,0,0,0,100,2,15000,20000,15000,20000,11,63136,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Winter''s Embrace 10'),
(33355,0,5,0,0,0,100,4,15000,20000,15000,20000,11,63564,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Winter''s Embrace 25');
-- Corrupted Servitor
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=33354;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496  WHERE `entry`=33729;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33354;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33354;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33354,0,0,0,0,0,100,2,2000,4000,8000,12000,11,63169,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Corrupted Servitor - Cast Petrify Joints 10'),
(33354,0,1,0,0,0,100,4,2000,4000,8000,12000,11,63549,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Corrupted Servitor - Cast Petrify Joints 25'),
(33354,0,2,0,0,0,100,0,6000,8000,12000,16000,11,63149,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Corrupted Servitor - Cast Violent Earth');
-- Dark Rune Ravager & Thunderer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`= 35 WHERE `entry`=33755;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`= 55 WHERE `entry`=33758;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`= 20 WHERE `entry`=33754;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`= 30 WHERE `entry`=33757;
UPDATE `creature_template` SET `dmgschool`=3 WHERE `entry` IN (33754,33757); -- Nature Damage
-- some equipment updates
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 32908;
-- Arachnopod Destroyer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34183;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496 WHERE `entry`=34214;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34183;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34183;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34183,0,0,0,0,0,100,0,2000,4000,6000,9000,11,64717,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Arachnopod Destroyer - Cast Flame Spray'),
(34183,0,1,0,0,0,100,0,6000,8000,8000,10000,11,64776,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Arachnopod Destroyer - Cast Machine Gun');
/*-- Clockwork Mechanic - mount in Vehicle Arachnopod Destroyer 
UPDATE `creature_template` SET `dmg_multiplier`=20,`mingold`=1720000,`maxgold`=1760000 WHERE `entry`=34184;
*/
-- Trash
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10 WHERE `entry`=34191;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34217;
-- Boomer XP-500
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34192;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34216;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34192;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34192;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34192,0,0,0,9,0,100,0,0,3,0,0,11,55714,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Boomer XP-500 - Explode');
-- Clockwork Sapper
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`dmg_multiplier`=10,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34193;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`dmg_multiplier`=18,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`mechanic_immune_mask`=33554496 WHERE `entry`=34220;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34193;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34193;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34193,0,0,0,0,0,100,0,2000,6000,6000,8000,11,64740,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Clockwork Sapper - Cast Energy Sap');
-- Twilight Adherent
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1848,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`unit_class`=2,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33818;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1848,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`unit_class`=2,`dmg_multiplier`=18 WHERE `entry`=33827;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33818;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33818;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33818,0,0,0,0,0,100,0,12000,15000,25000,30000,11,64663,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Adherent - Cast Arcane Burst'),
(33818,0,1,0,0,0,100,0,3000,5000,6000,8000,11,64662,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Adherent - Cast Blink'),
(33818,0,2,0,0,0,100,0,12000,15000,15000,20000,11,63760,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Twilight Adherent - Cast Greater Heal'),
(33818,0,3,0,0,0,100,0,6000,8000,12000,16000,11,13704,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Adherent - Cast Psychic Scream'),
(33818,0,4,0,0,0,100,0,8000,10000,12000,15000,11,37978,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Twilight Adherent - Cast Renew');
-- Twilight Guardian
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1852,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33822;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1852,`dmg_multiplier`=18 WHERE `entry`=33828;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33822;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33822;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33822,0,0,0,0,0,100,0,6000,10000,8000,10000,11,52719,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - Cast Concussion Blow'),
(33822,0,1,0,0,0,100,0,2000,3000,3000,6000,11,62317,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - Cast Devastate'),
(33822,0,2,0,0,0,100,0,8000,10000,10000,12000,11,63757,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - Cast Thunderclap');
-- Twilight Shadowblade
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1862,`dmg_multiplier`=10,`baseattacktime`=1000,`AIName`='SmartAI' WHERE `entry`=33824;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1862,`dmg_multiplier`=18,`baseattacktime`=1000 WHERE `entry`=33831;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33824;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33824;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33824,0,0,0,0,0,100,0,6000,8000,10000,12000,11,63753,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Twilight Shadowblade - Cast Fan of Knives')/*,
(33824,0,1,0,0,0,100,0,6000,8000,10000,12000,11,63754,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Shadowblade - Cast Backstab') -- needs to jump behind target*/;
-- Twilight Slayer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1847,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33823;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1847,`dmg_multiplier`=18 WHERE `entry`=33832;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33823;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33823;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33823,0,0,0,0,0,100,0,3000,5000,7000,9000,11,35054,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Slayer - Cast Mortal Strike'),
(33823,0,1,0,0,0,100,0,12000,15000,15000,20000,11,63784,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Slayer - Cast Bladestorm');
-- Faceless Horror
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`dmg_multiplier`=18,`AIName`='SmartAI' WHERE `entry`=33772;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`dmg_multiplier`=32 WHERE `entry`=33773;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33772;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33772;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33772,0,0,0,0,0,100,0,6000,8000,6000,8000,11,64429,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Faceless Horror - Cast Death Grip'),
(33772,0,1,0,0,0,100,0,2000,4000,8000,10000,11,63722,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Faceless Horror - Cast Shadow Crash'),
(33772,0,2,0,4,0,100,0,0,0,0,0,75,63703,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Faceless Horror - on Aggro - add Aura: Void Wave'),
(33772,0,3,0,2,0,100,0,0,75,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on 75% HP - set Phase 1'),
(33772,0,4,5,0,1,100,1,0,0,0,0,12,33806,6,0,0,1,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 1 - Summon Void Beast'),
(33772,0,5,0,61,1,100,0,0,0,0,0,75,63710,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 1 - add Aura: Void Barrier'),
(33772,0,6,0,2,0,100,0,0,50,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on 50% HP - set Phase 2'),
(33772,0,7,8,0,2,100,1,0,0,0,0,12,33806,6,0,0,1,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 2 - Summon Void Beast'),
(33772,0,8,0,61,2,100,0,0,0,0,0,75,63710,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 2 - add Aura: Void Barrier'),
(33772,0,9,0,2,0,100,0,0,25,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on 25% HP - set Phase 3'),
(33772,0,10,11,0,4,100,1,0,0,0,0,12,33806,6,0,0,1,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 3 - Summon Void Beast'),
(33772,0,11,0,61,4,100,0,0,0,0,0,75,63710,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 3 - add Aura: Void Barrier');
-- Void Beast
UPDATE `creature_template` SET `difficulty_entry_1`=33815,`faction_A`=16,`faction_H`=16,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`dmg_multiplier`=18,`AIName`='SmartAI' WHERE `entry`=33806;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`dmg_multiplier`=32 WHERE `entry`=33815;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33806;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33806;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33806,0,0,1,6,0,100,0,0,0,0,0,11,63723,2,0,0,0,0,0,0,0,0,0,0,0,0, 'Void Beast - on Death - Cast Shadow Nova'),
(33806,0,1,0,61,0,100,0,0,0,0,0,28,63710,0,0,0,0,0,19,33772,0,0,0,0,0,0, 'Void Beast - on Death - remove Aura: Void Barrier from closest Faceless Horror');
-- Twilight Frost Mage
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1849,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`mechanic_immune_mask`=33554513,`unit_class`=2,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33819;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1849,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`mechanic_immune_mask`=33554513,`unit_class`=2,`dmg_multiplier`=18 WHERE `entry`=33829;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33819;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33819;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33819,0,0,0,0,0,100,0,12000,15000,25000,30000,11,64663,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Arcane Burst'),
(33819,0,1,0,0,0,100,0,1000,2000,6000,8000,11,63913,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Frostbolt'),
(33819,0,2,0,0,0,100,0,2000,4000,10000,16000,11,63758,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Frost Bolt Volley'),
(33819,0,3,0,0,0,100,0,8000,10000,12000,16000,11,63912,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Frost Nova'),
(33819,0,4,0,0,0,100,0,7000,9000,9000,11000,11,64662,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Blink');
-- Twilight Pyromancer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1848,`mechanic_immune_mask`=33554513,`unit_class`=2,`dmg_multiplier`=10,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`AIName`='SmartAI' WHERE `entry`=33820;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1848,`mechanic_immune_mask`=33554513,`unit_class`=2,`dmg_multiplier`=18,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112 WHERE `entry`=33830;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33820;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33820;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33820,0,0,0,0,0,100,0,12000,15000,25000,30000,11,64663,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Arcane Burst'),
(33820,0,1,0,0,0,100,0,1000,2000,6000,8000,11,63789,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Fireball'),
(33820,0,2,0,0,0,100,0,2000,4000,10000,16000,11,63775,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Flamestrike'),
(33820,0,3,0,0,0,100,0,7000,9000,9000,11000,11,64662,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Blink'),
(33820,0,4,0,11,0,100,0,0,0,0,0,11,63774,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Summon Fire Elemental');
-- Enslaved Fire Elemental
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`difficulty_entry_1`=33839,`faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`dmg_multiplier`=10,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`AIName`='SmartAI' WHERE `entry`=33838;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`dmg_multiplier`=18,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112 WHERE `entry`=33839;
UPDATE `creature` SET `spawntimesecs`=604800 WHERE `id`=33838;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33838;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33838;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33838,0,0,0,54,0,100,0,0,0,0,0,11,63778,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Enslaved Fire Elemental - on Summon - Cast Fire Shield'),
(33838,0,1,0,0,0,100,0,4000,8000,12000,14000,11,38064,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Enslaved Fire Elemental - Cast Blast Wave');


-- Mining for NPCs 34085 and 34186
DELETE FROM `skinning_loot_template` WHERE entry = 100009;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 100009, 39220, 98, 1, 0, 6, 8 ), -- Geodesic Fragments 
( 100009, 36909, 25, 1, 0, 5, 9 ), -- Cobalt Ore
( 100009, 37701, 25, 1, 0, 5, 8 ), -- Crystallized Earth
( 100009, 36923,  5, 1, 0, 1, 1 ), -- Chalcedony
( 100009, 36921,  4, 1, 0, 1, 1 ), -- Autumns Glow
( 100009, 36933,  4, 1, 0, 1, 1 ), -- Forest Emerald
( 100009, 36930,  4, 1, 0, 1, 1 ), -- Monarch Topaz
( 100009, 36918,  4, 1, 0, 1, 1 ), -- Scarlet Ruby
( 100009, 33927,  4, 1, 0, 1, 1 ), -- Twilight Opal
( 100009, 36917,  4, 1, 0, 1, 1 ), -- Bloodstone
( 100009, 36932,  4, 1, 0, 1, 1 ), -- Dark Jade
( 100009, 36926,  4, 1, 0, 1, 1 ), -- Shadow Crystal
( 100009, 36920,  4, 1, 0, 1, 1 ), -- Sun Crystal
( 100009, 36924,  3, 1, 0, 1, 1 ), -- Sky Sapphire
( 100009, 36929,  3, 1, 0, 1, 1 )  -- Huge Citrine
;
-- Mining for Ulduar Trash
DELETE FROM `skinning_loot_template` WHERE entry = 100011;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 100011, 39220, 100, 1, 0, 1, 1 ), -- Geodesic Fragments
( 100011, 37701,   9, 1, 0, 1, 2 )  -- Crystallized Earth
;
-- Herbalism for Ulduar Trash
DELETE FROM `skinning_loot_template` WHERE entry = 100010;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 100010, 39516, 39, 1, 0, 1, 1 ), -- Frosty Mushroom
( 100010, 35947, 28, 1, 0, 1, 1 ), -- Sparkling Frostcap
( 100010, 36901, 25, 1, 0, 1, 1 ), -- Goldclover
( 100010, 37704,  4, 1, 0, 1, 2 ), -- Crystallized Life
( 100010, 36904,  4, 1, 0, 1, 1 ), -- Tiger Lily
( 100010, 36903,  3, 1, 0, 1, 1 ), -- Adders Tongue
( 100010, 36905,  3, 1, 0, 1, 1 ), -- Lichbloom
( 100010, 36907,  3, 1, 0, 1, 1 ), -- Talandras Rose
( 100010, 36906,  2, 1, 0, 1, 1 ) -- Icethorn
;
-- ReferenzLoot 10mann
DELETE FROM `reference_loot_template` WHERE entry = 90003;
INSERT INTO `reference_loot_template` (entry,item,ChanceOrQuestChance,lootmode,groupid,mincountOrRef,maxcount)
VALUES
(90003,46339,0,1,1,1,1),
(90003,46340,0,1,1,1,1),
(90003,46341,0,1,1,1,1),
(90003,46342,0,1,1,1,1),
(90003,46343,0,1,1,1,1),
(90003,46344,0,1,1,1,1),
(90003,46345,0,1,1,1,1),
(90003,46346,0,1,1,1,1),
(90003,46347,0,1,1,1,1),
(90003,46350,0,1,1,1,1),
(90003,46351,0,1,1,1,1),

(90003,33470,25,1,0,2,7), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
(90003,43852,15,1,0,1,1); -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal


-- ReferenzLoot 25mann
DELETE FROM `reference_loot_template` WHERE entry = 90004;
INSERT INTO `reference_loot_template` (entry,item,ChanceOrQuestChance,lootmode,groupid,mincountOrRef,maxcount)
VALUES
(90004,45538,0,1,1,1,1),
(90004,45539,0,1,1,1,1),
(90004,45540,0,1,1,1,1),
(90004,45541,0,1,1,1,1),
(90004,45542,0,1,1,1,1),
(90004,45543,0,1,1,1,1),
(90004,45544,0,1,1,1,1),
(90004,45547,0,1,1,1,1),
(90004,45548,0,1,1,1,1),
(90004,45549,0,1,1,1,1),
(90004,45605,0,1,1,1,1),

(90004,33470,25,1,0,2,7), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
(90004,43852,15,1,0,1,1), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
(90004,33454, 2,1,0,1,1); -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25

-- Loot for Elder Ironbranch, ID: 32913

UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=32913;
UPDATE `creature_template` SET `type_flags` = `type_flags` |256 WHERE `entry`=32913; -- Make mob herbable

-- Loot for Elder Stonebark, ID: 32914

DELETE FROM `creature_loot_template` where `entry` = 32914;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 32914, 36904, 0.1, 1, 0, 1, 1 ) -- Tiger Lily, item level: 72, quality: NORMAL//WHITE, mode: Outdoor/Dungeon
;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=32914;
UPDATE `creature_template` SET `type_flags` = `type_flags` |256 WHERE `entry`=32914; -- Make mob herbable

-- Loot for Elder Brightleaf, ID: 32915

DELETE FROM `creature_loot_template` where `entry` = 32915;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 32915, 37704, 0.1, 1, 0, 2, 2 ) -- Crystallized Life, item level: 75, quality: NORMAL//WHITE, mode: Outdoor/Dungeon
;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=32915;
UPDATE `creature_template` SET `type_flags` = `type_flags` |256 WHERE `entry`=32915; -- Make mob herbable

-- Loot for Corrupted Servitor, ID: 33354 and 33729 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33354;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33354, 36174, 1.4, 1, 0, 1, 1 ), -- Geist Gloves, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 33354, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33729;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33729, 33422, 0.8, 1, 0, 1, 1 ), -- Shattered Bow, item level: 125, quality: POOR//GREY, mode: Normal 25
( 33729, 90004 ,   3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=33354;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=33729;
UPDATE `creature_template` SET `type_flags` = `type_flags` |256 WHERE `entry`=33354; -- Make mob herbable
UPDATE `creature_template` SET `type_flags` = `type_flags` |256 WHERE `entry`=33729; -- Make mob herbable

-- Loot for Mangrove Ent, ID: 33525 and 33735 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33525;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33525, 33470, 25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 33525, 43852, 15, 1, 0, 1, 1 ) -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
;

DELETE FROM `creature_loot_template` where `entry` = 33735;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33735, 33470, 25,  1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 33735, 43852, 15,  1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 33735, 33454,  2, 80, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Unknown 80
( 33735, 36269,  1,  1, 0, 1, 1 ) -- Ulduar Breastplate, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 25
;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=33525;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=33735;
UPDATE `creature_template` SET `type_flags` = `type_flags` |256 WHERE `entry`=33525; -- Make mob herbable
UPDATE `creature_template` SET `type_flags` = `type_flags` |256 WHERE `entry`=33735; -- Make mob herbable

-- Loot for Ironroot Lasher, ID: 33526 and 33734 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33526;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33526, 33470,  25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 33526, 43852,  15, 1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 33526, 36570, 0.7, 1, 0, 1, 1 ) -- Corrupted Scythes, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
;
DELETE FROM `creature_loot_template` where `entry` = 33734;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33734, 33470,  25,  1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 33734, 43852,  15,  1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 33734, 36056,   1,  1, 0, 1, 1 ), -- Vizier Leggings, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33734, 36064, 0.3, 64, 0, 1, 1 ), -- Coldwraith Pants, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33734, 36280, 0.2, 64, 0, 1, 1 ) -- Spiderlord Legguards, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
;
-- Loot for Nature s Blade, ID: 33527 and 33741 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33527;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33527, 36382, 1, 1, 0, 1, 1 ), -- Golem Gauntlets, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 10
( 33527, 90003 , 3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33741;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33741, 90004 , 3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Misguided Nymph, ID: 33355 and 33737 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33355;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33355, 36053,  3, 1, 0, 1, 1 ), -- Vizier Robe, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 33355, 90003 ,  3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33737;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33737, 36540,  2, 1, 0, 1, 1 ), -- Petrified Sword, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 25
( 33737, 90004 ,  3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Guardian Lasher, ID: 33430 and 33732 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33430;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33430, 33470, 25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 33430, 43852, 15, 1, 0, 1, 1 ) -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
;
DELETE FROM `creature_loot_template` where `entry` = 33732;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33732, 33417, 1.5, 1, 0, 1, 1 ), -- Frost-Worn Plate Pants, item level: 132, quality: POOR//GREY, mode: Normal 25
( 33732, 90004 ,   3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=33430;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=33732;
UPDATE `creature_template` SET `type_flags` =`type_flags`|256 WHERE `entry`=33430;-- Makes Mob herbable
UPDATE `creature_template` SET `type_flags` =`type_flags`|256 WHERE `entry`=33732;-- Makes Mob herbable

-- Loot for Forest Swarmer, ID: 33431 and 33731 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33431;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33431, 33470, 22.987514, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 33431, 43852, 15.833929, 1, 0, 1, 1 ) -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
;
DELETE FROM `creature_loot_template` where `entry` = 33731;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33731, 33470, 22.987514,  1, 88, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 33731, 43852, 15.833929,  1,  0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 33731, 36428, 0.6796523,  1, 64, 1, 1 ), -- Bouquet Ring, item level: 174, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33731, 36444, 0.295501,   1, 64, 1, 1 ), -- Ice Encrusted Amulet, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33731, 36389, 0.2684134,  1, 64, 1, 1 ), -- Revenant Armor, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33731, 33403, 0.26348838, 1, 64, 1, 1 ) -- Frigid Mail Shoulderpads, item level: 132, quality: POOR//GREY, mode: Unknown 64
;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=33431;
UPDATE `creature_template` SET `skinloot`=100010 WHERE `entry`=33731;
UPDATE `creature_template` SET `type_flags` =`type_flags`|256 WHERE `entry`=33431;-- Makes Mob herbable
UPDATE `creature_template` SET `type_flags` =`type_flags`|256 WHERE `entry`=33731;-- Makes Mob herbable

-- Loot for Guardian of Life, ID: 33528 and 33733 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33528;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33528, 90003 ,  3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33733;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33733, 36682,  2, 1, 0, 1, 1 ), -- Seduced Blade, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 25
( 33733, 33447,  3, 1, 0, 1, 1 ), -- Runic Healing Potion, item level: 80, quality: NORMAL//WHITE, mode: Normal 25
( 33733, 90004 ,  3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Storm Tempered Keeper, ID: 33699 and 33700

DELETE FROM `creature_loot_template` where `entry` = 33699;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33699, 39220,    3,  1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal 10
( 33699, 33423,  1.3,  1, 0, 1, 1 ), -- Rime-Covered Mace, item level: 125, quality: POOR//GREY, mode: Normal 10
( 33699, 36289, 0.25, 32, 0, 1, 1 ), -- Spectral Mantle, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 32
( 33699, 90003 ,    3,  1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33700;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33700, 33470,  25,  1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 33700, 43852,  15, 88, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Unknown 88
( 33700, 33454,   2,  1, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25
( 33700, 33447,   1,  1, 0, 1, 1 ), -- Runic Healing Potion, item level: 80, quality: NORMAL//WHITE, mode: Normal 25
( 33700, 36393, 0.2, 64, 0, 1, 1 ) -- Revenant Epaulets, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=33699;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=33700;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=33699;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=33700;-- Makes Mob mineable

-- Loot for Storm Tempered Keeper, ID: 33722 and 33723 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33722;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33722, 39220,  3, 1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal 10
( 33722, 90003 ,  3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33723;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33723, 33470,  25,  1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 33723, 43852,  15,  1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 33723, 33454,   2,  1, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25
( 33723, 33445, 1.2,  1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 33723, 36053, 0.6,  1, 0, 1, 1 ), -- Vizier Robe, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33723, 36051, 0.6,  1, 0, 1, 1 ), -- Vizier Sash, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33723, 33427, 0.5, 64, 0, 1, 1 ), -- Frost-Encrusted Rifle, item level: 125, quality: POOR//GREY, mode: Unknown 64
( 33723, 36058, 0.3, 64, 0, 1, 1 ), -- Vizier Bracelets, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33723, 36057, 0.3, 64, 0, 1, 1 ), -- Vizier Mantle, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33723, 43465, 0.1, 64, 0, 1, 1 ) -- Scroll of Strength VII, item level: 80, quality: NORMAL//WHITE, mode: Unknown 64
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=33722;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=33723;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=33722;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=33723;-- Makes Mob mineable

-- Loot for Faceless Horror, ID: 33772 and 33773 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33772;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33772, 36166, 0.7,  1, 0, 1, 1 ), -- Webspinner Gloves, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 33772, 90003 ,   3,  1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33773;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33773, 33448,   1,  1, 0, 1, 1 ), -- Runic Mana Potion, item level: 80, quality: NORMAL//WHITE, mode: Normal 25
( 33773, 33384,   1,  1, 0, 1, 1 ), -- Frozen Pants, item level: 132, quality: POOR//GREY, mode: Normal 25
( 33773, 36053, 0.4, 64, 0, 1, 1 ), -- Vizier Robe, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33773, 36065, 0.2, 64, 0, 1, 1 ), -- Coldwraith Mantle, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33773, 90004 ,   3,  1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Twilight Adherent, ID: 33818 and 33827 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33818;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33818, 36280, 0.8, 1, 0, 1, 1 ), -- Spiderlord Legguards, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 33818, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33827;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33827, 33447,   3, 1, 0, 1, 5 ), -- Runic Healing Potion, item level: 80, quality: NORMAL//WHITE, mode: Normal 25
( 33827, 36053,   3, 1, 0, 1, 1 ), -- Vizier Robe, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33827, 36443, 0.8, 1, 0, 1, 1 ), -- Platinum Medallion, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33827, 43508, 0.8, 1, 0, 1, 1 ), -- Recipe: Last Weeks Mammoth, item level: 75, quality: UNCOMMON//GREEN, mode: Normal 25
( 33827, 90004 ,   3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Twilight Frost Mage, ID: 33819 and 33829 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33819;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33819, 36400, 0.8, 1, 0, 1, 1 ), -- Necropolis Legplates, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 33819, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33829;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33829, 33470,  25, 88, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 33829, 43852,  15,  1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 33829, 33454, 2.5, 80, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Unknown 80
( 33829, 36064,   2,  1, 0, 1, 1 ), -- Coldwraith Pants, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 25
( 33829, 33447, 2.8,  1, 0, 1, 1 ), -- Runic Healing Potion, item level: 80, quality: NORMAL//WHITE, mode: Normal 25
( 33829, 33445,   1,  1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 33829, 36278,   1,  1, 0, 1, 1 ), -- Spiderlord Gauntlets, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33829, 36065, 0.7,  1, 0, 1, 1 ), -- Coldwraith Mantle, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 25
( 33829, 33365, 0.7,  1, 0, 1, 1 ), -- Frost-Rimed Cloth Belt, item level: 132, quality: POOR//GREY, mode: Normal 25
( 33829, 36388, 0.3, 64, 0, 1, 1 ) -- Revenant Greaves, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
;
-- Loot for Twilight Pyromancer, ID: 33820 and 33830 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33820;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33820, 36286,   1, 1, 0, 1, 1 ), -- Spectral Gauntlets, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 33820, 36277,   1, 1, 0, 1, 1 ), -- Spiderlord Chestpiece, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33820, 36541,   1, 1, 0, 1, 1 ), -- Wintry Claymore, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 33820, 33384, 0.7, 1, 0, 1, 1 ), -- Frozen Pants, item level: 132, quality: POOR//GREY, mode: Normal 10
( 33820, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33830;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33830, 33470, 25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 33830, 43852, 15, 1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 33830, 33454,  2, 1, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25
( 33830, 33424,  2, 1, 0, 1, 1 ), -- Cracked Iron Staff, item level: 125, quality: POOR//GREY, mode: Normal 25
( 33830, 36277,  1, 1, 0, 1, 1 ) -- Spiderlord Chestpiece, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
;
-- Loot for Twilight Guardian, ID: 33822 and 33828 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33822;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33822, 33434, 1, 1, 0, 1, 1 ), -- Frozen Leather Helmet, item level: 132, quality: POOR//GREY, mode: Normal 10
( 33822, 90003 , 3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33828;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33828, 33445,   2,  1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 33828, 36430,   1,  1, 0, 1, 1 ), -- Puzzle Ring, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 25
( 33828, 36058,   1,  1, 0, 1, 1 ), -- Vizier Bracelets, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33828, 36400, 0.7,  1, 0, 1, 1 ), -- Necropolis Legplates, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 25
( 33828, 33419, 0.7,  1, 0, 1, 1 ), -- Frost-Worn Plate Shoulderpads, item level: 132, quality: POOR//GREY, mode: Normal 25
( 33828, 36667, 0.3, 64, 0, 1, 1 ), -- Solid Ice Wand, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33828, 36056, 0.3, 64, 0, 1, 1 ), -- Vizier Leggings, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33828, 36064, 0.3, 64, 0, 1, 1 ), -- Coldwraith Pants, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 33828, 90004 ,   3,  1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Twilight Slayer, ID: 33823 and 33832 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33823;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33823, 36064, 0.7, 1, 0, 1, 1 ), -- Coldwraith Pants, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 33823, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33832;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33832, 33470,  25, 88, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 33832, 43852,  15, 88, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Unknown 88
( 33832, 33454,  10,  1, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25
( 33832, 36052,   1,  1, 0, 1, 1 ), -- Vizier Slippers, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 33832, 36416, 0.3, 64, 0, 1, 1 ) -- Regal Cloak, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
;
-- Loot for Twilight Shadowblade, ID: 33824 and 33831 25-Version

DELETE FROM `creature_loot_template` where `entry` = 33824;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33824, 90003 , 3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 33831;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 33831, 90004 , 3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Assault Bot, ID: 34057 and 34115 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34057;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34057, 46029, 100, 1, 0, 1, 1 ) -- Magnetic Core, item level: 1, quality: NORMAL//WHITE, mode: Normal
;
DELETE FROM `creature_loot_template` where `entry` = 34115;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34115, 46029, 100, 1, 0, 1, 1 ) -- Magnetic Core, item level: 1, quality: NORMAL//WHITE, mode: Normal
;
-- Loot for Molten Colossus, ID: 34069 and 34185 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34069;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34069, 39220, 2, 1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal 10
( 34069, 36597, 1, 1, 0, 1, 1 ), -- Ice-Splintering Axe, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 34069, 36065, 1, 1, 0, 1, 1 ), -- Coldwraith Mantle, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 34069, 33397, 1, 1, 0, 1, 1 ), -- Frigid Mail Armor, item level: 132, quality: POOR//GREY, mode: Normal 10
( 34069, 90003 , 3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34185;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34185, 36681,   1,  1, 0, 1, 1 ), -- Wisdom Carver, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34185, 36667, 0.8, 64, 0, 1, 1 ), -- Solid Ice Wand, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34185, 33445, 0.6,  1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 34185, 36542, 0.2, 64, 0, 1, 1 ), -- Invasion Blade, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34185, 90004 ,   3,  1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34069;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34185;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34069;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34185;-- Makes Mob mineable

-- Loot for Forge Construct, ID: 34085 and 34186 25-Version
--
DELETE FROM `creature_loot_template` where `entry` = 34085;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34085, 39220, 4.5, 1, 0, 6, 8 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal 10
( 34085, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34186;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34085, 33470,  25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 34085, 43852,  15, 1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34186, 33454,   1, 1, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25
( 34186, 33424, 0.7, 1, 0, 1, 1 ), -- Cracked Iron Staff, item level: 125, quality: POOR//GREY, mode: Normal 25
( 34186, 36387, 0.6, 1, 0, 1, 1 ), -- Revenant Belt, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34186, 36443, 0.4, 1, 0, 1, 1 ) -- Platinum Medallion, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
;
UPDATE `creature_template` SET `skinloot`=100009 WHERE `entry`=34085;
UPDATE `creature_template` SET `skinloot`=100009 WHERE `entry`=34186;
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34085;-- Make Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34186;-- Make Mob mineable
-- Loot for Magma Rager, ID: 34086 and 34201 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34086;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34086, 33470, 25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34086, 43852, 15, 1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34086, 36056,  1, 1, 0, 1, 1 ), -- Vizier Leggings, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 34086, 33401,  1, 1, 0, 1, 1 ) -- Frigid Mail Gloves, item level: 132, quality: POOR//GREY, mode: Normal 10
;
DELETE FROM `creature_loot_template` where `entry` = 34201;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34201, 39220, 3, 1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal 25
( 34201, 33445, 1, 1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 34201, 45538, 2, 1, 0, 1, 1 ), -- Titanstone Pendant, item level: 226, quality: EPIC//PURPLE, mode: Normal 25
( 34201, 90004 , 3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34086;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34201;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34086;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34201;-- Makes Mob mineable

-- Loot for Champion of Hodir, ID: 34133 and 34139 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34133;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34133, 90003 , 3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34139;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34139, 36054, 1, 1, 0, 1, 1 ), -- Vizier Gloves, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34139, 90004 , 3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Winter Revenant, ID: 34134 and 34141 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34134;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34134, 39220, 4, 1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal 10
( 34134, 36682, 1, 1, 0, 1, 1 ), -- Seduced Blade, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 34134, 90003 , 3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34141;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34141, 33445, 0.8, 1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 34141, 36380, 0.8, 1, 0, 1, 1 ), -- Golem Sabatons, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 25
( 34141, 33365, 0.6, 1, 0, 1, 1 ), -- Frost-Rimed Cloth Belt, item level: 132, quality: POOR//GREY, mode: Normal 25
( 34141, 33419, 0.5, 1, 0, 1, 1 ), -- Frost-Worn Plate Shoulderpads, item level: 132, quality: POOR//GREY, mode: Normal 25
( 34141, 90004 ,   3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34134;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34141;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34134;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34141;-- Makes Mob mineable

-- Loot for Winter Rumbler, ID: 34135 and 34142 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34135;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34135, 33470,  25, 88, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 34135, 43852,  15, 88, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Unknown 88
( 34135, 39220,   4,  1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal
( 34135, 36177, 0.2, 32, 0, 1, 1 ) -- Geist Shoulders, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 32
;
DELETE FROM `creature_loot_template` where `entry` = 34142;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34142, 39220,   4,  1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal
( 34142, 36430, 0.7,  1, 0, 1, 1 ), -- Puzzle Ring, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 25
( 34142, 36396, 0.2, 64, 0, 1, 1 ), -- Necropolis Sabatons, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34142, 90004 ,   3,  1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34135;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34142;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34135;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34142;-- Makes Mob mineable

-- Loot for Winter Jormungar, ID: 34137 and 34140 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34137;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34137, 33470,  25,  1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34137, 43852,  15, 88, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Unknown 88
( 34137, 33568,   3,  1, 0, 1, 1 ), -- Borean Leather, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34137, 36667, 0.3, 32, 0, 1, 1 ) -- Solid Ice Wand, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 32
;
DELETE FROM `creature_loot_template` where `entry` = 34140;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34140, 33470,  25,  1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34140, 43852,  15, 88, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Unknown 88
( 34140, 33568,   3,  1, 0, 1, 1 ), -- Borean Leather, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34140, 33454, 1.5, 80, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Unknown 80
( 34140, 33445, 0.7, 64, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Unknown 64
( 34140, 33400, 0.4, 64, 0, 1, 1 ), -- Frigid Mail Bracers, item level: 132, quality: POOR//GREY, mode: Unknown 64
( 34140, 33447, 0.4, 64, 0, 1, 1 ), -- Runic Healing Potion, item level: 80, quality: NORMAL//WHITE, mode: Unknown 64
( 34140, 36682, 0.4, 64, 0, 1, 1 ), -- Seduced Blade, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34140, 36060, 0.4, 64, 0, 1, 1 ), -- Coldwraith Boots, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34140, 36276, 0.3, 64, 0, 1, 1 ), -- Spiderlord Boots, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34140, 43509, 0.3, 64, 0, 1, 1 ), -- Recipe: Bad Clams, item level: 75, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34140, 33399, 0.3, 64, 0, 1, 1 ), -- Frigid Mail Boots, item level: 132, quality: POOR//GREY, mode: Unknown 64
( 34140, 33371, 0.2, 64, 0, 1, 1 ), -- Frost-Rimed Cloth Vest, item level: 132, quality: POOR//GREY, mode: Unknown 64
( 34140, 36401, 0.2, 64, 0, 1, 1 ), -- Necropolis Epaulets, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34140, 36457, 0.2, 64, 0, 1, 1 ), -- Ivory Shield, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34140, 36541, 0.1, 64, 0, 1, 1 ), -- Wintry Claymore, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34140, 36556, 0.1, 64, 0, 1, 1 ) -- Apocalyptic Staff, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
;
UPDATE `creature_template` SET `skinloot`=70207 WHERE `entry`=34137;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=70207 WHERE `entry`=34140;-- Adds Skinloot
-- Loot for Arachnopod Destroyer, ID: 34183 and 34214 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34183;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34183, 33433,   3, 1, 0, 1, 1 ), -- Frigid Mail Circlet, item level: 132, quality: POOR//GREY, mode: Normal 10
( 34183, 36058,   2, 1, 0, 1, 1 ), -- Vizier Bracelets, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 34183, 33403,   1, 1, 0, 1, 1 ), -- Frigid Mail Shoulderpads, item level: 132, quality: POOR//GREY, mode: Normal 10
( 34183, 36147, 0.8, 1, 0, 1, 1 ), -- Pygmy Belt, item level: 170, quality: UNCOMMON//GREEN, mode: Normal 10
( 34183, 36155, 0.8, 1, 0, 1, 1 ), -- Wendigo Girdle, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 10
( 34183, 36666, 0.8, 1, 0, 1, 1 ), -- Polar Wand, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 10
( 34183, 33428, 0.8, 1, 0, 1, 1 ), -- Dulled Shiv, item level: 125, quality: POOR//GREY, mode: Normal 10
( 34183, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34214;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34214, 36045, 1, 1, 0, 1, 1 ), -- Crystalsong Robe, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 25
( 34214, 36282, 1, 1, 0, 1, 1 ), -- Spiderlord Bracers, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34214, 43624, 1, 1, 0, 1, 1 ), -- Titanium Lockbox, item level: 78, quality: RARE//BLUE, mode: Normal 25
( 34214, 43509, 1, 1, 0, 1, 1 ), -- Recipe: Bad Clams, item level: 75, quality: UNCOMMON//GREEN, mode: Normal 25
( 34214, 90004 , 3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Hardened Iron Golem, ID: 34190 and 34229 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34190;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34190, 39220, 3, 1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal 10
( 34190, 33431, 1, 1, 0, 1, 1 ), -- Icesmashing Mace, item level: 125, quality: POOR//GREY, mode: Normal 10
( 34190, 33424, 1, 1, 0, 1, 1 ), -- Cracked Iron Staff, item level: 125, quality: POOR//GREY, mode: Normal 10
( 34190, 90003 , 3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34229;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34229, 36429,   1, 64, 0, 1, 1 ), -- Spur Ring, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34229, 36391,   1,  1, 0, 1, 1 ), -- Revenant Helmet, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34229, 36390, 0.7,  1, 0, 1, 1 ), -- Revenant Gauntlets, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34229, 36282, 0.5, 64, 0, 1, 1 ), -- Spiderlord Bracers, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34229, 36286, 0.3, 64, 0, 1, 1 ), -- Spectral Gauntlets, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34229, 36709, 0.2, 64, 0, 1, 1 ), -- Crystal Woodstaff, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34229, 33380, 0.2, 64, 0, 1, 1 ), -- Frozen Belt, item level: 132, quality: POOR//GREY, mode: Unknown 64
( 34229, 33414, 0.2, 64, 0, 1, 1 ), -- Frost-Worn Plate Bracers, item level: 132, quality: POOR//GREY, mode: Unknown 64
( 34229, 36611, 0.1, 64, 0, 1, 1 ), -- Bleak Scythe, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34229, 90004 ,   3,  1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34190;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34229;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34190;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34229;-- Makes Mob mineable

-- Loot for Trash, ID: 34191 and 34217 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34191;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34191, 41338, 44, 1, 0, 1, 3 ), -- Sprung Whirlygig, item level: 1, quality: POOR//GREY, mode: Normal
( 34191, 41337, 40, 1, 0, 1, 3 ), -- Whizzed-Out Gizmo, item level: 1, quality: POOR//GREY, mode: Normal
( 34191, 39690, 10, 1, 0, 1, 3 ), -- Volatile Blasting Trigger, item level: 72, quality: NORMAL//WHITE, mode: Normal
( 34191, 39681,  5, 1, 0, 2, 4 ), -- Handful of Cobalt Bolts, item level: 71, quality: NORMAL//WHITE, mode: Normal
( 34191, 39683,  1, 1, 0, 1, 1 ) -- Froststeel Tube, item level: 70, quality: NORMAL//WHITE, mode: Normal 10
;
DELETE FROM `creature_loot_template` where `entry` = 34217;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34217, 41338, 44, 1, 0, 1, 3 ), -- Sprung Whirlygig, item level: 1, quality: POOR//GREY, mode: Normal
( 34217, 41337, 40, 1, 0, 1, 3 ), -- Whizzed-Out Gizmo, item level: 1, quality: POOR//GREY, mode: Normal
( 34217, 39690, 10, 1, 0, 1, 3 ), -- Volatile Blasting Trigger, item level: 72, quality: NORMAL//WHITE, mode: Normal
( 34217, 39681, 5, 1, 0, 2, 4 ) -- Handful of Cobalt Bolts, item level: 71, quality: NORMAL//WHITE, mode: Normal
;

-- Loot for Clockwork Sapper, ID: 34193 and 34220 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34193;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34193, 36511, 0.1, 32, 0, 1, 1 ), -- Arctic War Hammer, item level: 170, quality: UNCOMMON//GREEN, mode: Unknown 32
( 34193, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34220;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34220, 36393, 2, 1, 0, 1, 1 ), -- Revenant Epaulets, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34220, 90004 , 3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Rune Etched Sentry, ID: 34196 and 34245 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34196;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34196, 33470,  25, 88, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 34196, 43852,  15,  1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34196, 39220, 3.5,  1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal
( 34196, 36064, 1.2,  1, 0, 1, 1 ), -- Coldwraith Pants, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 34196, 36392, 1.2,  1, 0, 1, 1 ), -- Revenant Legguards, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 34196, 36399,   1,  1, 0, 1, 1 ) -- Necropolis Helm, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
;
DELETE FROM `creature_loot_template` where `entry` = 34245;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34245, 39220, 3.5,  1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal
( 34245, 36059, 0.8,  1, 0, 1, 1 ), -- Coldwraith Sash, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 25
( 34245, 36430, 0.8, 64, 0, 1, 1 ), -- Puzzle Ring, item level: 182, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34245, 33447, 0.6,  1, 0, 1, 1 ), -- Runic Healing Potion, item level: 80, quality: NORMAL//WHITE, mode: Normal 25
( 34245, 33385, 0.3, 64, 0, 1, 1 ), -- Frozen Shoulderpads, item level: 132, quality: POOR//GREY, mode: Unknown 64
( 34245, 90004 ,   3,  1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34196;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34245;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34196;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34245;-- Makes Mob mineable

-- Loot for Chamber Overseer, ID: 34197 and 34226 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34197;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34197, 39220, 3.5, 1, 0, 1, 1 ), -- Geodesic Fragments, item level: 1, quality: POOR//GREY, mode: Normal 10
( 34197, 36396, 1.3, 1, 0, 1, 1 ), -- Necropolis Sabatons, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 34197, 37835, 0.1, 32, 0, 1, 1 ), -- JeTzes Bell, item level: 200, quality: EPIC//PURPLE, mode: Unknown 32
( 34197, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34226;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34226, 33445,   2,  1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 34226, 36166, 0.4, 64, 0, 1, 1 ), -- Webspinner Gloves, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34226, 36281, 0.3, 64, 0, 1, 1 ), -- Spiderlord Spaulders, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34226, 90004 ,   3,  1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34197;-- Adds Skinloot
UPDATE `creature_template` SET `skinloot`=100011 WHERE `entry`=34226;-- Adds Skinloot
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34197;-- Makes Mob mineable
UPDATE `creature_template` SET `type_flags` =`type_flags`|512 WHERE `entry`=34226;-- Makes Mob mineable

-- Loot for Iron Mender, ID: 34198 and 34236 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34198;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34198, 33470,  25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34198, 43852,  15, 1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34198, 33423, 1.3, 1, 0, 1, 1 ), -- Rime-Covered Mace, item level: 125, quality: POOR//GREY, mode: Normal 10
( 34198, 36443,   1, 1, 0, 1, 1 ), -- Platinum Medallion, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 34198, 33426,   1, 1, 0, 1, 1 ), -- Chipped Timber Axe, item level: 125, quality: POOR//GREY, mode: Normal 10
( 34198, 36626, 0.6, 1, 0, 1, 1 ) -- Military Compound Bow, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
;
DELETE FROM `creature_loot_template` where `entry` = 34236;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34236, 36430, 2, 1, 0, 1, 1 ), -- Puzzle Ring, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 25
( 34236, 45912, 2, 1, 0, 1, 1 ), -- Book of Glyph Mastery, item level: 80, quality: UNCOMMON//GREEN, mode: Normal 25
( 34236, 90004 , 3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Lightning Charged Iron Dwarf, ID: 34199 and 34237 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34199;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34199, 33470,  25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34199, 43852,  15, 1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34199, 36178,   1, 1, 0, 1, 1 ), -- Geist Wristguards, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
( 34199, 36171, 0.8, 1, 0, 1, 1 ) -- Geist Belt, item level: 182, quality: UNCOMMON//GREEN, mode: Normal 10
;
DELETE FROM `creature_loot_template` where `entry` = 34237;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34237, 45540, 1.4, 1, 0, 1, 1 ), -- Bladebearers Signet, item level: 226, quality: EPIC//PURPLE, mode: Normal 25
( 34237, 33445, 1.4, 1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 34237, 36429, 1.2, 1, 0, 1, 1 ), -- Spur Ring, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34237, 90004 ,   3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for Parts Recovery Technician, ID: 34267 and 34268 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34267;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34267, 33470,  25,  1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34267, 43852,  15,  1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34267, 36277,   1,  1, 0, 1, 1 ), -- Spiderlord Chestpiece, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 10
( 34267, 36045, 0.3, 32, 0, 1, 1 ) -- Crystalsong Robe, item level: 174, quality: UNCOMMON//GREEN, mode: Unknown 32
;
DELETE FROM `creature_loot_template` where `entry` = 34268;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34268, 33470,  25, 1, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Normal
( 34268, 43852,  15, 1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34268, 36042,   1, 1, 0, 1, 1 ), -- Condor Bindings, item level: 170, quality: UNCOMMON//GREEN, mode: Normal 25
( 34268, 33454,   1, 1, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25
( 34268, 36037, 0.6, 1, 0, 1, 1 ), -- Condor Robe, item level: 170, quality: UNCOMMON//GREEN, mode: Normal 25
( 34268, 33445, 0.5, 1, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Normal 25
( 34268, 36375, 0.4, 1, 0, 1, 1 ) -- Kraken Helm, item level: 170, quality: UNCOMMON//GREEN, mode: Normal 25
;
-- Loot for XR-949 Salvagebot, ID: 34269 and 34270 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34269;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34269, 43509, 1.2, 1, 0, 1, 1 ), -- Recipe: Bad Clams, item level: 75, quality: UNCOMMON//GREEN, mode: Normal 10
( 34269, 33426,   1, 1, 0, 1, 1 ), -- Chipped Timber Axe, item level: 125, quality: POOR//GREY, mode: Normal 10
( 34269, 90003 ,   3, 1, 1, -90003, 1) -- Reference Loot ... Epic 10 Mann
;
DELETE FROM `creature_loot_template` where `entry` = 34270;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34270, 33470,  25, 88, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 34270, 43852,  15, 88, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Unknown 88
( 34270, 33454, 1.4,  1, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25
( 34270, 33447, 3.2,  1, 0, 1, 1 ), -- Runic Healing Potion, item level: 80, quality: NORMAL//WHITE, mode: Normal 25
( 34270, 33445, 0.6, 64, 0, 1, 1 ), -- Honeymint Tea, item level: 85, quality: NORMAL//WHITE, mode: Unknown 64
( 34270, 37761, 0.5,  1, 0, 1, 1 ), -- Shimmerthread Girdle, item level: 174, quality: RARE//BLUE, mode: Normal 25
( 34270, 33428, 0.4, 64, 0, 1, 1 ) -- Dulled Shiv, item level: 125, quality: POOR//GREY, mode: Unknown 64
;
-- Loot for XD-175 Compactobot, ID: 34271 and 34272 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34271;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34271, 33470,  25, 88, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 34271, 43852,  15, 88, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Unknown 88
( 34271, 36383, 1.2,  1, 0, 1, 1 ), -- Golem Helmet, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 10
( 34271, 33384, 0.8,  1, 0, 1, 1 ) -- Frozen Pants, item level: 132, quality: POOR//GREY, mode: Normal 10
;
DELETE FROM `creature_loot_template` where `entry` = 34272;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34272, 33427, 0.6, 64, 0, 1, 1 ), -- Frost-Encrusted Rifle, item level: 125, quality: POOR//GREY, mode: Unknown 64
( 34272, 36457, 0.6,  1, 0, 1, 1 ), -- Ivory Shield, item level: 178, quality: UNCOMMON//GREEN, mode: Normal 25
( 34272, 33423, 0.5, 64, 0, 1, 1 ), -- Rime-Covered Mace, item level: 125, quality: POOR//GREY, mode: Unknown 64
( 34272, 43465, 0.5,  1, 0, 1, 1 ), -- Scroll of Strength VII, item level: 80, quality: NORMAL//WHITE, mode: Normal 25
( 34272, 36665, 0.4, 64, 0, 1, 1 ), -- Wasteland Wand, item level: 170, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34272, 36695, 0.4, 64, 0, 1, 1 ), -- Dogmatic Scepter, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34272, 36153, 0.2, 64, 0, 1, 1 ), -- Pygmy Shoulders, item level: 170, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34272, 36624, 0.1, 64, 0, 1, 1 ), -- Shrieking Bow, item level: 174, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34272, 90004 , 3, 1, 1, -90004, 1) -- Reference Loot ... Epic 25 Mann
;
-- Loot for XB-488 Disposalbot, ID: 34273 and 34274 25-Version

DELETE FROM `creature_loot_template` where `entry` = 34273;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34273, 33470,  25, 88, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 34273, 43852,  15,  1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34273, 36386, 0.8,  1, 0, 1, 1 ) -- Golem Vambraces, item level: 174, quality: UNCOMMON//GREEN, mode: Normal 10
;
DELETE FROM `creature_loot_template` where `entry` = 34274;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES
( 34274, 33470,  25, 88, 0, 2, 7 ), -- Frostweave Cloth, item level: 70, quality: NORMAL//WHITE, mode: Unknown 88
( 34274, 43852,  15,  1, 0, 1, 1 ), -- Thick Fur Clothing Scraps, item level: 70, quality: POOR//GREY, mode: Normal
( 34274, 41337,   3,  1, 0, 1, 3 ), -- Whizzed-Out Gizmo, item level: 1, quality: POOR//GREY, mode: Normal 25
( 34274, 33454,   3,  1, 0, 1, 1 ), -- Salted Venison, item level: 75, quality: NORMAL//WHITE, mode: Normal 25
( 34274, 36665, 0.7,  1, 0, 1, 1 ), -- Wasteland Wand, item level: 170, quality: UNCOMMON//GREEN, mode: Normal 25
( 34274, 36667, 0.3, 64, 0, 1, 1 ), -- Solid Ice Wand, item level: 178, quality: UNCOMMON//GREEN, mode: Unknown 64
( 34274, 33401, 0.1, 64, 0, 1, 1 ), -- Frigid Mail Gloves, item level: 132, quality: POOR//GREY, mode: Unknown 64
( 34274, 36610, 0.1, 64, 0, 1, 1 ) -- Plagued Pike, item level: 174, quality: UNCOMMON//GREEN, mode: Unknown 64
;
