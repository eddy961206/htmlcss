
-------------------------�������� : default �� �ȳ����� �⺻����--------------
create table board2(
no number(4),
title varchar2(30) default'����',
content varchar2(2000) default'����',
userid varchar2(20),
constraint FK_BOARD2_USERID foreign key(userid) references member(id)
);

insert into board2 (no,userid) VALUES (1,'aaa');

select * from board2;
---------------------------default ��-----------------------------


----------------------------����---------------------
--dept01 ���̺��� departments���̺��� 
--department_id,department_name, loc varchar2(10) default 'seoul'

create table dept01
as
select department_id, department_name from departments;

alter table dept01
add (loc varchar2(10) default'seoul'); --�÷� �߰�

select * from dept01;

alter table emp01
rename column jobid to deptid;

-- departments department_id foreign key

alter table emp01
add constraint fk_emp01_deptid foreign key(deptid) references departments(department_id);

desc departments;
desc emp01;   

alter table emp01
modify deptid number(6);

select * from emp01;

create table emp02
as 
select * from emp01 where 1=2;

alter table emp02 modify deptid number(6);

desc emp02;

insert into emp02
select empno,ename, to_number(deptid),salary,gender from emp01;

select * from emp02;

drop table emp01;

rename emp02 to emp01;

select * from emp01;
desc emp01;

alter table emp01
add constraint fk_emp01_deptid foreign key (deptid) references departments(department_id); -- emp01�� deptid�÷��� �ܷ�Ű�� ���. �θ�� dpartments���̺��� department_id�÷�.

desc member;







































