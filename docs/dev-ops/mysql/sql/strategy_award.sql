CREATE TABLE `strategy_award` (
                                  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                  `award_id` int(8) NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
                                  `award_title` varchar(128) NOT NULL COMMENT '抽奖奖品标题',
                                  `award_subtitle` varchar(128) DEFAULT NULL COMMENT '抽奖奖品副标题',
                                  `award_count` int(8) NOT NULL DEFAULT '0' COMMENT '奖品库存总量',
                                  `award_count_surplus` int(8) NOT NULL DEFAULT '0' COMMENT '奖品库存剩余',
                                  `award_rate` decimal(6,4) NOT NULL COMMENT '奖品中奖概率',
                                  `rule_models` varchar(256) DEFAULT NULL COMMENT '规则模型，rule配置的模型同步到此表，便于使用',
                                  `sort` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                                  PRIMARY KEY (`id`),
                                  KEY `idx_strategy_id_award_id` (`strategy_id`,`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `strategy_award` WRITE;
/*!40000 ALTER TABLE `strategy_award` DISABLE KEYS */;

INSERT INTO `strategy_award` (`id`, `strategy_id`, `award_id`, `award_title`, `award_subtitle`, `award_count`, `award_count_surplus`, `award_rate`, `rule_models`, `sort`, `create_time`, `update_time`)
VALUES
    (1,100001,101,'随机积分',NULL,80000,80000,80.0000,'rule_random,rule_luck_award',1,'2023-12-09 09:38:31','2023-12-09 10:58:06'),
    (2,100001,102,'5次使用',NULL,10000,10000,10.0000,'rule_luck_award',2,'2023-12-09 09:39:18','2023-12-09 10:34:23'),
    (3,100001,103,'10次使用',NULL,5000,5000,5.0000,'rule_luck_award',3,'2023-12-09 09:42:36','2023-12-09 10:34:24'),
    (4,100001,104,'20次使用',NULL,4000,4000,4.0000,'rule_luck_award',4,'2023-12-09 09:43:15','2023-12-09 10:34:25'),
    (5,100001,105,'增加gpt-4对话模型',NULL,600,600,0.6000,'rule_luck_award',5,'2023-12-09 09:43:47','2023-12-09 10:34:26'),
    (6,100001,106,'增加dall-e-2画图模型',NULL,200,200,0.2000,'rule_luck_award',6,'2023-12-09 09:44:20','2023-12-09 10:34:26'),
    (7,100001,107,'增加dall-e-3画图模型','抽奖1次后解锁',200,200,0.2000,'rule_lock,rule_luck_award',7,'2023-12-09 09:45:38','2023-12-09 10:30:59'),
    (8,100001,108,'增加100次使用','抽奖2次后解锁',199,199,0.1999,'rule_lock,rule_luck_award',8,'2023-12-09 09:46:02','2023-12-09 12:20:52'),
    (9,100001,109,'解锁全部模型','抽奖6次后解锁',1,1,0.0001,'rule_lock,rule_luck_award',9,'2023-12-09 09:46:39','2023-12-09 12:20:50');