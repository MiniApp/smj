/*==============================================================*/
/* Database name:  onlinesupermarket                                   */
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2013/6/20 15:39:08                          */
/* Update on:  2013/07/14                                   */
/* Update  user: chenwenlei                                      */
/*                                                               */
/* modify  table Comm_info(add column)   add table Comm_archives */
/* modify  table leaveword(add column)   modify table Affiche(add column)*/
/* modify  table cust_info(add column)                */
/* modify date: 2013/12/01                                    */
/* modify user: chenwenlei                                    */
/*==============================================================*/


drop database if exists onlinesupermarket;

/*==============================================================*/
/* Database: onlinesupermarket                                        */
/*==============================================================*/
create database onlinesupermarket CHARSET=utf8;

use onlinesupermarket;

/*==============================================================*/
/* Table: Appriase                                              */
/*==============================================================*/
DROP TABLE IF EXISTS `appriase`;
create table Appriase
(
   appri_id             int not null auto_increment,
   store_id             int,
   appri_content        varchar(200),
   speed                int,
   integrity            int,
   service              int,
   date                 datetime,
   is_validate          varchar(5),
   is_ask               varchar(5),
   primary key (appri_id)
) DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table Appriase comment '店铺评价信息表';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on Appriase
(
   store_id
);

/*==============================================================*/
/* Table: Cateory                                               */
/*==============================================================*/
DROP TABLE IF EXISTS  `cateory`;
create table Cateory
(
   cate_id              int not null auto_increment,
   name                 varchar(100),
   parent_id            int,
   class_id             int,
   deleted              int,
   primary key (cate_id)
)  DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;


alter table Cateory comment '商品类别表';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on Cateory
(
   cate_id
);

/*==============================================================*/
/* Table: Comm_info                                             */
/*==============================================================*/
DROP TABLE IF EXISTS  `comm_info`;
create table Comm_info
(
   commd_id             int not null,
   store_id             int not null,
   commd_name           varchar(50),
   commd_fullname       varchar(100),
   commd_logo           varchar(50),
   img1                 varchar(100),
   img2                 varchar(100),
   img3                 varchar(100),
   one_dimension        varchar(13),
   two_dimension        varchar(19),
   styleId              varchar(20),
   brand_id             int,
   u_id                 int,
   cate_id              int,
   commd_weight         varchar(10),
   prodstatcode         varchar(50),
   commd_license        varchar(18),
   manufactenterpric    varchar(50),
   commd_crea_date      varchar(10),
   commd_produce_place  varchar(5),
   material             varchar(50),
   netcontent           varchar(50),
   shelf_live           varchar(50),
   commd_size           varchar(200),
   commd_description    varchar(200),
   supplier             varchar(50),
   agora_price          double(8,2),
   user_price           double(8,2),
   sale_price           double(8,2),
   prom_price           double(8,2),
   taste                varchar(20),
   equip                varchar(20),
   integral             int,
   mix_num              int,
   have_num             int,
   qualified            varchar(5),
   uses                 int,
   number               int,
   memo                 int,
   custservline         varchar(20),
   remark1              varchar(200),
   remark2              varchar(200),
   remark3              varchar(200),
   remark4              varchar(200),
   remark5              varchar(200),
   primary key (commd_id, store_id)
) DEFAULT CHARSET=utf8;

alter table Comm_info comment '商品信息表';

/*==============================================================*/
/* Index: Idx_commd                                             */
/*==============================================================*/
create index Idx_commd on Comm_info
(
   commd_id
);

