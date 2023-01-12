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
stu_seq.nextval,'ȫ�浿',100,100,99,100+100+99,(100+100+99)/3,1
);

insert into stuscore values(
stu_seq.nextval,'������',99,99,98,99+99+98,(99+99+98)/3,1
);

insert into stuscore values(
stu_seq.nextval,'�̼���',80,80,81,80+80+81,(80+80+81)/3,1
);

insert into stuscore values(
stu_seq.nextval,'�豸',90,90,91,90+90+91,(90+90+91)/3,1
);

insert into stuscore values(
stu_seq.nextval,'������',78,78,79,78+78+79,(78+78+79)/3,1
);

insert into stuscore values(
stu_seq.nextval,'������',100,100,100,100+100+100,(100+100+100)/3,1
);

select * from stuscore;

commit;

insert into stuscore values(
stu_seq.nextval,'ȫ����',99,99,98,99+99+98,(99+99+98)/3,1
);

select * from stuscore;

update stuscore set rank=2 where stuno=1;

select rank() over(order by total desc)ranks, stuno,name from stuscore;

update stuscore a -- table���ٰ��� as ������. �÷� ��Ī ���� ���� as ��밡��.
set rank = (select ranks from (select rank() over(order by total desc)ranks, stuno,name from stuscore)b
where a.stuno=b.stuno)
;

select * from stuscore; 

commit;

select * from member;

desc member;


select * from member where id='aaa' and pw='1112'; --ã������ ���̵� ����, Ʋ���� �ȳ����Ƿ� �α��� �ȵ�

insert into member values('ggg','1111','������','010-6666-6666','male','golf,swim');

rollback;

select * from member where id='aaa';















