
drop table board;

create table board(
bId number(4),
bName varchar2(20),
bTitle varchar2(100),
bContent varchar2(300),
bDate date,
bHit number(4),
bGroup number(4),
bStep number(4),
bIndent number(4)
);

insert into board (bId,bName,bTitle,bContent,bDate,bHit,bGroup,bStep,bIndent) values(
1,'ȫ�浿','�����Դϴ�','�����Դϴ�',sysdate,1,1,1,0);

select * from board;

select bdate,to_char(bdate,'YYYY-MM-DD'),
to_char(bdate,'YYYY.MM.DD HH24:MI:SS') from board;

-- distinct : �ߺ�����
select distinct manager_id from employees;

select * from departments;

select * from jobs;

select * from employees; 

-- ����� �̸�, �޿�, �Ի�����

select emp_name,salary,hire_date from employees
order by salary desc;  

select * from departments;

select * from employees;

-- emp_namer�� employees���̺� �ִ� department_id��  department_name�� ������
-- ���? departments���̺�� employees���̺���.
-- ���� ������ ��? employees���̺���department_id�� departments���̺���department_id�� ���� ������ �ֵ鸸.
select emp_name,employees.department_id,department_name from departments,employees
where employees.department_id = departments.department_id;

desc employees;


select salary from employees;
select salary,salary*12,(salary*12)-(salary*12*0.02) as realSalary from employees; --as�� �ϸ� �÷����� realSalary�� ��

create table stuScore(
stuNum number(4),
stuName varchar2(20),
kor number(3),
eng number(3),
math number(3),
total number(3),
avg number(5,2),
rank number(3)
);

insert into stuscore values (
1,'ȫ�浿',100,100,99,100+100+99,(100+100+99)/3,1
);

select * from stuscore;

select stuno,name,kor/2 as kor from stuscore;

select name,(kor+eng) as total from stuscore;
select total-math from stuscore;

select stuno,name,avg from stuscore
where avg>=95;

select sum(total) from stuscore;

commit;