-- ----------------------------
-- Table structure for `comm_archives`
-- ----------------------------
DROP TABLE IF EXISTS `comm_archives`;
CREATE TABLE `comm_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commd_id` int(11) DEFAULT NULL,
  `commd_name` varchar(50) DEFAULT NULL,
  `new_dimension` varchar(19) DEFAULT NULL,
  `old_dimension` varchar(19) DEFAULT NULL,
  `smallImg` varchar(50) DEFAULT NULL,
  `mediumImg` varchar(50) DEFAULT NULL,
  `largeImg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table Comm_archives comment '商品档案表';

/*==============================================================*/
/* Table: Commd_Sale_Total                                      */
/*==============================================================*/
DROP TABLE IF EXISTS `commd_sale_total`;
create table Commd_Sale_Total
(
   store_id             int not null,
   commd_id             int,
   commd_sale_num       int,
   commd_sale_amt       double(8,2),
   primary key (store_id)
) DEFAULT CHARSET=utf8;

alter table Commd_Sale_Total comment '商品销售统计表';

/*==============================================================*/
/* Table: Commd_appr                                            */
/*==============================================================*/
DROP TABLE IF EXISTS `commd_appr`;
create table Commd_appr
(
   u_id                 int not null auto_increment,
   commd_id             int,
   store_id             int,
   integral             int,
   taste                varchar(50),
   content              varchar(200),
   date                 datetime,
   primary key (u_id)
)  DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table Commd_appr comment '商品评价表';

/*==============================================================*/
/* Index: idx_commd                                             */
/*==============================================================*/
create index idx_commd on Commd_appr
(
   commd_id
);

/*==============================================================*/
/* Table: E_admininfo                                           */
/*==============================================================*/
DROP TABLE IF EXISTS `e_admininfo`;
create table E_admininfo
(
   admin_id             int not null auto_increment,
   store_id             int,
   admin_name           varchar(20),
   admin_pwd            varchar(40),
   admin_type           int,
   admin_state          varchar(5),
   error_count          int,
   reg_date             datetime,
   primary key (admin_id)
) DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table E_admininfo comment '商铺管理员信息表';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on E_admininfo
(
   store_id
);

/*==============================================================*/
/* Table: Leaveword                                             */
/*==============================================================*/
DROP TABLE IF EXISTS `leaveword`;
create table Leaveword
(
   leav_id              int not null auto_increment,
   store_id             int,
   cust_id              int,
   cust_name            varchar(50),
   leav_content         longtext,
   leav_time            datetime,
   ans_content          longtext,
   ans_time             datetime,
   ans_user             int,
   primary key (leav_id)
) DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table Leaveword comment '留言信息表';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on Leaveword
(
   store_id
);

/*==============================================================*/
/* Table: Region                                                */
/*==============================================================*/
DROP TABLE IF EXISTS `region`;
create table Region
(
   region_id            int not null auto_increment,
   class_id             varchar(60),
   parent_id            varchar(54),
   child_num            int,
   name                 varchar(80),
   deleted              int,
   primary key (region_id)
) DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;


alter table Region comment '区域信息表';

/*==============================================================*/
/* Table: Unit                                                  */
/*==============================================================*/
DROP TABLE IF EXISTS `unit`;
create table Unit
(
   u_id                 int not null auto_increment,
   name                 varchar(50),
   deleted              int,
   primary key (u_id)
);

alter table Unit comment '商品尺寸表';

/*==============================================================*/
/* Table: User_Address                                          */
/*==============================================================*/
DROP TABLE IF EXISTS `user_address`;
create table User_Address
(
   id                   int not null auto_increment,
   cust_id              int,
   user_add             varchar(100),
   is_default           varchar(5),
   primary key (id)
) DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table User_Address comment '用户送货地址';

/*==============================================================*/
/* Table: bill_detail                                           */
/*==============================================================*/
DROP TABLE IF EXISTS `bill_detail`;
create table bill_detail
(
   bill_date            date,
   store_id             int not null,
   bill_id              int not null,
   commd_id             int,
   commd_num            int,
   primary key (store_id, bill_id)
) DEFAULT CHARSET=utf8;

alter table bill_detail comment '订单明细表';

/*==============================================================*/
/* Index: Idx_billid                                            */
/*==============================================================*/
create index Idx_billid on bill_detail
(
   bill_id
);

/*==============================================================*/
/* Table: bill_info                                             */
/*==============================================================*/
DROP TABLE IF EXISTS `bill_info`;
create table bill_info
(
   bill_id              varchar(50) not null,
   bill_date            datetime,
   cust_id              int,
   bill_type            int,
   cust_name            varchar(50),
   cust_tel             varchar(30),
   cust_addr            varchar(50),
   accu                 int,
   is_invoice           varchar(5),
   is_vintegral         varchar(5),
   amt                  double(8,2),
   bill_state           varchar(5),
   pay_type             int,
   reject_flg           varchar(5),
   reject_cause         varchar(100),
   reject_time          datetime,
   deliver_fee          double(8,2),
   bill_appr            varchar(200),
   user_appr            varchar(20),
   appr_time            datetime,
   deliver_time         datetime,
   memo                 varchar(200),
   primary key (bill_id)
) DEFAULT CHARSET=utf8;

alter table bill_info comment '订单信息表';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on bill_info
(
   bill_date
);

/*==============================================================*/
/* Table: cust_info                                             */
/*==============================================================*/
DROP TABLE IF EXISTS `cust_info`;
create table cust_info
(
   cust_id              int not null auto_increment,
   name                 varchar(50),
   nick_name            varchar(50),
   is_cert              varchar(5),
   mobile               varchar(12),
   phone                varchar(20),
   email                varchar(50),
   qq                   varchar(12),
   pwd                  varchar(15),
   accu                 int,
   is_validate          int,
   user_rank            int,
   reg_date             datetime,
   radom_str1           varchar(20),
   radom_str2           varchar(20),
   user_state           varchar(5),
   primary key (cust_id)
)  DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table cust_info comment '用户信息表
';

/*==============================================================*/
/* Index: Idx_userid                                            */
/*==============================================================*/
create unique index Idx_userid on cust_info
(
   cust_id
);

/*==============================================================*/
/* Table: enter_info                                            */
/*==============================================================*/
DROP TABLE IF EXISTS `enter_info`;
create table enter_info
(
   enter_id             int not null auto_increment,
   enter_name           varchar(80),
   legal_repr_id        varchar(32),
   legal_repr_name      varchar(50),
   cert_type            varchar(10),
   cert_id              varchar(32),
   reg_date             datetime,
   enter_addr           varchar(100),
   respb_person         varchar(50),
   tel_no               varchar(30),
   enter_state          int,
   enter_buss_licen     varchar(15),
   enter_buss_licen_img varchar(50),
   primary key (enter_id)
) DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table enter_info comment '商户信息表
';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on enter_info
(
   enter_id
);

/*==============================================================*/
/* Table: store_info                                            */
/*==============================================================*/
DROP TABLE IF EXISTS `store_info`;
create table store_info
(
   store_id             int not null auto_increment,
   enter_id             int,
   store_name           varchar(40),
   store_level          int,
   store_addr           varchar(100),
   cont_person          varchar(20),
   cont_tel             varchar(20),
   cont_qq              varchar(15),
   store_logo           varchar(50),
   service              varchar(200),
   busi_start_hour      time,
   busi_end_hour        time,
   deliver_price        double(8,2),
   shipping_fee         double(8,2),
   resp_time            int,
   store_state          int,
   reg_date             datetime,
   store_type           int,
   store_rank_accu      int,
   store_rank           varchar(10),
   store_credit         varchar(10),
   order_num            int,
   access_num           int,
   deliver_range        varchar(200),
   primary key (store_id)
) DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;

alter table store_info comment '商铺信息表
';

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on store_info
(
   enter_id,
   store_id
);


/*==============================================================*/
/* Table: Affiche                                               */
/*==============================================================*/
DROP TABLE IF EXISTS `Affiche`;
create table Affiche
(
      affi_id  int  not null auto_increment,
      title   varchar(50),
      bclass  varchar(50),
      date  datetime,
      enter_id   int,
      content   varchar(200)
)DEFAULT CHARSET=utf8 ENGINE=INNODB AUTO_INCREMENT=100000;


alter table Affiche comment '商铺公告表';



