
create table board(
	no int primary key auto_increment,
	writer varchar(20) not null,
	subject varchar(50) not null,
	contents varchar(255) not null,
	regDate varchar(10) not null
);

select * from board;

insert into board(writer,subject,contents,regDate)
values('작성자1','제목1','내용1',curdate())

insert into board(writer,subject,contents,regDate)
values('작성자2','제목2','내용2',curdate())
insert into board(writer,subject,contents,regDate)
values('작성자3','제목3','내용3',curdate())
insert into board(writer,subject,contents,regDate)
values('작성자4','제목4','내용4',curdate())
insert into board(writer,subject,contents,regDate)
values('작성자5','제목5','내용5',curdate())
insert into board(writer,subject,contents,regDate)
values('작성자6','제목6','내용6',curdate())
insert into board(no,writer,subject,contents,regDate)
values('작성자7','제목7','내용7',curdate())

insert into board(writer,subject,contents,regDate) values('작성자8','제목8','내용8',curdate())

update board set subject='test' , contents='test2' where no = 3;


select max(no) from board;
-- update 랑 delete where 절이 없으면 모든 row에게 적용 

delete from board where no = 41; 

delete from board where writer='작성자9'; 

select * from board;











