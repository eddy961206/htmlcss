select * from member;

create table member2
as
select * from member;

drop table member; --���� : '�ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�'
-- member�� �θ����̺�(�����Ǿ����� ���̺�)�̸� �ٷ� ��������
alter table board drop constraint fk_userid1; --board���̺��� �ܷ�Ű �����ؾ� �����ǰ��մ� ���̺��� member�� ������

create table member(
id varchar2(30) PRIMARY KEY,
pw varchar2(30) not null,
name varchar2(100) not null,
phone varchar2(13),
gender varchar2(6) check(gender in('male','female')),
hobby varchar2(30) default 'book'
);

insert into member values(
'aaa','1111','ȫ�浿','010-0000-0000','male','book'
);

insert into member values(
'aaa','1111','������','010-1111-1111','female','book,swim,game'
);

insert into member values('ccc','1111','�̼���','010-2222-2222','male','book,game');

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
1,'ȫ�浿',100,100,99,100+100+99,(100+100+99)/3,1);
 
insert into stuscore values(
2,'������',99,99,98,99+99+98,(99+99+98)/3,1);
 
insert into stuscore values(
3,'�̼���',80,80,81,80+80+81,(80+80+81)/3,1);
 
insert into stuscore values(
4,'�豸',90,90,91,90+90+91,(90+90+91)/3,1);
 
insert into stuscore values(
5,'������',78,78,79,78+78+79,(78+78+79)/3,1);
 
insert into stuscore values(
6,'������',100,100,100,100+100+100,(100+100+100)/3,1);
 
insert into stuscore values(
7,'ȫ����',99,99,98,99+99+98,(99+99+98)/3,1);

desc stuscore;