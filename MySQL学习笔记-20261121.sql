-- 注释的写法是2个--加一个空格

-- 查询所有数据库
show databases ;

-- 切换数据库(select 是当前数据库),框选要切换的那行,然后运行
use db01;

-- 查询当前正在使用的数据库,select database() ,这是一个函数,是database(),database后面记得加括号!
select  database() db01;

-- 创建数据库
create  database  db04;

-- 删除数据库
drop database  db04;

-- -------------------------------> DDL 表操作 <---------------------------------
-- | id | username | name | age | gender |
-- |---|---|---|---|---|
-- | 1 | qingyifuwang | 韦一笑 | 45 | 男 |
-- | 2 | baimeiyingwang | 殷天正 | 55 | 男 |
-- | 3 | jinmaoshiwang | 谢逊 | 50 | 男 |
-- | 4 | zishanlongwang | 黛绮丝 | 38 | 女 |


-- 创建表
create  table  user(
    id        int         comment '用户的id',
    username  varchar(60) comment '用户的username',
    name      varchar(10) comment  '用户名',
    age       int         comment '年龄',
    gender    char        comment '性别'
) comment '这是一张用户表';



-- 创建表(添加约束)
create  table  user(
    id        int          primary key     comment '用户的id',      -- 主键约束 要求这行数据非空且唯一 如果在primary key 后面加上一个 auto_increment ,就会自动增长
    username  varchar(60)  not null unique  comment '用户的username',-- 非空 + 唯一的约束
    name      varchar(10)  not null         comment  '用户名',       -- 非空
    age       int                           comment '年龄',
    gender    char         default '男'     comment '性别'           -- 默认是男
) comment '这是一张用户表';



-- 案例设计员工表 emp
-- 基础字段 id 主键;create_time 创建时间;update_time 修改(更新)时间;
create table emp(
  id         int   unsigned  primary key auto_increment comment 'id,主键',
  username   varchar(20)  not null unique   comment '用户名',
  passworld  varchar(32)  default '123456'  comment '密码',
  name       varchar(10)  not null          comment '姓名',
  gender     tinyint      unsigned not null comment  '性别,1男;2 女',
  phone      char(11)     not null unique   comment '手机号',
  job        tinyint      unsigned          comment '职位,1 班主任;2讲师;3学工主管;4教研主管;5咨询师',
  salary     int          unsigned          comment  '工资',
  entry_date date                          comment  '入职日期',
  image        varchar(255)                  comment  '图像',
  create_time  datetime comment  '创建时间',
  update_time  datetime comment  '修改时间'
) comment '员工表';



-- 查询当前数据库的所有表
show tables ;-- db02 emp user


-- 查看表结构
desc emp;


-- 查询建表的语句(用什么语句去建这个表的)
show create table emp;


-- 添加字段qq
alter table emp add qq varchar(13) comment 'QQ号码';

-- 修改字段类型 varchar(13)->varchar(15) 要用到关键字modufy
alter  table  emp  modify qq varchar(15) comment 'QQ号码';


-- 字段:修改字段名 qq-> qq_num varchar(15) 要用到关键字 change
alter  table  emp  change qq qq_num varchar(15) comment 'QQ号码';

-- 字段 :删除字段 qq_num
alter  table  emp drop  qq_num ;

-- 修改表名
alter  table emp rename to employee;
alter  table employee rename to emp;


-- 删除表
drop  table  employee;


-- DML : 数据操作语言
-- DML : 插入数据 - insert
-- 1. 为 emp 表的 username, password, name, gender, phone 字段插入值
insert into emp(emp.username,emp.passworld,emp.name,emp.gender,emp.phone)values ('lihua','123','李华',1,'134345666');


-- 2. 为 emp 表的 所有字段插入值
-- 方式一
insert into emp(emp.id, emp.username, emp.passworld, emp.name, emp.gender, emp.phone, emp.job, emp.salary, emp.entry_date, emp.image, emp.create_time, emp.update_time)
               values(null,'zhansan','123456','张三',1,'13881801234',1,6000,'2020-01-01','2.jpg',now(),now());

-- 方式二
insert into emp values(null,'lisi','123456','李四',1,'13890801234',1,6000,'2020-01-01','2.jpg',now(),now());



