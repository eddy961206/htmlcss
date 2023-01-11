select * from member;

create table member2
as
select * from member;

drop table member; --오류 : '외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다'
-- member가 부모테이블(참조되어지는 테이블)이면 바로 안지워짐
alter table board drop constraint fk_userid1; --board테이블에서 외래키 삭제해야 참조되고잇는 테이블인 member가 삭제됨

create table member(
id varchar2(30) PRIMARY KEY,
pw varchar2(30) not null,
name varchar2(100) not null,
phone varchar2(13),
gender varchar2(6) check(gender in('male','female')),
hobby varchar2(30) default 'book'
);

insert into member values(
'aaa','1111','홍길동','010-0000-0000','male','book'
);

insert into member values(
'aaa','1111','유관순','010-1111-1111','female','book,swim,game'
);

insert into member values('ccc','1111','이순신','010-2222-2222','male','book,game');

commit;
select * from member;

--update member set phone='010-1234-1234' where id='aaa';
commit;

select * from member2;

select * from stuscore;

update stuscore set rank=1;

commit;

select * from stuscore;
select rank()over(order by total desc) as ranks,name,stuno from stuscore;



update stuscore a
set rank=(select ranks from (select rank()over(order by total desc) as ranks,name,stuno from stuscore)b
where a.stuno=b.stuno
);

commit;

--delete stuscore;

insert into stuscore values(
1,'홍길동',100,100,99,100+100+99,(100+100+99)/3,1);
 
insert into stuscore values(
2,'유관순',99,99,98,99+99+98,(99+99+98)/3,1);
 
insert into stuscore values(
3,'이순신',80,80,81,80+80+81,(80+80+81)/3,1);
 
insert into stuscore values(
4,'김구',90,90,91,90+90+91,(90+90+91)/3,1);
 
insert into stuscore values(
5,'강감찬',78,78,79,78+78+79,(78+78+79)/3,1);
 
insert into stuscore values(
6,'김유신',100,100,100,100+100+100,(100+100+100)/3,1);
 
insert into stuscore values(
7,'홍길자',99,99,98,99+99+98,(99+99+98)/3,1);

desc stuscore;