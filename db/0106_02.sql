--������ '20,000' - ������'10,000' �� ����ذ� 1���� ���
select '20,000','10,000' from dual; --20,000  10,000
select to_char(to_number('20,000','99,999')-to_number('10,000','99,999'),'99,999')from dual;
-- ����->���ڷ� �ٲ� ���� '99,999' ����, �ٽ� ����->���ڷ� �ٲ� ���� '99,999' ���±���

-- ����,  ����+commission, (����+commission)12 as annual
select salary, salary+salary*nvl(commission_pct,0),(salary+salary*nvl(commission_pct,0))*12,job_id
from employees
order by job_id;

select * from stuscore;

select * from stuscore
order by name;


select * from employees
where manager_id is null;

select nvl(manager_id,0) from employees;

------ manager_id�� null�� ����� null�� �ƴ϶� ceo�� �߰� �Ͻÿ�
select emp_name, nvl(to_char(manager_id),'ceo') from employees -- manager_id�÷��� char�� �ٲ�
where manager_id is null;

select emp_name, nvl(manager_id,replace(manager_id,null,'ceo')) from employees -- manager_id�÷��� char�� �ٲ�
where manager_id is null;

select emp_name,count(*) from employees;
-- select emp_name,count(*) from employees; �׷��Լ� count�� �׷��Լ� ������ select��°���

select round(avg(kor),2) from stuscore;

select sum(kor),round(avg(kor)),max(kor),min(kor),count(*) from stuscore;

select count(*),count(nvl(manager_id,0)) from employees; -- null �� �� count �ȵǴϱ� nvl�� ��ü�ؾ�.

select count(manager_id) from employees; -- null �� �� count �ȵ�

select * from board;

insert into board values(
(select max(no)+1 from board),'�Խñ�����2','�Խñ۳���2','aaa',sysdate,1,' ',0); -- ��������. select�� �� ��.

commit;

select * from board;

select max(no)+1 from board;

select salary from employees
where salary>=(select avg(salary) from employees); -- �Ѹ� ���ö����� �ڵ����� ��� �ٲ�

select avg(salary) from employees;


select department_id from employees;

--- �μ���ȣ�� 50���� ������� ���� ���?
select avg(salary) from employees
where department_id=50;

select avg(salary) from employees;


--- �μ���ȣ�� 50���� ������� ���� ����?
select sum(salary) from employees
where department_id=50;

------���� ���� ���� �޴� ��� ���Ͻÿ�-------
--select emp_name, max(salary) from employees; �̷��Ը� �ϸ� ����. �׷��Լ��� �Ϲ��Լ� ���̽Ἥ.
select emp_name, salary from employees
where salary = (select max(salary) from employees);

------���� ���� ���� �޴� ��� ���Ͻÿ�-------
select emp_name, salary from employees
where salary = (select min(salary) from employees);


---50�� �μ����� ���� ������ ���� ��� ����� �����----------
select min(salary) from employees  --ù��° ���
where department_id=50;

select emp_name, salary, department_id from employees
where salary = (select min(salary) from employees where department_id =50); --�ι�° ���
------50�� �μ����� ���� ������ ���� ��� ����� ���----------------


select to_char(sysdate,'YYYY"��"MM"��"DD"��"')from dual;  --2023��01��06��


--�¾ ������ ���ñ��� ��ĥ���� ??
select sysdate-to_date('19961206') from dual;  --9527.654467592592592592592592592592592593






