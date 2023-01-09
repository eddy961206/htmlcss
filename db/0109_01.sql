-------------------��������: ����-------------------------

select department_id,salary from employees;

--- �μ���ȣ�� 50���� ������� ���� �� ��
select to_char(sum(salary),'$999,999') from employees --sum�� �׷��Լ� �̹Ƿ� �ٸ� �÷��̶� �Բ�x
where department_id = 50;

select count(*) from employees;    --107. count(*)�� null ���ִ°� ���Ե�.

select count(*), count(manager_id) from employees; --count(manager_id)�� 106. null ���ִ°� ������

select emp_name, manager_id from employees
where manager_id is null;

select max(salary), min(salary) from employees;

--���� ���� ���� �޴� ����� �̸��� ����� ������ �˷���
select employee_id, emp_name, salary from employees
where salary = (select max(salary) from employees);

---------�� �� ����------(�ٲ� ��)
select to_char(65) +1 from dual;
select to_char('65') +1 from dual;
select 65+1 from dual;
---------�� �� ����------(�ٲ� ��) ---- �������� ����ȯ �ڵ����� �� ���ִ� ��?

select sysdate from dual;

select sysdate,to_char(sysdate,'yyyy-mm-dd am hh:mi:ss') from dual;

select round(sysdate-to_date(19810101,'yyyymmdd'),2) as bdate from dual;

select * from employees;

select * from employees
where lower(emp_name) = 'david lee';  --�÷� ���� ������ ��� �ҹ��ڷ� �ٲ����� �˻��ϴ� �ܾ �ҹ��ڷ� �˻��ؾ�

select emp_name, ltrim(emp_name,'D') from employees;

select * from employees;

-- A1001, A1002,A1003..�� ��쿡 ltrim ���� ��.

--substr(���,����index,���ڸ��� �ڸ����� ��) : ����index�� 1���� ������. 0���� �ƴ�
select emp_name,substr(emp_name,5,2) from employees;

select * from employees;

select substr(phone_number,5,8) from employees;

----------------�������� : ���� ��------------------

select length(phone_number) from employees;
select round(avg(length(emp_name)),2) from employees;


-- ��� ����� ���� ������ ���� ���Ͻÿ�
select count(*) as "�� ��� ��", to_char(sum(salary),'$999,999') as "������ ��" from employees;

-- �μ� 50������ �ִ� ���� �ּ� ���� ���Ͻÿ�
select max(salary), min(salary) from employees
where department_id = 50;


----GROUP BY-----------------
select department_id, max(salary), min(salary) from employees
group by department_id -- �μ����� �ִ� �ּ� ������ �˷���. GROUP BY - ���� �Լ��� ���� ������. �׷��� �������־�� �ǹ̰� ����
order by department_id;
----GROUP BY-----------------

select * from employees;

------- �̸��� Donald OConnell�� ����� �Ի����� '~~�� ~�� ~�� ~����' �������� ����Ͻÿ�
select emp_name, to_char(hire_date,'yyyy"��" mm"��" dd"��" day') from employees
where emp_name = 'Donald OConnell';

-- �̸��� Pat Fay�� ����� �޷������� 1248������ ��ȭ 02,800,000 ���·� ���
select emp_name, salary, to_char((salary*1248),'L00,000,000')as "�� ���� ����" from employees
where emp_name = 'Pat Fay';

-- �Ի���, �Ի����� ���� ���
select hire_date, substr(hire_date,4,2) as "�Ի� ��" from employees;

-- �ڽ��� ���� ���� ���� ������ ���� ���
select last_day(to_date(19961206)) from dual;
select last_day('1996-12-06') from dual;
---------------------------------------------------------
