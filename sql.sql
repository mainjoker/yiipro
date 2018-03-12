/*
用户表
*/
drop table if exists pro_users;
create table if not exists pro_users(
	`id` int unsigned  not null primary key AUTO_INCREMENT,
	`username` char(32) not null default '' comment '用户名称用于登录',
	`password` char(32) not null default '' comment '用户登录密码',
	`email` varchar(32) not null default '0' comment '用户可用邮箱登录',
	`createtime` int(11) not null default 0 comment '注册时间',
	`loginip` bigint(20) not null default 0 comment 'ip2long用整型存储',
	`islock` enum('0','1') not null default '0' comment '用户是否被锁定 默认没有:0'
)Engine=InnoDB default charset=utf8;

/*
用户信息
*/
drop table if exists pro_userinfo;
create table if not exists pro_userinfo(
	`userid` int unsigned not null default 0 comment '对应users表的主键id',
	`nickname` char(32) not null default '张三' comment '用户昵称',
	`sex` enum('0','1','2') default '0' comment '0:默认保密，1：男，2：女',
	`vartar` varchar(100) not null default '' comment '用户头像',
	`collection` text not null default '' comment '用户收藏，填商品id(1,2,3,4,5,6,7..)',
	`age` tinyint unsigned not null default 18 comment '用户年龄'	
)ENGINE=InnoDB default charset=utf8;

/*
用户地址列表
*/
drop table if exists pro_useraddress;
create table if not exists pro_useraddress(
	`userid` int unsigned not null default 0 comment '对应users表的主键id',
	`address` varchar(255) not null default '' comment '用户地址',
	`isdefault` enum('0','1') not null default 1 comment '是否是默认地址，默认是',
	key `useraddress_isdefault` (`isdefault`) 
)ENGINE=InnoDB default charset=utf8;


/*
后台管理员列表
*/
drop table if exists pro_adminusers;
create table if not exists pro_adminusers(
	`id` int unsigned  not null primary key AUTO_INCREMENT,
	`username` char(32) not null default '' comment '管理员名称用于登录',
	`password` char(32) not null default '' comment '登录密码',
	`email` varchar(32) not null default '0' comment '管理员邮箱',
	`createtime` int(11) not null default 0 comment '添加时间',
	`loginip` bigint(20) not null default 0 comment 'ip2long用整型存储',
	`islock` enum('0','1') not null default '0' comment '管理员是否被锁定 默认没有:0'
)Engine=InnoDB default charset=utf8;

/*
商品栏目列表
*/

drop table if exists pro_category;
create table if not exists pro_category(
	`id` int unsigned  not null primary key AUTO_INCREMENT,
	`topid` int unsigned not null default 0 comment '栏目顶级id',
	`parentid` int unsigned not null default 0 comment '栏目上级id',
	`name` varchar(80) not null default '' comment '栏目名称',
	`createtime` int(11) not null default 0 comment '添加时间'
)Engine=InnoDB default charset=utf8;

/*商品信息*/
drop table if exists pro_product;
create table if not exists pro_product(
	`id` int unsigned  not null primary key AUTO_INCREMENT,
	`cateid` int unsigned not null default 0 comment '商品所属栏目的id',
	`name` varchar(120) not null default '' comment '商品名称',
	`title` varchar(120) not null default '' comment '商品标题',
	`price` decimal(10,2) not null default '0.00' comment '商品价格',
	`description` text not null default '' comment '商品描述',
	`isbest` enum('0','1') not null default '1' comment '是否精品，默认是',
	`ishot` enum('0','1') not null default '1' comment '是否热销，默认是',
	`isnew` enum('0','1') not null default '1' comment '是否新品，默认是',
	`ison` enum('0','1') not null default '1' comment '是否上架商品，默认是',
	`issales` enum('0','1') not null default '1' comment '是否促销商品，默认不是',
	`saleprice` decimal(10,2) not null default '0.00' comment '促销价格',
	`starttime` int(11) not null default 0 comment '促销开始时间',
	`endtime` int(11) not null default 0 comment '促销结束时间',
	`addtime` int(11) not null default 0 comment '添加时间',
	`num` int not null default 1 comment '商品库存',
	`cover` varchar(255) not null default '1.jpg' comment '商品封面',
	`pics` text not null comment '商品其他图片',
	key `pro_product_cateid` (`cateid`)	
)Engine=InnoDB default charset=utf8;


/*购物车*/
drop table if exists pro_cart;
create table if not exists pro_cart(
	`id` int unsigned not null primary key  auto_increment,
	`uid` int not null default '0' comment '用户id',
	`productid` int not null default '0' comment '商品id',
	`price` decimal(10,2) not null default '0.00' comment '商品单价',
	`num` int not null default '0' comment '商品数量',
	`addtime` int(11) not null default '0' comment '添加时间',
	`updatetime` int(11) not null default '0' comment '购物车更新时间',
	key `pro_cart_uid` (`uid`),
	key `pro_cart_updatetime` (`updatetime`)
)engine=InnoDB default charset=utf8;













