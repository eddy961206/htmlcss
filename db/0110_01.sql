select * from member;

desc member;

select employee_id, emp_name, salary, salary + nvl(salary*commission_pct,0)realsalary from employees;

desc employees;

select * from employees;

select employee_id, emp_name, salary, department_id from employees
where salary>=6000;

select employee_id, emp_name, salary, department_id from employees where salary<=6000;

select * from board;
desc board;
insert into board values(
3,'게시글제목3','내용3','ccc',sysdate,1,'',1);
commit;

select no, title, content, userId, to_char(bdate,'yy/mm/dd'), hit from board;

drop table board2;

create table board2(
no number(4) primary key,
title varchar2(100) not null,
content varchar2(2000),
bdate timestamp default sysdate
);

insert into board2 values(board2_seq.nextval,'제목1','내용1',sysdate);

commit;

select * from board2;

delete board2 where no=1;

rollback;