-- 3. 批量为 emp 表的 username, password, name, gender, phone  字段插入数据
insert into  emp(emp.username,emp.passworld,emp.name,emp.gender,emp.phone)
             values('yangyi','100000','杨一','1','1838081'),
             ('yanger','1000001','杨二','1','1838082');



-- DML : 更新数据 - update
-- 1. 将 emp 表的ID为1员工 用户名更新为 'zhangsan', 姓名name字段更新为 '张三'
update emp set  emp.username='zhangsan' ,emp.name='张三' where id=1;


-- 2. 将 emp 表的所有员工的入职日期更新为 '2010-01-01' 没有写where就代表把整张表的时间都改为,更新时间了
update emp set emp.entry_date = '2010-01-01';


-- DML : 删除数据 - delete
-- 1. 删除 emp 表中 ID为1的员工
  delete  from emp where id=1;

-- 2. 删除 emp 表中的所有员工 后面没有加where,代表删除所有数据
delete   from emp;



-- 准备测试数据
INSERT INTO emp(id, username, passworld, name, gender, phone, job, salary, image, entry_date, create_time, update_time)
VALUES (1,'shinaian','123456','施耐庵',1,'13309090001',4,15000,'1.jpg','2000-01-01','2024-04-11 16:35:33','2024-04-11 16:35:35'),
     (2,'songjiang','123456','宋江',1,'13309090002',2,8600,'2.jpg','2015-01-01','2024-04-11 16:35:33','2024-04-11 16:35:37'),
     (3,'lujunyi','123456','卢俊义',1,'13309090003',2,8900,'3.jpg','2008-05-01','2024-04-11 16:35:33','2024-04-11 16:35:39'),
     (4,'wuyong','123456','吴用',1,'13309090004',2,9200,'4.jpg','2007-01-01','2024-04-11 16:35:33','2024-04-11 16:35:41'),
     (5,'gongsunsheng','123456','公孙胜',1,'13309090005',2,9500,'5.jpg','2012-12-05','2024-04-11 16:35:33','2024-04-11 16:35:43'),
     (6,'huosanniang','123456','扈三娘',2,'13309090006',3,6500,'6.jpg','2013-09-05','2024-04-11 16:35:33','2024-04-11 16:35:45'),
     (7,'chaijin','123456','柴进',1,'13309090007',1,4700,'7.jpg','2005-08-01','2024-04-11 16:35:33','2024-04-11 16:35:47'),
     (8,'likui','123456','李逵',1,'13309090008',1,4800,'8.jpg','2014-11-09','2024-04-11 16:35:33','2024-04-11 16:35:49'),
     (9,'wusong','123456','武松',1,'13309090009',1,4900,'9.jpg','2011-03-11','2024-04-11 16:35:33','2024-04-11 16:35:51'),
     (10,'lichong','123456','林冲',1,'13309090010',1,5000,'10.jpg','2013-09-05','2024-04-11 16:35:33','2024-04-11 16:35:53'),
     (11,'huyanzhuo','123456','呼延灼',1,'13309090011',2,9700,'11.jpg','2007-02-01','2024-04-11 16:35:33','2024-04-11 16:35:55'),
     (12,'xiaoliguang','123456','小李广',1,'13309090012',2,10000,'12.jpg','2008-08-18','2024-04-11 16:35:33','2024-04-11 16:35:57'),
     (13,'yangzhi','123456','杨志',1,'13309090013',1,5300,'13.jpg','2012-11-01','2024-04-11 16:35:33','2024-04-11 16:35:59'),
     (14,'shijin','123456','史进',1,'13309090014',2,10600,'14.jpg','2002-08-01','2024-04-11 16:35:33','2024-04-11 16:36:01'),
     (15,'sunerniang','123456','孙二娘',2,'13309090015',2,10900,'15.jpg','2011-05-01','2024-04-11 16:35:33','2024-04-11 16:36:03'),
     (16,'luzhishen','123456','鲁智深',1,'13309090016',2,9600,'16.jpg','2010-01-01','2024-04-11 16:35:33','2024-04-11 16:36:05'),
     (17,'liying','12345678','李应',1,'13309090017',1,5800,'17.jpg','2015-03-21','2024-04-11 16:35:33','2024-04-11 16:36:07'),
     (18,'shiqian','123456','时迁',1,'13309090018',2,10200,'18.jpg','2015-01-01','2024-04-11 16:35:33','2024-04-11 16:36:09'),
     (19,'gudasao','123456','顾大嫂',2,'13309090019',2,10500,'19.jpg','2008-01-01','2024-04-11 16:35:33','2024-04-11 16:36:11'),
     (20,'ruanxiaoer','123456','阮小二',1,'13309090020',2,10800,'20.jpg','2018-01-01','2024-04-11 16:35:33','2024-04-11 16:36:13'),
     (21,'ruanxiaowu','123456','阮小五',1,'13309090021',5,5200,'21.jpg','2015-01-01','2024-04-11 16:35:33','2024-04-11 16:36:15'),
     (22,'ruanxiaoqi','123456','阮小七',1,'13309090022',5,5500,'22.jpg','2016-01-01','2024-04-11 16:35:33','2024-04-11 16:36:17'),
     (23,'ruanji','123456','阮籍',1,'13309090023',5,5800,'23.jpg','2012-01-01','2024-04-11 16:35:33','2024-04-11 16:36:19'),
     (24,'tongwei','123456','童威',1,'13309090024',5,5000,'24.jpg','2006-01-01','2024-04-11 16:35:33','2024-04-11 16:36:21'),
     (25,'tongmeng','123456','童猛',1,'13309090025',5,4800,'25.jpg','2002-01-01','2024-04-11 16:35:33','2024-04-11 16:36:23'),
     (26,'yanshun','123456','燕顺',1,'13309090026',5,5400,'26.jpg','2011-01-01','2024-04-11 16:35:33','2024-04-11 16:36:25'),
     (27,'lijun','123456','李俊',1,'13309090027',5,6600,'27.jpg','2004-01-01','2024-04-11 16:35:33','2024-04-11 16:36:27'),
     (28,'lizhong','123456','李忠',1,'13309090028',5,5000,'28.jpg','2007-01-01','2024-04-11 16:35:33','2024-04-11 16:36:29'),
     (29,'songqing','123456','宋清',1,'13309090029',5,5100,'29.jpg','2020-01-01','2024-04-11 16:35:33','2024-04-11 16:36:31'),
     (30,'liyun','123456','李云',1,'13309090030',NULL,NULL,'30.jpg','2020-03-01','2024-04-11 16:35:33','2024-04-11 16:36:31');


