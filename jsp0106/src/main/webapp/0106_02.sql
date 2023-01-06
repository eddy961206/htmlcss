--데이터 '20,000' - 데이터'10,000' 만 계산해고 1만을 출력
select '20,000','10,000' from dual; --20,000  10,000
select to_char(to_number('20,000','99,999')-to_number('10,000','99,999'),'99,999')from dual;
-- 문자->숫자로 바꿀 때도 '99,999' 쓰고, 다시 숫자->문자로 바꿀 때도 '99,999' 쓰는구나

-- 월급,  월급+commission, (월급+commission)12 as annual
select salary, salary+salary*nvl(commission_pct,0),(salary+salary*nvl(commission_pct,0))*12,job_id
from employees
order by job_id;

select * from stuscore;

select * from stuscore
order by name;


select * from employees
where manager_id is null;

select nvl(manager_id,0) from employees;

------ manager_id가 null인 사람을 null이 아니라 ceo로 뜨게 하시오
select emp_name, nvl(to_char(manager_id),'ceo') from employees -- manager_id컬럼을 char로 바꿈
where manager_id is null;

select emp_name, nvl(manager_id,replace(manager_id,null,'ceo')) from employees -- manager_id컬럼을 char로 바꿈
where manager_id is null;

select emp_name,count(*) from employees;
-- select emp_name,count(*) from employees; 그룹함수 count는 그룹함수 끼리만 select출력가능

select round(avg(kor),2) from stuscore;

select sum(kor),round(avg(kor)),max(kor),min(kor),count(*) from stuscore;

select count(*),count(nvl(manager_id,0)) from employees; -- null 인 건 count 안되니까 nvl로 대체해야.

select count(manager_id) from employees; -- null 인 건 count 안됨

select * from board;

insert into board values(
(select max(no)+1 from board),'게시글제목2','게시글내용2','aaa',sysdate,1,' ',0); -- 서브쿼리. select가 또 들어가.

commit;

select * from board;

select max(no)+1 from board;

select salary from employees
where salary>=(select avg(salary) from employees); -- 한명씩 들어올때마다 자동으로 평균 바뀜

select avg(salary) from employees;


select department_id from employees;

--- 부서번호가 50번인 사람들의 월급 평균?
select avg(salary) from employees
where department_id=50;

select avg(salary) from employees;


--- 부서번호가 50번인 사람들의 월급 총합?
select sum(salary) from employees
where department_id=50;

------가장 많이 월급 받는 사람 구하시오-------
--select emp_name, max(salary) from employees; 이렇게만 하면 오류. 그룹함수와 일반함수 같이써서.
select emp_name, salary from employees
where salary = (select max(salary) from employees);

------가장 적게 월급 받는 사람 구하시오-------
select emp_name, salary from employees
where salary = (select min(salary) from employees);


---50번 부서에서 가장 월급이 낮은 사람 사원명 출력해----------
select min(salary) from employees  --첫번째 방법
where department_id=50;

select emp_name, salary, department_id from employees
where salary = (select min(salary) from employees where department_id =50); --두번째 방법
------50번 부서에서 가장 월급이 낮은 사람 사원명 출력----------------


select to_char(sysdate,'YYYY"년"MM"월"DD"일"')from dual;  --2023년01월06일


--태어난 날부터 오늘까지 며칠인지 ??
select sysdate-to_date('19961206') from dual;  --9527.654467592592592592592592592592592593






