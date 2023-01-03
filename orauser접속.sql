create table member (
id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
phone varchar2(20)
);

insert into member(id, pw, name,phone) values (
'aaa','1111','ȫ�浿','010-1111-1111');

insert into member(id,pw,name,phone) values (
'bbb','2222','������','010-2222-2222');

insert into member(id,pw,name,phone) values (
'ccc','3333','�̼���','010-3333-3333');

insert into member(id,pw,name,phone) values (
'ddd','4444','�豸','010-4444-4444');

insert into member(id,pw,name,phone) values (
'eee','5555','������','010-5555-5555');

insert into member values (
'fff',null,'������','010-6666-6666');

commit;
rollback;
select * from member;

select id,pw,name,phone from member;

select id,pw from member;

insert into member(id,name) values (
 'ggg','ȫ����' );

commit;

select * from member;
--�߰�
insert into member values (
'bbb','7777','ȫ���','010-7777-7777');
--����
delete from member where id='bbb';

select * from member where name='ȫ�浿';

--�˻�
select * from member;

--����
update member set pw='2222' where name='ȫ�浿';


-- stuscore �л�����ó��db
--�й�,�̸�,����,����,����,�հ�,���,���
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
--������
alter table stuscore add rank number(4);

insert into stuscore(stuNo,name,kor,eng,math,total,avg,rank) values (
1,'ȫ�浿',100,100,99,100+100+99,(100+100+99)/3,1);
--
insert into stuscore values (
2,'������',99,99,98,99+99+98,(99+99+98)/3,1);

insert into stuscore values (
3,'�̼���',80,80,81,80+80+81,(80+80+81)/3,1);

insert into stuscore values (
4,'�豸',90,90,91,90+90+91,(90+90+91)/3,1);

insert into stuscore values (
5,'������',78,78,79,78+78+79,(78+78+79)/3,1);

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
6,'������',100,100,100,300,300/3,1);

insert into stuscore values (
7,'ȫ����',99,99,98,99+99+98,(99+99+98)/3,1);

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