--  =================== DQL: 基本查询 ======================
-- 1. 查询指定字段 name,entry_date 并返回  这里查询用到的是select
    select name,emp.entry_date from emp;


-- 2. 查询返回所有字段
-- 方式一:推荐,用到什么在select 后面直接去写即可(工作中比较清晰)
    select  id, username, passworld, name, gender, phone, job, salary, entry_date, image, create_time, update_time   from emp;


-- 方式二:不推荐
    select * from  emp;

-- 3. 查询所有员工的 name,entry_date, 并起别名(姓名、入职日期),用到关键字as
    select  emp.name as 姓名 ,emp.entry_date as 入职日期 from emp;


-- 4. 查询已有的员工关联了哪几种职位(不要重复)
   select  distinct emp.job from emp;


--  =================== DQL: 条件查询 ======================
-- 1. 查询 姓名 为 柴进 的员工
    select  * from  emp where name = '柴进';


-- 2. 查询 薪资小于等于5000 的员工信息
    select  * from emp where  salary<=5000;


-- 3. 查询 没有分配职位 的员工信息
    select  * from  emp where  job is null;

-- 4. 查询 有职位 的员工信息 (is not null 非空)

    select * from emp where  job is not null;

-- 5. 查询 密码不等于 '123456' 的员工信息
-- 方式一
   select  * from emp where  passworld !='123456';
-- 方式二
   select  * from emp where  passworld <>'123456';


-- 6. 查询 入职日期 在 '2000-01-01' (包含) 到 '2010-01-01'(包含) 之间的员工信息
-- between 最小值 and 最大值
   select  * from emp where  entry_date between '2000-01-01' and '2010-01-01';

