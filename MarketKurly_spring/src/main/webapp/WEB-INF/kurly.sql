CREATE DATABASE kurly;
USE kurly;

CREATE TABLE customer(
	id VARCHAR(50),
	pw VARCHAR(16),
	name VARCHAR(10),
	reg_date VARCHAR(50),
	tel VARCHAR(20),
	address VARCHAR(100),
	email VARCHAR(20)
);

CREATE TABLE item(
	item_number int(50),
	item_category VARCHAR(3),
	item_name VARCHAR(16),
	item_price int(50),
	item_stock int(50),
	item_image VARCHAR(10),
	item_info VARCHAR(100),
	discount_rate int(50),
	reg_date VARCHAR(50),
	sold int(50)
);

CREATE TABLE cart(
	cart_number int(50),
	buyer VARCHAR(50),
	item_name VARCHAR(16),
	buy_price int(50),
	buy_count int(50),
	item_image VARCHAR(50)
);

CREATE TABLE buy(
	customer_id VARCHAR(50),
	customer_name VARCHAR(50),
	cart_number int(50),
	item_name VARCHAR(50),
	buy_price int(50),
	buy_count int(50),
	item_image VARCHAR(50),
	buy_date VARCHAR(50),
	howpay VARCHAR(50),
	address VARCHAR(100)
);

CREATE table manager(
	id varchar(50),
	pw varchar(50),
	name varchar(50)
);

create table board(
	num int(10),
	writer varchar(20),
	title varchar(50),
	pw varchar(20),
	reg_date date,
	ref int(10),
	re_step int(10),
	re_level int(10),
	readcount int(10),
	content varchar(100)
);

---------------------------------------------------------------------------
insert into manager values('admin','admin','관리자');
insert into customer values('asterria','1234','김혜민','2020-11-18','01031487426','서울시 양천구','asterria@naver.com');
insert into customer values('qwer','1234','김혜민','2020-11-18','01031487426','서울시 양천구','qwer@naver.com');
insert into item values(1,'100', '대파',1200,3,'1.jpg', '대파입니다', 0, now(), 10);
insert into item values(2,'100', '상추',2000,4,'2.jpg', '상추입니다', 10, now(), 0);
insert into item values(3,'100', '당근',2500,8,'3.jpg', '당근입니다', 10, now(), 0);
insert into item values(4,'100', '깻잎',1200,0,'4.jpg', '깻잎입니다', 0, now(), 0);
insert into item values(5,'100', '애호박',1000,5,'5.jpg', '애호박입니다', 0, now(), 0);
insert into item values(6,'100', '버섯',1500,4,'6.jpg', '버섯입니다', 20, now(), 0);
insert into item values(7,'100', '단호박',3000,7,'7.jpg', '단호박입니다', 10, now(), 0);
insert into item values(8,'100', '파프리카',3000,6,'8.jpg', '파프리카입니다', 10, now(), 0);
insert into item values(9,'100','아스파라거스',3000,10,'9.jpg', '아스파라거스입니다',0, now(), 0);
insert into item values(10,'100', '양파',2000,11,'10.jpg', '양파입니다', 0, now(), 0);
insert into item values(11,'200', '자반고등어',5000,20,'11.jpg', '고등어입니다', 0, now(), 4);
insert into item values(12,'200', '연어',14000,40,'12.jpg', '노르웨이산 연어입니다', 0, now(), 0);
insert into item values(13,'200', '오징어',5000,10,'13.jpg', '오징어입니다', 10, now(), 0);
insert into item values(14,'200', '바지락',7000,0,'14.jpg', '바지락입니다', 0, now(), 0);
insert into item values(15,'200', '새우',10000,1,'15.jpg', '새우입니다', 10, now(), 0);
insert into item values(16,'200', '전복',20000,5,'16.jpg', '전복입니다', 0, now(), 0);
insert into item values(17,'300', '막창',20000,5,'17.jpg', '막창입니다', 0, now(), 0);
insert into item values(18,'300', '안심스테이크',18000,0,'18.jpg', '안심스테이크입니다',0, now(), 0);
insert into item values(19,'300', '닭', 12000,4,'19.jpg', '닭입니다', 20, now(), 0);
insert into item values(20,'300', '닭다리',10000,7,'20.jpg', '닭다리입니다', 0, now(), 8);
insert into item values(21,'300', '폭립',20000,10,'21.jpg', '폭립니다', 10, now(), 0);
insert into item values(22,'300', '양념갈비',25000,20,'22.jpg', '양념갈비입니다', 30, now(), 0);
insert into item values(23,'300', '등갈비구이',20000,0,'23.jpg', '등갈비구이입니다', 0, now(), 5);
insert into item values(24,'300', '치즈돈가스',13000,1,'24.jpg', '치즈돈가스입니다', 0, now(), 50);
insert into item values(25,'300', '닭가슴살',5000,4,'25.jpg', '닭가슴살입니다', 0, now(), 0);
insert into item values(26,'300', '차돌박이',20000,3,'26.jpg', '차돌박이입니다', 10, now(), 10);
insert into item values(27,'400', '그라인더',28000,3,'27.jpg', '그라인더입니다', 10, now(), 0);
insert into item values(28,'400', '스팀다리미',30000,3,'28.jpg', '스팀다리미입니다', 10, now(), 0);
insert into item values(29,'400', '헤어드라이기',25000,3,'29.jpg', '헤어드라이기입니다', 10, now(), 0);
insert into item values(30,'400', '체중계',19000,3,'30.jpg', '체중계입니다', 10, now(), 0);
insert into item values(31,'400', '전자체중계',22000,3,'31.jpg', '전자체중계입니다', 10, now(), 0);
insert into item values(32,'400', '미니선풍기',16000,0,'32.jpg', '미니선풍기입니다', 10, now(), 0);
insert into item values(33,'400', '청소기',40000,3,'33.jpg', '청소기입니다', 10, now(), 0);
insert into item values(34,'400', '카메라',50000,3,'34.jpg', '카메라입니다', 10, now(), 0);
insert into item values(35,'400', '믹서기',3800,3,'35.jpg', '믹서기입니다', 10, now(), 7);


select * from item;
select * from customer;







