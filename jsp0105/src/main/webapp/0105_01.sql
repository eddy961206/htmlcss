select employee_id, emp_name,hire_date from employees
order by hire_date; 
-- board2 테아블 생성 (board.json)
create table board2 (
no number(4),
title varchar2(100),
content varchar2(3000),
userId varchar2(30),
bdate date,
hit number(4),
fileName varchar2(30),
noticeChk number(1)
);

insert into board2 (no,title,content,userId,bdate,hit,fileName,noticeChk) values (
1,'게시글제목','게시글내용','aaa',sysdate,1,'',0
);

select * from board2;

commit;

insert into board2 (no,title,content,userId,bdate,hit,fileName,noticeChk) values (
2,'게시글제목','게시글내용','aaa',sysdate,1,'',0
);

insert into board2 (no,title,content,userId,bdate,hit,fileName,noticeChk) values (
3,'게시글제목','게시글내용','aaa',sysdate,1,'',0
);

insert into board2 (no,title,content,userId,bdate,hit,fileName,noticeChk) values (
4,'게시글제목','게시글내용','aaa',sysdate,1,'',0
);

select * from board2;

rollback;

select * from board2;

select employee_id,emp_name,manager_id from employees; 

select distinct manager_id from employees;

select employee_id, emp_name from employees
where employee_id = 103;

select * from employees;
select employee_id,emp_name,department_id  from employees;

select * from departments;

select * from employees;

select salary, salary*12annual, (salary*12)-(salary*12*0.01)realAnn from employees;

select * from stuscore;

select kor,eng,kor+eng,(kor+eng)/2 from stuscore;

select * from employees;

select employee_id, emp_name,salary, commission_pct from employees;

select employee_id,emp_name,salary,commission_pct,salary+(salary*commission_pct) from employees;

select employee_id,emp_name,salary,nvl(commission_pct,0), -- nvl(a,b) : a가 null이면 a를 b로 가정한다
salary+(salary*nvl(commission_pct,0)) from employees;

select commission_pct from employees
where commission_pct is not null; -- is (not) null로 null인지 아닌지 알 수.

select EMP_NAME from Employees;  -- 값이 아닌 이상 대소문자 구별 없음

select emp_name as "사원 번 호"   from employees; -- " " 쌍따옴표 안에 들어간 건 띄어쓰기까지 그대로 보여줌

select department_id "부서번호",department_name "부서이름",manager_id "관리자번호" from departments;

select * from employees;
select employee_id as "사원번호", emp_name as "사원이름", manager_id as "관리자번호" from employees;

select * from stuscore;

select kor||','||eng||','||math as "subject" from stuscore;

select kor||'-'||eng||'-'||math as subject from stuscore;


select distinct department_id from employees; 

select * from employees;

select distinct job_id from employees;


select emp_name,salary from employees
where salary<=3000
order by salary;

select emp_name,salary from employees
where salary<=7000 and salary>=3000
order by salary desc;

select emp_name,salary from employees
where salary !=3000; -- <>,!=,^ : 아닌 것

--부서번호 department_id 10출력하시오
select emp_name,department_id from employees
where department_id=10;

select * from employees;

select employee_id, emp_name, salary from employees
where salary<=4000
order by salary desc
;

upper(),lower()

select emp_name from employees
where lower(emp_name)=lower('James Marlow');


select * from employees
where hire_date >='05/01/01';

--03/01/01 ~08/12/31
select * from employees
where hire_date >= '03/01/01' and hire_date < '08/12/31'
order by hire_date;

select salary, hire_date from employees
where hire_date between '03/01/03' and '08/12/31';


select * from employees
where department_id!=10;


--월급이 4000달러 이상이면서 입사일이 '03/01/01'이후인 사원을 검색하시오.
select emp_name, salary, hire_date from employees
where salary>=4000 and hire_date>='03/01/01';

--월급이 3000딸라 이상 6000딸라 이하인 사원 출력해
select emp_name, salary from employees
where salary>=3000 and salary<=6000;

select salary,hire_date from employees
where salary between 3000 and 6000; --between A and B는 양 끝 A,B가 무조건 포함.



--월급 4000,6000,7000달러인 사원 출력
select emp_name, salary from employees
where salary=4000 or salary=6000 or salary=7000; 

select salary,hire_date from employees
where salary in(4000,6000,7000); -- in() : 위와 같음(or or or ..)


--사원번호 100,200,300,400
select employee_id as e_id,emp_name,salary, hire_date from employees
where employee_id = 100 or employee_id = 200 or employee_id = 300 or employee_id = 400;

select emp_name from employees
where emp_name like 'S%'; --S%: S로 시작(대문자여야)