-- 7. 查询 入职时间 在 '2000-01-01' (包含) 到 '2010-01-01'(包含) 之间 且 性别为女 的员工信息
  select  * from emp where  (entry_date between '2000-01-01' and '2010-01-01')&& emp.gender =2;

-- 8. 查询 职位是 2 (讲师), 3 (学工主管), 4 (教研主管) 的员工信息
  select  * from emp where   job=2 or job=3 or job=4;
  select  * from  emp where  job in(2,3,4);

-- 9. 查询 姓名 为两个字的员工信息(用到like的模糊匹配  _ : 单个字字符; % 代表任意个字的字符)
    select  * from emp where name like '__';


-- 10. 查询 姓 '李' 的员工信息
    select  * from emp where  name like'李%';

-- 11. 查询 姓名中包含 '二' 的员工信息

   select  * from  emp where  name like '%二%';


--  =================== DQL: 分组查询 ======================
-- 聚合函数

-- 1. 统计该企业员工数量--count
-- 注意所有的聚合函数,不参与 null值的统计


-- 方式一: count(字段)

    select  count(emp.id) from  emp;-- 30
    select  count(emp.job) from  emp;-- 29 聚合函数不参与null值的统计

-- 方式二: count(*) 统计这张表的总的数据量 --推荐

    select  count(*) from emp;

-- 方式三 :count(常量) 有数据就把这个 1(常量) 标记在上面去 ,然后去做个统计,然后这个常量只要不是null都可以 --推荐
    select  count(1) from emp;

-- 2. 统计该企业员工的平均薪资

    select avg(emp.salary) from  emp; -- 7548.2759

-- 3. 统计该企业员工的最低薪资
   select min(emp.salary) from  emp; -- 4700

-- 4. 统计该企业员工的最高薪资
   select max(emp.salary) from  emp; -- 15000


-- 5. 统计该企业每月要给员工发放的薪资总额(薪资之和)
    select sum(emp.salary) from emp;

-- 分组
-- 1. 根据性别分组 , 统计男性和女性员工的数量
-- 注意分组之后 select字段后面不能随便去书写  能写的一般是 分组字段+聚合函数
    select  emp.gender, count(*) from emp group by gender;


-- 2. 先查询入职时间在 '2015-01-01' (包含) 以前的员工 , 并对结果根据职位分组 , 获取员工数量大于等于2的职位

-- 这里的entry_date 必须要去掉 因为用了group by 分组后 select 后面的必须是分组字段+聚合字段
--  select  entry_date, job,count(*) from emp where  entry_date<='2015-01-01' group by job having  count(*)>=2;


    select emp.job,count(*) from emp where entry_date <='2015-01-01' group by  job having count(*) >=2 ;


--  =================== 排序查询 ======================
-- 1. 根据入职时间, 对员工进行升序排序
   select  entry_date from emp order by entry_date asc ;-- 它默认是就是 ascend就是升序排序 ,所以这才会提示这是redundant
   select  entry_date from emp order by entry_date  ;

-- 2. 根据入职时间, 对员工进行降序排序
   select  entry_date from emp order by entry_date desc ;-- 它desc就是降序排序(descend)


-- 3. 根据 入职时间 对公司的员工进行 升序排序 ， 入职时间相同 , 再按照 更新时间 进行降序排序
-- 如果是多字段排序，当第一个字段值相同时，才会根据第二个字段进行排序
   select  emp.entry_date from emp order by  entry_date ,update_time desc ;


--  =================== 分页查询 ======================
-- 1. 从起始索引0开始查询员工数据, 每页展示5条记录(第一页要去展示5条数据)

   select  * from  emp limit 0,5; -- 这里索引如果为0 可以不写

-- 2. 查询 第1页 员工数据, 每页展示5条记录
  select  * from emp limit 5;
 -- 0
 -- 1
 -- 2
 -- 3
 -- 4

-- 3. 查询 第2页 员工数据, 每页展示5条记录(索引是从5开始,每次展示5条数据)
  select  * from  emp limit 5,5;

-- 4. 查询 第3页 员工数据, 每页展示5条记录
 select  * from  emp limit 10,5;


-- 由此可以根据数学归纳法  推导出一个公式 :起始索引=(页码-1)*记录数




