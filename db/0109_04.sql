select * from board2;

insert into board2 values(
6,'a1006','�̼���','����6',sysdate,1,1,1,1
);


commit;

---------unused(�÷���) -> invisible�� ���. ��� ���Ѵٴ� ��--------
alter table board2
set unused(bindent);

desc board2;

insert into board2 values(
7,'a1007','������','����7',sysdate,1,1,1
); -- bindent �÷��� unusedó�� �س��� �� �Է��ؾ�.

alter table board2
drop unused columns;
---------unused(�÷���) -> invisible�� ���. ��� ���Ѵٴ� ��--------



----------���̺� �̸� ����------------
rename board2 to fboard;
----------���̺� �̸� ����------------

-------------------------��������----------------------------
select * from member;

create table board2( --board2�� fboard�� �ٲ���� ����)
bno number(4) primary key,
bid varchar2(30) not null,
btitle varchar2(100) not null,
bcontent clob,
bdate date,
bhit number(4),
bgroup number(4),
bstep number(4),
bindent number(4)
);

desc board2;

insert into board2 (bno,bid,btitle) values(
board2_seq.nextval,'aaa','�����Դϴ�.1');

select * from board2;

insert into board2(bno, bid,btitle) values(
3,'aaa','�����Դϴ�.1'
);

select * from tab;

desc board2;
----------------NOT NULL: null���X, �ߺ��� ���------------------
alter table board2 modify bhit number(4) not null; 
-- bhit�÷��� ���� �� �̹� null ���ִ� ��
-- ������ �ٷ� �ȵ�. �װ͵� ���ְų� null�� �ƴ� �ɷ� ��ȯ �� �ٲ� �� ��

select bhit from board2;

update board2 set bhit=1;

select * from board2;
------------------------------------------
----------UIQUE : NULL ���, �ߺ� ���X--(alter���)-----------
alter table board2 modify bindent number(4) unique;

insert into board2 values(
4,'aaa','����1','����1',sysdate,1,1,1,2);
-----------------------UIQUE-----------------------------

---------primary key: �ߺ��� null �� �� ���X------------
alter table board modify no number(4) primary key;
------------------primary key---------------------

desc board;

-------------------foreign key--------------------
select * from board;

select * from member;

desc member;


alter table board
add constraint fk_id foreign key(id) references member(id);


create table board3 (
no number(4) primary key,
title varchar2(30) not null,
content varchar2(2000),
userid varchar2(20) references member(id),  --foreign key ����. member���̺�� �����
bdate date
);


insert into board3 values(
1,'�����Դϴ�.1','����','aaa',sysdate
);

select * from member;

insert into board3 values(
2,'�����Դϴ�.1','����','aaa',sysdate
);

insert into board3 values(
3,'�����Դϴ�.1','����','ggg',sysdate
); 

insert into board3 values(
3,'�����Դϴ�.1','����','abc',sysdate
); --�ȵ�. �θ�Ű ���ٰ� ��. member�� 'abc'��� ����� ���ٴ� ��

commit;

create table board4 (
no number(4) primary key,
title varchar2(30) not null,
content varchar2(2000),
userid varchar2(30),
bdate date,
constraint fk_userid foreign key(userid) references member(id) -- foreign key ��Īfk_userid. 
--���� �ÿ� '���Ἲ ��������(ORAUSER.FK_USERID)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�' ��� �˷���
);

insert into board4 values(
3,'����1','����1','abc',sysdate);

select * from board4;

drop table board4;
drop table board3; 

create table board3 (
no number(4) primary key,
title varchar2(40),
content varchar2(3000),
userid varchar2(20) references member(id), --�ܷ�Ű ���� ��� 1
bdate date
);

create table board4 (
no number(4) primary key,
title varchar2(40),
content varchar2(3000),
userid varchar2(20),
bdate date,
constraint fk_userid foreign key(userid) references member(id) -- �ܷ�Ű ���� ���2
);

desc board;

alter table board
add constraint fk_userid1 ------------- �ܷ�Ű ���� ��� 
foreign key(userid) references member(id);

alter table memeber modify id varchar2(20) primary key; -- �⺻Ű�� id�÷��� ���
-------------------foreign key ��-------------------

drop table board4;
-----------------CHECK(Ư��������-------------------------------
create table emp01(
empno number(4) primary key,
ename varchar2(20) not null,
jobid varchar2(9),
salary number(7,2) check(salary between 500 and 5000), --500�� 5000���̸� �� ���� ��
gender varchar2(1) check(gender in('M','F')) -- M �Ǵ� F�� ����
);

insert into emp01 values(
5,'�̼���','30',4000,'M');

commit;
---------------------check��-----------------


















