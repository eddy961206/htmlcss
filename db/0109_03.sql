
---------------rank- 및 조인 ----------------
select * from stuscore;

select stuno,name,kor,eng,math,total,avg,rank, rank() over(order by total desc) from stuscore
order by stuno; -- rank자리에 실제 등수를 넣고싶어

select rank() over(order by total desc) from stuscore; -- 실제 등수 보여주기

-------------rank자리에 실제 등수를 넣기------------------------
update stuscore s1
set rank=(select ranks from 
(select rank() over(order by total desc) as ranks, stuno from stuscore) s2
where s1.stuno=s2.stuno);

-------------rank자리에 실제 등수를 넣기------------------------


select * from stuscore;

select max(salary) from employees;

select emp_name,salary from employees
where salary=(select max(salary) from employees);

select employee_id, emp_name, manager_id from employees
order by employee_id;

select emp_name, department_id from employees;


--------------join---------------------------
select emp_name, e.department_id, department_name from employees e, departments d
where e.department_id = d.department_id; -- department_id와 department_name을 같이 나오도록 table을 join.
--------------join---------------------------

select department_id,department_name from departments;


desc board2;

----------컬럼 삭제: ALTER table 테이블명 drop column 컬럼명 ------------
ALTER table board2 drop column bfile22;
alter table board2 drop column bfile;
----------------------------------------------

---------------복습-----------------------
--bfile,bfile2 컬럼을 추가해봐 => ALTER TABLE 테이블명 ADD (컬럼명 타입);
alter table board2 
add(bfile varchar2(100), bfile2 varchar2(200));
--bfile을 bprefile, bfile2는 bprefile2로 컬럼명 바꿔봐 => ALTER TABLE 테이블명 RENAME COLUMN ㄱ TO ㄴ
alter table board2 
rename column bfile to bprefile;
alter table board2
rename column bfile2 to bprefile2;
--그 두 컬럼을 삭제하시오 => ALTER TABLE 테이블명 DROP COLUMN 컬럼명
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
);--select ranks from 뒤에 있는 ()괄호 안 자체가 table인데 그걸 b라고 칭하는 것.

select stuno,name,rank()over(order by total desc) as ranks from stuscore;

select * from stuscore;

desc board2;

alter table board2  
drop column bindent;

desc board2;

alter table board2
add (bindent number(4));

select * from board2;








