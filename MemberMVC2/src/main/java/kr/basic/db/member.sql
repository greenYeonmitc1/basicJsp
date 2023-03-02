 -- primary key 데이터가 유일하고 비어있지 않는 데이터 not null 
-- unique key null은 가능하나 데이터 중복은 허용하지않음 
create table member(
    num int primary key auto_increment, 
    id varchar(20) not null, 
    pass varchar(20) not null,
    name varchar(20) not null,
    age int not null,
    email varchar(30) not null,
    phone varchar(30) not null,    
    unique key(id)
);

-- 명령할 쿼리 영역 alt + x => 쿼리문 실행 
-- read : 데이터 베이스에서 값을 읽어오는 명령문 
select * from member;  -- view table 출력 

-- 데이터베이스에 추가하기 
insert into member(id,pass,name,age,email,phone) values('admin','admin','관리자',30,'test@admin.com','010-1111-1234');

insert into member(id,pass,name,age,email,phone) values('test1','1111','테스트1',31,'test1@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test2','2222','테스트2',32,'test2@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test3','3333','테스트3',33,'test3@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test4','4444','테스트4',34,'test4@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test5','5555','테스트5',35,'test5@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test6','6666','테스트6',36,'test6@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test7','7777','테스트7',37,'test7@test.com','010-1111-1234');

select * from member;  -- 뷰테이블 컬럼 이름 수정이 가능하다 --> 일시적인 수정 -> 실제 테이블 컬럼값 바꾼건 아니다 

-- update 수정하기 
update member set age = 30 where id ='test1';
update member set age = 35 where id ='test1' and age <20; --(0 rows affected) : 조건 안맞더라도 문법이 맞으면 실행은 한다 

update member set age = 40, pass='test2' where id ='test2';

-- delete 삭제하기 
delete from member where age >35;  -- (3 rows affected)

-- delete 삭제하기 --> table 내용 삭제 
delete from member;  --테이블은 삭제가 안되고 유지 -> 안에있는 전체 row 만 다 삭제된다 

-- table 자체 삭제 
drop table member;
 