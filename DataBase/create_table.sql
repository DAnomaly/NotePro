-- member_info
CREATE TABLE `member_info` (
	`pid` INT(11) NOT NULL AUTO_INCREMENT,
	`oid` VARCHAR(16) NOT NULL COMMENT '노출키',
	`id` VARCHAR(50) NOT NULL COMMENT '아이디',
	`name` VARCHAR(50) NULL DEFAULT NULL COMMENT '사용자이름',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	`editdate` DATETIME NULL DEFAULT NULL COMMENT '정보수정일',
	`useyn` CHAR(1) NULL DEFAULT NULL COMMENT '사용여부',
	PRIMARY KEY (`pid`) USING BTREE,
	UNIQUE INDEX `id` (`id`) USING BTREE,
	UNIQUE INDEX `oid` (`oid`) USING BTREE
)
COMMENT='회원정보'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- project info
CREATE TABLE `project_info` (
	`pid` INT(11) NOT NULL AUTO_INCREMENT,
	`oid` VARCHAR(16) NOT NULL COMMENT '노출키',
	`title` VARCHAR(200) NOT NULL COMMENT '제목',
	`description` VARCHAR(500) NULL DEFAULT NULL COMMENT '설명',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	`editdate` DATETIME NULL DEFAULT NULL COMMENT '정보수정일',
	`openyn` CHAR(1) NULL DEFAULT NULL COMMENT '개봉여부',
	`useyn` CHAR(1) NULL DEFAULT NULL COMMENT '사용여부',
	PRIMARY KEY (`pid`) USING BTREE
)
COMMENT='프로젝트'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- issue_info
CREATE TABLE `issue_info` (
	`pid` INT(11) NOT NULL AUTO_INCREMENT,
	`project_pid` INT(11) NOT NULL COMMENT '프로젝트PID',
	`index` INT(11) NOT NULL COMMENT 'issue순번',
	`title` VARCHAR(200) NOT NULL COMMENT '제목',
	`description` VARCHAR(4000) NULL DEFAULT NULL COMMENT '설명',
	`repository` VARCHAR(400) NULL DEFAULT NULL COMMENT 'repository',
	`writer` INT(11) NOT NULL COMMENT '작성자',
	`editer` INT(11) NULL DEFAULT NULL COMMENT '최근수정자',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	`editdate` DATETIME NULL DEFAULT NULL COMMENT '수정일',
	`openyn` CHAR(1) NULL DEFAULT NULL COMMENT '개봉여부',
	PRIMARY KEY (`pid`) USING BTREE,
	INDEX `FK_issue_info_project_info` (`project_pid`) USING BTREE,
	INDEX `FK_issue_info_member_info_writer` (`writer`) USING BTREE,
	INDEX `FK_issue_info_member_info_editer` (`editer`) USING BTREE,
	CONSTRAINT `FK_issue_info_member_info_editer` FOREIGN KEY (`editer`) REFERENCES `notepro`.`member_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_issue_info_member_info_writer` FOREIGN KEY (`writer`) REFERENCES `notepro`.`member_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_issue_info_project_info` FOREIGN KEY (`project_pid`) REFERENCES `notepro`.`project_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COMMENT='이슈'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- tag_info
CREATE TABLE `tag_info` (
	`pid` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(60) NOT NULL COMMENT '이름',
	`color` VARCHAR(6) NOT NULL COMMENT '색상',
	`description` VARCHAR(200) NOT NULL COMMENT '설명',
	`project_pid` INT(11) NOT NULL COMMENT '프로젝트PID',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	`editdate` DATETIME NULL DEFAULT NULL COMMENT '수정일',
	PRIMARY KEY (`pid`) USING BTREE,
	INDEX `FK_tag_info_project_info` (`project_pid`) USING BTREE,
	CONSTRAINT `FK_tag_info_project_info` FOREIGN KEY (`project_pid`) REFERENCES `notepro`.`project_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COMMENT='태그'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- member_security
CREATE TABLE `memeber_security` (
	`pid` INT(11) NOT NULL AUTO_INCREMENT,
	`member_pid` INT(11) NOT NULL COMMENT '회원PID',
	`password` VARCHAR(256) NOT NULL COMMENT '비밀번호',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	PRIMARY KEY (`pid`) USING BTREE,
	UNIQUE INDEX `member_pid` (`member_pid`) USING BTREE,
	CONSTRAINT `FK_memeber_security_member_info` FOREIGN KEY (`member_pid`) REFERENCES `notepro`.`member_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COMMENT='회원정보(로그인)'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- member_info
CREATE TABLE `member_info` (
	`pid` INT(11) NOT NULL AUTO_INCREMENT,
	`oid` VARCHAR(16) NOT NULL COMMENT '노출키',
	`id` VARCHAR(50) NOT NULL COMMENT '아이디',
	`name` VARCHAR(50) NULL DEFAULT NULL COMMENT '사용자이름',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	`editdate` DATETIME NULL DEFAULT NULL COMMENT '정보수정일',
	`useyn` CHAR(1) NULL DEFAULT NULL COMMENT '사용여부',
	PRIMARY KEY (`pid`) USING BTREE,
	UNIQUE INDEX `id` (`id`) USING BTREE,
	UNIQUE INDEX `oid` (`oid`) USING BTREE
)
COMMENT='회원정보'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- project_access
CREATE TABLE `project_access` (
	`pid` INT(11) NOT NULL AUTO_INCREMENT,
	`project_pid` INT(11) NOT NULL COMMENT '프로젝트PID',
	`member_pid` INT(11) NOT NULL COMMENT '회원PID',
	`type` INT(2) NOT NULL COMMENT '접속Type',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	PRIMARY KEY (`pid`) USING BTREE,
	INDEX `FK_project_access_project_info` (`project_pid`) USING BTREE,
	INDEX `FK_project_access_member_info` (`member_pid`) USING BTREE,
	CONSTRAINT `FK_project_access_member_info` FOREIGN KEY (`member_pid`) REFERENCES `notepro`.`member_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_project_access_project_info` FOREIGN KEY (`project_pid`) REFERENCES `notepro`.`project_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COMMENT='프로젝트 접근권환'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- issue_tag
CREATE TABLE `issue_tag` (
	`pid` INT(11) NOT NULL AUTO_INCREMENT,
	`issue_pid` INT(11) NOT NULL COMMENT 'IssuePID',
	`tag_pid` INT(11) NOT NULL COMMENT '태그PID',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	PRIMARY KEY (`pid`) USING BTREE,
	INDEX `FK_issue_tag_issue_info` (`issue_pid`) USING BTREE,
	INDEX `FK_issue_tag_tag_info` (`tag_pid`) USING BTREE,
	CONSTRAINT `FK_issue_tag_issue_info` FOREIGN KEY (`issue_pid`) REFERENCES `notepro`.`issue_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_issue_tag_tag_info` FOREIGN KEY (`tag_pid`) REFERENCES `notepro`.`tag_info` (`pid`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COMMENT='이슈 태그목록'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

