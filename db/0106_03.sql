
select concat(kor,eng) from stuscore;  -- concat: 합치기. 딱 두개만 가능. 9999

--select max(10,20) from daul; -- 안됨. 


select kor||eng||math||total from stuscore;  -- ||: 합치기. 갯수 제한 없음

select * from employees;

-------------initcap()--------
select email, initcap(email) from employees;  -- initcap(email): 첫글자는 대문자, 나머진 소문자
-------------initcap()--------

select * from employees;

select * from employees
where lower(emp_name)='donald oconnell';

desc employees;

------------------rpad lpad-------------------
select rpad(email,15,'#')from employees;  --DOCONNEL#######  15짜리까지 #으로 채워라

select lpad(employee_id,5,'0') from employees; -- 5자리 사용하되 앞에 남는 자리에 0채워줘 (to_char와 비슷)
------------------rpad lpad-------------------


-------------LTRIM RTRIM-----------
insert into board2 values (
5,'a1005','홍길즈','내용입니다',sysdate,1,1,1,0
);

select * from board2;

select bno,bname,to_number(ltrim(bname,'a'))+100,btitle from board2;  --L트림으로 a1001에서 a를 없애고 숫자로 바꿔야 연산가능

select ltrim(btitle,'홍길')from board2; -- 동자순스즈

select emp_name from employees;

select emp_name,substr(emp_name,2,3) from employees;  -- 2번쨰부터 3개 Donald OConnell -> ona

-------------LTRIM RTRIM-----------







