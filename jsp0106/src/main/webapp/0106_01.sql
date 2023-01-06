select employee_id from employees
where mod(employee_id,2)=1;

-----------------------------������---------------------------------------

create sequence freeboard_seq  --������
start with 1
increment by 1
minvalue 1
maxvalue 9999
nocycle
nocache
;

select * from board2;

delete board2 where no=2;

insert into board2 values(
1,'�Խñ�����','�Խñ۳���','aaa',sysdate,1,'',0
);

insert into board2 values(
2,'�Խñ�����2','�Խñ۳���2','aaa',sysdate,1,'',1
);

select * from freeboard;

select freeboard_seq.nextval from dual;

select freeboard_seq.currval from dual;

insert into freeboard values(
12,'������','����12','����12',sysdate,1,12,0
);

commit;
--------tableŸ�԰� �����ͱ��� ����
create table board as    --���̺� ����
select * from board2
;

create table freeboard2 as
select * from freeboard;

select * from freeboard2;

drop table freeboard2;

create table freeboard2 as
select * from freeboard
where 1=2;  -- ���̺� ���¸� �����ϱ�

select * from freeboard where 1=2;

select * from freeboard2;



create sequence freeboard2_seq
start with 1
increment by 1
minvalue 1
maxvalue 9999
nocycle
nocache
;

select * from freeboard2;

select freeboard2_seq.nextval from dual;

----------------------bNo�� ������ �������� ������ ����------
insert into freeboard2 values(
freeboard2_seq.nextval,'aaa','����4','����4',sysdate,1,freeboard2_seq.currval,0);
----------------------bNo�� ������ �������� ������ ����------

commit;

drop table freeboard2;

drop table board2;

desc freeboard;

-----------------bstep�÷��߰�----------------
alter table freeboard add (bstep number(4)); 
------------------�÷��߰�--------------------

desc freeboard;

---------------�÷� �����----------------
alter table freeboard modify bhit invisible;
---------------�÷� �����----------------

desc freeboard;

alter table freeboard modify bgroup invisible;

alter table freeboard modify bindent invisible;

desc freeboard;

alter table freeboard modify bhit visible;

desc freeboard;

alter table freeboard modify bgroup visible;

alter table freeboard modify bindent visible;

select * from freeboard;

------------------------------
update freeboard set bstep=1; -- bstep �÷��� ������ �� �� 1��
--------------------------------

select * from freeboard;

commit;

select * from freeboard;


-- department_seq����� : ���� 10 ���۹�ȣ 10----
create sequence department_seq
start with 10
increment by 10  -- "by"������ ��
minvalue 1
maxvalue 9999
nocycle
nocache;
---------- department_seq�����-------------

select * from freeboard;

--------------salary�� �ִ��� salary���-----------
select max(salary) from employees;
--------------salary�� �ִ��� salary���-----------

select max(bno),max(bno)+1 from freeboard;  --nextval�� �ϸ� �������� ���� ���ں��� 1�� Ŀ��

select * from freeboard;

--insert into freeboard values(
--max(bno)+1,'������','�����Դϴ�','�����Դϴ�',sysdate,1,1,max(bno)+1,0);  -- '�׷� �Լ��� �㰡���� �ʽ��ϴ�' max(bno) �����������ؾ�


-----------------------------------------������ ��--------------------------------------------



---------------------------------------- ����ȯ ���� ------------------------------------------------------

select sysdate-1 yesterday,sysdate today,sysdate+1 tomorrow from dual; -- sysdate ���� ��¥ '23/01/06'. ������ ����

select hire_date+100,hire_date from employees;

select sysdate+100 from employees;

------------6���� ��--------------
select add_months(sysdate,6) from employees; --23/07/06
------------6���� ��--------------

------------���� ���� ������ ��--------------
select last_day(sysdate)from dual; --23/01/31
------------���� ���� ������ ��--------------

-----------���� ����� '��'���� ����?-------
select next_day(sysdate,'��') from dual;  --23/01/08
-----------���� ����� '��'���� ����?-------

----------------100�� �����κ��� ������� �� ���� ������?------------
select round(months_between(sysdate,sysdate-100),2) from dual; --3.29���� ����
----------------months_between(a,b)------------

----�ٹ��ϼ��� ����Ͻÿ�.----
select trunc(sysdate - hire_date),hire_date from employees;
--------------------------

select sysdate from dual; --23/01/06

select to_char(sysdate,'YYYY-MM-DD')from dual; -- ���� �ٲ� 2023-01-06

----------------�� ���� ��¥ �ݿø�-----------------
select round(sysdate,'month') from dual; -- 23/01/01 (1��~15�� -> ��� 1�Ϸ� �ݿø�)
----------------�� ���� ��¥ �ݿø�-----------------

select round(hire_date,'month'),hire_date from employees;

---------------�� ���� ��¥ �ݿø�-----------------
select round(sysdate,'year') from dual;  --23/01/01 (1��~6�� -> ���� 1��1�Ϸ� �ݿø�, ������ ������ 1/1.)
----------------�� ���� ��¥ �ݿø�-----------------

