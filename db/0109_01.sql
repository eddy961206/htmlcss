-------------------오전수업: 복습-------------------------

select department_id,salary from employees;

--- 부서번호가 50번인 사람들의 월급 총 합
select to_char(sum(salary),'$999,999') from employees --sum은 그룹함수 이므로 다른 컬럼이랑 함께x
where department_id = 50;

select count(*) from employees;    --107. count(*)는 null 들어가있는거 포함됨.

select count(*), count(manager_id) from employees; --count(manager_id)는 106. null 들어가있는거 미포함

select emp_name, manager_id from employees
where manager_id is null;

select max(salary), min(salary) from employees;

--가장 월급 많이 받는 사람의 이름과 사번과 월급을 알려줘
select employee_id, emp_name, salary from employees
where salary = (select max(salary) from employees);

---------셋 다 가능------(바뀐 듯)
select to_char(65) +1 from dual;
select to_char('65') +1 from dual;
select 65+1 from dual;
---------셋 다 가능------(바뀐 듯) ---- 생각보다 형변환 자동으로 잘 해주는 듯?

select sysdate from dual;

select sysdate,to_char(sysdate,'yyyy-mm-dd am hh:mi:ss') from dual;

select round(sysdate-to_date(19810101,'yyyymmdd'),2) as bdate from dual;

select * from employees;

select * from employees
where lower(emp_name) = 'david lee';  --컬럼 안의 값들을 모두 소문자로 바꿨으면 검색하는 단어도 소문자로 검색해야

select emp_name, ltrim(emp_name,'D') from employees;

select * from employees;

-- A1001, A1002,A1003..인 경우에 ltrim 쓰일 수.

--substr(대상,시작index,몇자리수 자를건지 수) : 시작index는 1부터 시작임. 0부터 아님
select emp_name,substr(emp_name,5,2) from employees;

select * from employees;

select substr(phone_number,5,8) from employees;

----------------오전수업 : 복습 끝------------------

select length(phone_number) from employees;
select round(avg(length(emp_name)),2) from employees;


-- 모든 사원의 수와 월급의 합을 구하시오
select count(*) as "총 사원 수", to_char(sum(salary),'$999,999') as "월급의 합" from employees;

-- 부서 50번에서 최대 월급 최소 월급 구하시오
select max(salary), min(salary) from employees
where department_id = 50;


----GROUP BY-----------------
select department_id, max(salary), min(salary) from employees
group by department_id -- 부서별로 최대 최소 월급을 알려줌. GROUP BY - 단일 함수도 같이 쓰려면. 그룹이 지어져있어야 의미가 있음
order by department_id;
----GROUP BY-----------------

select * from employees;

------- 이름이 Donald OConnell인 사람의 입사일을 '~~년 ~월 ~일 ~요일' 형식으로 출력하시오
select emp_name, to_char(hire_date,'yyyy"년" mm"월" dd"일" day') from employees
where emp_name = 'Donald OConnell';

-- 이름이 Pat Fay인 사람의 달러월급을 1248원기준 원화 02,800,000 형태로 출력
select emp_name, salary, to_char((salary*1248),'L00,000,000')as "원 단위 월급" from employees
where emp_name = 'Pat Fay';

-- 입사일, 입사일의 월을 출력
select hire_date, substr(hire_date,4,2) as "입사 월" from employees;

-- 자신의 생일 속한 달의 마지막 일자 출력
select last_day(to_date(19961206)) from dual;
select last_day('1996-12-06') from dual;
---------------------------------------------------------
