
select concat(kor,eng) from stuscore;  -- concat: ��ġ��. �� �ΰ��� ����. 9999

--select max(10,20) from daul; -- �ȵ�. 


select kor||eng||math||total from stuscore;  -- ||: ��ġ��. ���� ���� ����

select * from employees;

-------------initcap()--------
select email, initcap(email) from employees;  -- initcap(email): ù���ڴ� �빮��, ������ �ҹ���
-------------initcap()--------

select * from employees;

select * from employees
where lower(emp_name)='donald oconnell';

desc employees;

------------------rpad lpad-------------------
select rpad(email,15,'#')from employees;  --DOCONNEL#######  15¥������ #���� ä����

select lpad(employee_id,5,'0') from employees; -- 5�ڸ� ����ϵ� �տ� ���� �ڸ��� 0ä���� (to_char�� ���)
------------------rpad lpad-------------------


-------------LTRIM RTRIM-----------
insert into board2 values (
5,'a1005','ȫ����','�����Դϴ�',sysdate,1,1,1,0
);

select * from board2;

select bno,bname,to_number(ltrim(bname,'a'))+100,btitle from board2;  --LƮ������ a1001���� a�� ���ְ� ���ڷ� �ٲ�� ���갡��

select ltrim(btitle,'ȫ��')from board2; -- ���ڼ�����

select emp_name from employees;

select emp_name,substr(emp_name,2,3) from employees;  -- 2�������� 3�� Donald OConnell -> ona

-------------LTRIM RTRIM-----------