select round(hire_date,'year'),hire_date from employees;



--------- ��ĥ ������?---------
select hire_date, round(sysdate-hire_date) from employees;
--------- round(sysdate-hire_date)---------

-------------�� �� ������?----------
select round(months_between(sysdate,hire_date)) from employees;
--------months_between(a,b)-----------------

---------���� ����� �ݿ��� ������?---------------
select sysdate,next_day(sysdate,'��') from dual;
------------next_day(a,'��')---------------



create table board2(
bno number(4) primary key,
bname varchar2(100),
btitle varchar2(200),
bcontent varchar2(3000),
bdate date default sysdate,
bhit number(4) default 0, -- default�� �ϸ� ������ �ȳ־��൵ �ڵ����� 0�� ��
bgroup number(4),
bstep number(4) default 1,
bindent number(4) default 0
);

create sequence board2_bno_seq
start with 1
increment by 1
minvalue 1
maxvalue 9999
nocycle
nocache
;

insert into board2(bno,bname,btitle,bcontent,bgroup) values(
board2_bno_seq.nextval,'ȫ�浿','����1','����1',board2_bno_seq.currval
);

select * from board2; -- default�� �� �� ���� �Է� ���ص� �����س��� ���� ��

--insert into board2(bno,bname,btitle,bcontent,bgroup) values(
--1,'ȫ�浿','����1','����1',board2_bno_seq.currval
--);  --����. bno�� primary key�� ���������� �����س�. 1�� �ִµ� �� �Է��ϴϱ�. ���Ἲ ���� ���ǿ� ����˴ϴ� 


-- to_char():��¥��/������-> ���������� ����ȯ
-- to_date():������->��¥������ ����ȯ ----> ��¥���̾�� ��¥�� ���� ������ ����.

delete board2;

commit;

select * from board2;

insert into board2(bno,bname,btitle,bcontent,bgroup) values(
board2_bno_seq.nextval,'ȫ�浿','2023-01-05','����1',board2_bno_seq.currval
);

select to_date(btitle)+3, btitle from board2; 
--to_date(btitle) : 23/01/01(��¥����), btitle:2023-01-01(char����)

select bdate,to_char(bdate,'YYYY-MM-DD HH:Mi:SS') from board2;  --2023-01-06 11:42:26

select to_char(bdate,'YYYY/MM/DD DAY') from board2;  --day�� ���� '2023/01/06 �ݿ���'

select to_char(hire_date,'yy/mm/dd dy') from employees; --day ��� dy�� ���� '��'
select to_char(hire_date,'yy/mon/dd dy') from employees; --'07/6��/21 ��'

select to_char(bdate,'YYYY-MM-DD am HH24:MI:SS') from freeboard; --HH24:24�ð� ����, �ð��տ� am�Ǵ�pm:�������� ǥ��

select to_char(bdate,'YYYY-MM-DD pm HH24:MI:SS') from freeboard;


----���ڸ� ���������� ��ȯ ����----
select 123000000+100 from dual;   --���ڴ� ���� ����

--select '123,000,000'+100 from dual; --����. char�� ���� �ȵ�

select replace('123,000,000',  ',' , '')from dual;  -- ��ǥ�� ã�Ƽ� �� �������� ��ü�϶�

select to_number('123,000,000') from dual; -- ���� : ��ǥ�� ���־ ���ڷ� ������ �� ����.
select to_number(replace('123,000,000',',',''))+100 as total from dual; -- replace����ؼ� ������������ �ٲ۴��� ���ڷ� ��ȯ�ؾ�. 123000100

--replace����
select replace('white color','white','black')from dual; -- white�� ã�Ƽ� black���� ��ü�϶�. ���:'black color'


select to_char(12300000.5,'L999,999,999.00') from dual; -- L:������ ��ȭ��ȣ

select round(total/3,2) from stuscore;

select total*10000 from stuscore; --2960000
select to_char(total*10000,'999,999,999') from stuscore; --2,960,000

select to_char(11,'0000')from dual; -- 0011 '0000'���'9999'������ 11�� ���� �����ڸ� 2���� 0�� ��������.

select to_char(to_date(870101),'YYYY-MM-DD') from dual;

----------------??




select * from employees
where hire_date=to_date('20071207','YYYY-MM-DD');

select * from employees
where hire_date='20080113';

select round(sysdate-to_date('2008.01.01')) from dual;


--�ٹ������� 6000�� �̻��� ����� ����Ͻÿ�.
select hire_date, round(sysdate-hire_date) from employees
where round(sysdate-hire_date)>=6000;

select hire_date, round(sysdate-hire_date) as work from employees
where round(sysdate-hire_date)>=6000  --where �ڿ� work�� �ϸ� �ȵ�
order by work desc;

--������ 2�� - ������ 1�� ����ذ� 1���� ���
select '20,000','10,000' from dual;

---------------------------------------- ����ȯ �� ------------------------------------------------------







