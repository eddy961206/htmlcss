-------------������ ��ü ����---------------
--�������� ���� clob,blob...---
create table board3 (
id number(4),
name varchar2(30),
txt clob
);

insert into board3 values(
1, 'ȫ�浿','�Խñ� ������ �Է��մϴ�.'
);
commit;
select * from board3;

create table board4(
id number(4),
name varchar2(30),
txt varchar2(4000)
);

desc board4;

drop table board4;
drop table board3;

select * from board2;

----���̺� ���纻 ����� ���� 
--board�� Ÿ�԰� ���� ����---
create table board3
as
select * from board; -- board3�� board�� Ÿ��, ���빰 ����

select * from board3;
---------------------------
create table board4
as 
select no,title,content from board; --board4�� board�� no,title,content �÷��� ����鸸 ����

select * from board4;
---------------------------
create table board5
as
select * from board where 1=2;  -- board5�� board�� Ÿ��(Ʋ)�鸸 ����

select * from board5;
desc board5;

--------------------------

select * from board5;
--------------���빰�� �״�� ����ֱ�-------------
insert into board5 select * from board;
---------------------------------------------

select * from board4; -- no,title,content�÷��ۿ� ���� ����

--insert into board4 select * from board; --���� : �÷� ���� Ʋ���� ����
insert into board4 select no,title,content from board;

select * from board4;

delete board4;

commit;

select * from board4;

---------board�� no�÷��� �����͵鸸 board4�� no�÷��� ����ֱ�--------
insert into board4(no) select no from board; 

select * from board2;


drop table board3;


-----------ALTER ����-------------------- create, alter�� �ڵ� Ŀ��. ������ ����
alter table board2
add(bfile varchar2(30),bfile2 varchar2(30)); -- �÷� �߰� alter - add();

desc board2;

alter table board2
modify (bfile varchar(100));  --Ÿ�� �ٲٱ� alter - modify();

alter table board2
rename column bfile2 to bfile22; -- �÷��� �̸� �ٲٱ� alter - rename column A to B;

-- bhit�� Ÿ���� -> varchar2(30)����
alter table board2
modify(bhit varchar2(30)); --�̹� �÷� �ȿ� �����Ͱ� ������ ����ȯ �ȵ�. �ȿ��ִ°� ���� �����ϵ��� ������� �ؾ�

select * from board2;

update board2
set bhit='';  --bhit �� ����� 

select * from board2;

commit;

alter table board2
modify(bhit varchar2(30));  --bhit�� Ÿ���� varchar2�� �ٲ�

desc board2;

update board2
set bhit=1;  -- bhit�� ������ ��� 1��.  set�� UPDATE ���

select * from board2;

select bgroup, bgroup + 1 from board2; --22222

select bhit, bhit+1 from board2; --- �ڵ� ����ȯ �Ǿ bhit�� varchar2�� ���� ��.


-----�������� �ٲٱ�(�߰��ϱ�)------
alter table board2 modify btitle varchar2(200) not null; --btitle�� null�� ���� �� ������.
--alter modify

desc board2;


--create table board2 (
--bno number(4) primary key,
--bname varchar2(100),
--btitle varchar2(100),
--bcontent varchar2(3000),
--bdate date,
--bhit varchar2(30),
--bgroup number(4),
--bstep number(4),
--bindent number(4),
--bfile varchar2(100),
--bfli varchar2(100),
--bfile22 varchar2(30)
--);
--
--drop table board;



