

/*柠檬公益动态*/
DROP TABLE IF EXISTS lemonDynamic;
CREATE TABLE lemonDynamic(
	id VARCHAR(32) NOT NULL COMMENT '柠檬公益动态表id标识',
	personalId VARCHAR(32) NULL COMMENT '编写者',
	title VARCHAR(255) NOT NULL COMMENT '标题',
	imgUrl VARCHAR(255) NOT NULL COMMENT '图片地址',
	content VARCHAR(255) NOT NULL COMMENT '内容',
	
  `cdate` DATETIME DEFAULT NULL COMMENT '创建时间',
  `mdate` DATETIME DEFAULT NULL COMMENT '最后修改时间',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建人',
  `uman` VARCHAR(32) DEFAULT NULL COMMENT '修改人',
  `df` INT(11) DEFAULT '0' COMMENT '是否删除',
  `version` INT(11) DEFAULT '0' COMMENT '数据版本',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


/*积分交易*/
DROP TABLE IF EXISTS integralTransaction;
CREATE TABLE integralTransaction(
	id VARCHAR(32) NOT NULL COMMENT '积分交易表id标识',
	personalId VARCHAR(32) NOT NULL COMMENT '积分发送者',
	lq_personalId VARCHAR(32) NULL  COMMENT '积分领取者',
	integral FLOAT NOT NULL COMMENT '积分',
	pwd VARCHAR(32) NOT NULL COMMENT '领取密匙',
	state INT(11) DEFAULT 0 COMMENT '状态,0=未领取,1=已领取',
	
  `cdate` DATETIME DEFAULT NULL COMMENT '创建时间',
  `mdate` DATETIME DEFAULT NULL COMMENT '最后修改时间',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建人',
  `uman` VARCHAR(32) DEFAULT NULL COMMENT '修改人',
  `df` INT(11) DEFAULT '0' COMMENT '是否删除',
  `version` INT(11) DEFAULT '0' COMMENT '数据版本',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;