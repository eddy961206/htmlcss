
---------------rank- �� ���� ----------------
select * from stuscore;

select stuno,name,kor,eng,math,total,avg,rank, rank() over(order by total desc) from stuscore
order by stuno; -- rank�ڸ��� ���� ����� �ְ�;�

select rank() over(order by total desc) from stuscore; -- ���� ��� �����ֱ�

-------------rank�ڸ��� ���� ����� �ֱ�------------------------
update stuscore s1
set rank=(select ranks from 
(select rank() over(order by total desc) as ranks, stuno from stuscore) s2
where s1.stuno=s2.stuno);

-------------rank�ڸ��� ���� ����� �ֱ�------------------------


select * from stuscore;

select max(salary) from employees;

select emp_name,salary from employees
where salary=(select max(salary) from employees);

select employee_id, emp_name, manager_id from employees
order by employee_id;

select emp_name, department_id from employees;


--------------join---------------------------
select emp_name, e.department_id, department_name from employees e, departments d
where e.department_id = d.department_id; -- department_id�� department_name�� ���� �������� table�� join.
--------------join---------------------------

select department_id,department_name from departments;


desc board2;

----------�÷� ����: ALTER table ���̺�� drop column �÷��� ------------
ALTER table board2 drop column bfile22;
alter table board2 drop column bfile;
----------------------------------------------

---------------����-----------------------
--bfile,bfile2 �÷��� �߰��غ� => ALTER TABLE ���̺�� ADD (�÷��� Ÿ��);
alter table board2 
add(bfile varchar2(100), bfile2 varchar2(200));
--bfile�� bprefile, bfile2�� bprefile2�� �÷��� �ٲ�� => ALTER TABLE ���̺�� RENAME COLUMN �� TO ��
alter table board2 
rename column bfile to bprefile;
alter table board2
rename column bfile2 to bprefile2;
--�� �� �÷��� �����Ͻÿ� => ALTER TABLE ���̺�� DROP COLUMN �÷���
alter table board2
drop column bprefile,bprefile2;

desc board2;

alter table board2 modify bhit invisible;
alter table board2 modify bhit visible;
desc board2;

alter table board2 modify bgroup invisible;
alter table board2 modify bstep invisible;
alter table board2 modify bindent invisible;

desc board2;
select * from board2;

alter table board2 modify bgroup visible;
alter table board2 modify bstep visible;
alter table board2 modify bindent visible;

select * from stuscore;

update stuscore
set rank='';

select * from stuscore;

select max(salary) from employees;

select emp_name,salary from employees
where salary = (select max(salary) from employees);

update stuscore a
set rank = ( 
select ranks from 
(select rank()over(order by total desc) ranks, stuno,name
from stuscore) b
where a.stuno = b.stuno
);--select ranks from �ڿ� �ִ� ()��ȣ �� ��ü�� table�ε� �װ� b��� Ī�ϴ� ��.

select stuno,name,rank()over(order by total desc) as ranks from stuscore;

select * from stuscore;

desc board2;

alter table board2  
drop column bindent;

desc board2;

alter table board2
add (bindent number(4));

select * from board2;








