create table member (
id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
phone varchar2(20)
);

insert into member(id, pw, name,phone) values (
'aaa','1111','홍길동','010-1111-1111');

insert into member(id,pw,name,phone) values (
'bbb','2222','유관순','010-2222-2222');

insert into member(id,pw,name,phone) values (
'ccc','3333','이순신','010-3333-3333');

insert into member(id,pw,name,phone) values (
'ddd','4444','김구','010-4444-4444');

insert into member(id,pw,name,phone) values (
'eee','5555','김유신','010-5555-5555');

insert into member values (
'fff',null,'강감찬','010-6666-6666');

commit;
rollback;
select * from member;

select id,pw,name,phone from member;

select id,pw from member;

insert into member(id,name) values (
 'ggg','홍길자' );

commit;

select * from member;
--추가
insert into member values (
'bbb','7777','홍길순','010-7777-7777');
--삭제
delete from member where id='bbb';

select * from member where name='홍길동';

--검색
select * from member;

--수정
update member set pw='2222' where name='홍길동';


-- stuscore 학생성적처리db
--학번,이름,국어,영어,수학,합계,평균,등수
create table stuscore (
stuNo number(4),
name varchar2(20),
kor number(3),
eng number(3),
math number(3),
total number(3),
avg number(5,2)
);

desc stuscore;
--쿼리문
alter table stuscore add rank number(4);

insert into stuscore(stuNo,name,kor,eng,math,total,avg,rank) values (
1,'홍길동',100,100,99,100+100+99,(100+100+99)/3,1);
--
insert into stuscore values (
2,'유관순',99,99,98,99+99+98,(99+99+98)/3,1);

insert into stuscore values (
3,'이순신',80,80,81,80+80+81,(80+80+81)/3,1);

insert into stuscore values (
4,'김구',90,90,91,90+90+91,(90+90+91)/3,1);

insert into stuscore values (
5,'강감찬',78,78,79,78+78+79,(78+78+79)/3,1);

commit;

select * from stuscore order by stuno desc;

select stuno,name,total,avg,
rank() over (order by total desc) rank,
dense_rank() over (order by total desc) dense_rank
from stuscore
order by stuno asc;

select stuno,name,total,avg,
rank() over (order by total desc) rank,
dense_rank() over (order by total desc) dense_rank
from stuscore;

insert into stuscore values (
6,'김유신',100,100,100,300,300/3,1);

insert into stuscore values (
7,'홍길자',99,99,98,99+99+98,(99+99+98)/3,1);

select * from stuscore;

select * from stuscore order by stuno;

delete from stuscore where stuno=1;

rollback;

commit;

select distinct * from stuscore
order by stuno;

create table stuscore2 as
select distinct * from stuscore order by stuno;

select * from stuscore2;

drop table stuscore;

alter table stuscore2 rename to stuscore;

select * from stuscore;