select emp_name from employees
where emp_name like '%n%'; --like '%n%' : 중간에 n이 있는거. 즉 n이 들어가있는거면 다 가져와

select emp_name from employees
where emp_name like '%아이유%';

select emp_name from employees
where lower(emp_name) like '%k%'; --emp_name like '%k%' or emp_name like '%K%'도 됨

select emp_name from employees;

select emp_name from employees
where emp_name like '__s%'; -- 두번째 글자가 o 인 사람을 찾아라(언더바_는 한 글자(어떤 값이와도 상관없)를 의미)

-- 뒤에서 두 번째 글자가 a인 사원 이름을 출력하시오..
select emp_name from employees
where emp_name like '%a_' ;
-- alt + shift + D : 행 삭제
-- ctrl + shift + D : 아래로 줄 자체 복제

create table freeboard(
bno number(4) primary key,
bname varchar2(20),
btitle varchar2(100),
bcontent varchar2(3000),
bdate date,
bhit number(4),
bgroup number(4),
bindent number(4)
);

insert into freeboard values(
1,'홍길동','제목1','내용1',sysdate,1,1,0
);

insert into freeboard values(
2,'홍길동','2022년 소득공제용 및 부가가치세','삼성카드를 이용 중이 회원님께 감사드려용',sysdate,1,2,0
);

insert into freeboard values(
3,'홍길동','개인정보 처리방침 변경 안내','삼성카드를 이용해 주셔서 감사합니다',sysdate,1,3,0
);

insert into freeboard values(
4,'관리자','KT 삼성카드 디자인 변경 안내','KT 삼성카드 디자인이 변경',sysdate,1,4,0
);

insert into freeboard values(
5,'관리자','프리미엄 리워즈 서비스 중 ‘무이자할부’ 개월 수 변경','회원님......',sysdate,1,5,0
);

insert into freeboard values(
6,'관리자','삼성카드 표준전자금융거래 기본약관 변경 안내','삼성카드 표준전자금융거래 기본약관이 변경되어 2023.2.1(수)부터 개정된 약관이 시행될 예정이에요.',sysdate,1,6,0
);

insert into freeboard values(
7,'관리자','2023년 삼성카드 CS패널 모집 안내','삼성카드에 많은 관심과 열정으로 적극적으로 참여해주실 ‘23년 CS패널을 모집합니다.',sysdate,1,7,0
);

insert into freeboard values(
8,'관리자','코로나19 피해 소상공인 및 중소기업을 위한 금융 지원','아래와 같은 금융 지원 서비스를 제공해 드려요.',sysdate,1,8,0
);

insert into freeboard values(
9,'관리자','코로나 19 피해에 따른 가계대출 프리워크아웃 지원 안내','이 서비스가 회원님께 조금이나마 위안과 힘이 되기를 바랄게요.',sysdate,1,9,0
);

insert into freeboard values(
10,'관리자','T 라이트 삼성카드 디자인 변경 안내','2022.12.07(수)에 발급되는 카드부터는 변경된 디자인이 적용될 예정.',sysdate,1,10,0
);

commit;

select * from freeboard;

select * from freeboard
where bcontent like '%삼성카드%';

select * from employees;

select * from employees
where manager_id is null;

select * from employees;

select * from employees
order by employee_id desc;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date,employee_id desc;

select * from stuscore;

select * from stuscore
order by total desc;


select stuno,name,total,
rank()over(order by total desc) as rank
from stuscore
order by stuno
;

select avg(salary) from employees; --평균 salary 구하기 6461.8...

select emp_name, salary from employees
where salary <= (select avg(salary) from employees)-- 평균 월급보다 작은 사람
order by salary desc;

--select employee_id, department_id, hire_date from employees
--order by employee_id desc, hire_date desc;

-- 부서번호로 정렬하되 같은 부서는 입사일이 최근 순으로 출력하세용
select employee_id, department_id, hire_date from employees
order by department_id asc, hire_date desc;

select avg,round(avg,1) from stuscore; -- round(a,1): a를 소수점 첫째자리에서 반올림 44.5
select avg(salary),round(avg(salary),2) from employees;


select -10,abs(-10) from dual; -- dual은 더미테이블.출력용


--사번이 짝수인 사번만 출력하시오 (mod():나머지사용)
select 10,mod(10,2)from dual;

select * from employees
where mod(employee_id,2)=0 -- employee_id를 2로나눈 나머지가 0인
order by employee_id;

select 34.5678,floor(34.5678),round(34.5678,2),trunc(34.5678,2),trunc(34.5678,-1),
round(35.5678,-1)
from dual;
--trunc는 floor와 같이 버림. 그 대신 trunc는 단위 지정 가능.


