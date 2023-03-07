CREATE DATABASE ajaxMemberDB;
USE ajaxMemberDB;

CREATE TABLE member(
	id VARCHAR(20),
    passwd VARCHAR(20),
    name VARCHAR(20),
    reg_date DATETIME,
    address VARCHAR(100),
    tel VARCHAR(20)
);

SELECT * FROM member;
SELECT passwd FROM member WHERE id='test1';
update member set name='테스트11', address='강북',tel='123' where id='test1' and passwd='1';
insert into member values('test1','1234','테스트1',now(),'강남','010-1234-1231');
insert into member values('test2','1234','테스트2',now(),'역삼','010-1234-1232');
insert into member values('test3','1234','테스트3',now(),'신사','010-1234-1233');
insert into member values('test4','1234','테스트4',now(),'교대','010-1234-1234');