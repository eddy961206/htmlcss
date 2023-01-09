
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
1,'홍길동','제목입니다','내용입니다',sysdate,1,1,1,0);

select * from board;

select bdate,to_char(bdate,'YYYY-MM-DD'),
to_char(bdate,'YYYY.MM.DD HH24:MI:SS') from board;

-- distinct : 중복제거
select distinct manager_id from employees;

select * from departments;

select * from jobs;

select * from employees; 

-- 사원의 이름, 급여, 입사일자

select emp_name,salary,hire_date from employees
order by salary desc;  

select * from departments;

select * from employees;

-- emp_namer과 employees테이블에 있는 department_id와  department_name을 가져와
-- 어디서? departments테이블과 employees테이블에서.
-- 무슨 조건일 때? employees테이블의department_id와 departments테이블의department_id가 같은 조건인 애들만.
select emp_name,employees.department_id,department_name from departments,employees
where employees.department_id = departments.department_id;

desc employees;


select salary from employees;
select salary,salary*12,(salary*12)-(salary*12*0.02) as realSalary from employees; --as로 하면 컬럼명이 realSalary가 됨

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
1,'홍길동',100,100,99,100+100+99,(100+100+99)/3,1
);

select * from stuscore;

select stuno,name,kor/2 as kor from stuscore;

select name,(kor+eng) as total from stuscore;
select total-math from stuscore;

select stuno,name,avg from stuscore
where avg>=95;

select sum(total) from stuscore;

commit;