select * from stuscore;

desc stuscore;

drop table stuscore;

create table stuscore(
stuno number(4) primary key,
name varchar2(20) not null,
kor number(3) check(kor between 0 and 100),
eng number(3) check(eng between 0 and 100),
math number(3) check(math between 0 and 100),
total number(3),
avg number(5,2),
rank number(4)
);

select * from stuscore;

insert into stuscore values(
stu_seq.nextval,'홍길동',100,100,99,100+100+99,(100+100+99)/3,1
);

insert into stuscore values(
stu_seq.nextval,'유관순',99,99,98,99+99+98,(99+99+98)/3,1
);

insert into stuscore values(
stu_seq.nextval,'이순신',80,80,81,80+80+81,(80+80+81)/3,1
);

insert into stuscore values(
stu_seq.nextval,'김구',90,90,91,90+90+91,(90+90+91)/3,1
);

insert into stuscore values(
stu_seq.nextval,'강감찬',78,78,79,78+78+79,(78+78+79)/3,1
);

insert into stuscore values(
stu_seq.nextval,'김유신',100,100,100,100+100+100,(100+100+100)/3,1
);

select * from stuscore;

commit;

insert into stuscore values(
stu_seq.nextval,'홍길자',99,99,98,99+99+98,(99+99+98)/3,1
);

select * from stuscore;

update stuscore set rank=2 where stuno=1;

select rank() over(order by total desc)ranks, stuno,name from stuscore;

update stuscore a -- table에다가는 as 쓰지마. 컬럼 별칭 정할 때만 as 사용가능.
set rank = (select ranks from (select rank() over(order by total desc)ranks, stuno,name from stuscore)b
where a.stuno=b.stuno)
;

select * from stuscore; 

commit;

select * from member;

desc member;


select * from member where id='aaa' and pw='1112'; --찾아지면 아이디 존재, 틀리면 안나오므로 로그인 안됨

insert into member values('ggg','1111','강감찬','010-6666-6666','male','golf,swim');

rollback;

select * from member where id='aaa';















