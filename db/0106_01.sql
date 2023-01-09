select employee_id from employees
where mod(employee_id,2)=1;

-----------------------------시퀀스---------------------------------------

create sequence freeboard_seq  --시퀀스
start with 1
increment by 1
minvalue 1
maxvalue 9999
nocycle
nocache
;

select * from board2;

delete board2 where no=2;

insert into board2 values(
1,'게시글제목','게시글내용','aaa',sysdate,1,'',0
);

insert into board2 values(
2,'게시글제목2','게시글내용2','aaa',sysdate,1,'',1
);

select * from freeboard;

select freeboard_seq.nextval from dual;

select freeboard_seq.currval from dual;

insert into freeboard values(
12,'관리자','제목12','내용12',sysdate,1,12,0
);

commit;
--------table타입과 데이터까지 복사
create table board as    --테이블 복제
select * from board2
;

create table freeboard2 as
select * from freeboard;

select * from freeboard2;

drop table freeboard2;

create table freeboard2 as
select * from freeboard
where 1=2;  -- 테이블 형태만 복제하기

select * from freeboard where 1=2;

select * from freeboard2;



create sequence freeboard2_seq
start with 1
increment by 1
minvalue 1
maxvalue 9999
nocycle
nocache
;

select * from freeboard2;

select freeboard2_seq.nextval from dual;

----------------------bNo의 값으로 만들어놓은 시퀀스 적용------
insert into freeboard2 values(
freeboard2_seq.nextval,'aaa','제목4','내용4',sysdate,1,freeboard2_seq.currval,0);
----------------------bNo의 값으로 만들어놓은 시퀀스 적용------

commit;

drop table freeboard2;

drop table board2;

desc freeboard;

-----------------bstep컬럼추가----------------
alter table freeboard add (bstep number(4)); 
------------------컬럼추가--------------------

desc freeboard;

---------------컬럼 숨기기----------------
alter table freeboard modify bhit invisible;
---------------컬럼 숨기기----------------

desc freeboard;

alter table freeboard modify bgroup invisible;

alter table freeboard modify bindent invisible;

desc freeboard;

alter table freeboard modify bhit visible;

desc freeboard;

alter table freeboard modify bgroup visible;

alter table freeboard modify bindent visible;

select * from freeboard;

------------------------------
update freeboard set bstep=1; -- bstep 컬럼의 값들을 싹 다 1로
--------------------------------

select * from freeboard;

commit;

select * from freeboard;


-- department_seq만들어 : 증가 10 시작번호 10----
create sequence department_seq
start with 10
increment by 10  -- "by"빼먹지 마
minvalue 1
maxvalue 9999
nocycle
nocache;
---------- department_seq만들어-------------

select * from freeboard;

--------------salary가 최대인 salary출력-----------
select max(salary) from employees;
--------------salary가 최대인 salary출력-----------

select max(bno),max(bno)+1 from freeboard;  --nextval로 하면 지워져도 원래 숫자보다 1이 커짐

select * from freeboard;

--insert into freeboard values(
--max(bno)+1,'관리자','제목입니다','내용입니다',sysdate,1,1,max(bno)+1,0);  -- '그룹 함수는 허가되지 않습니다' max(bno) 서브쿼리로해야


-----------------------------------------시퀀스 끝--------------------------------------------



---------------------------------------- 형변환 시작 ------------------------------------------------------

select sysdate-1 yesterday,sysdate today,sysdate+1 tomorrow from dual; -- sysdate 현재 날짜 '23/01/06'. 덧뺄셈 가능

select hire_date+100,hire_date from employees;

select sysdate+100 from employees;

------------6개월 뒤--------------
select add_months(sysdate,6) from employees; --23/07/06
------------6개월 뒤--------------

------------현재 달의 마지막 날--------------
select last_day(sysdate)from dual; --23/01/31
------------현재 달의 마지막 날--------------

-----------가장 가까운 '일'요일 언제?-------
select next_day(sysdate,'일') from dual;  --23/01/08
-----------가장 가까운 '일'요일 언제?-------

----------------100일 전으로부터 현재까지 몇 개월 지났니?------------
select round(months_between(sysdate,sysdate-100),2) from dual; --3.29개월 지났
----------------months_between(a,b)------------

----근무일수를 출력하시오.----
select trunc(sysdate - hire_date),hire_date from employees;
--------------------------

select sysdate from dual; --23/01/06

select to_char(sysdate,'YYYY-MM-DD')from dual; -- 형식 바꿈 2023-01-06

----------------월 기준 날짜 반올림-----------------
select round(sysdate,'month') from dual; -- 23/01/01 (1일~15일 -> 당월 1일로 반올림)
----------------월 기준 날짜 반올림-----------------

select round(hire_date,'month'),hire_date from employees;

---------------연 기준 날짜 반올림-----------------
select round(sysdate,'year') from dual;  --23/01/01 (1월~6월 -> 당해 1월1일로 반올림, 나머진 다음해 1/1.)
----------------연 기준 날짜 반올림-----------------

select round(hire_date,'year'),hire_date from employees;



--------- 며칠 지났니?---------
select hire_date, round(sysdate-hire_date) from employees;
--------- round(sysdate-hire_date)---------

-------------몇 달 지났니?----------
select round(months_between(sysdate,hire_date)) from employees;
--------months_between(a,b)-----------------

---------가장 가까운 금요일 언제니?---------------
select sysdate,next_day(sysdate,'금') from dual;
------------next_day(a,'금')---------------



create table board2(
bno number(4) primary key,
bname varchar2(100),
btitle varchar2(200),
bcontent varchar2(3000),
bdate date default sysdate,
bhit number(4) default 0, -- default로 하면 데이터 안넣어줘도 자동으로 0이 붙
bgroup number(4),
bstep number(4) default 1,
bindent number(4) default 0
);

create sequence board2_bno_seq
start with 1
increment by 1
minvalue 1
maxvalue 9999
nocycle
nocache
;

insert into board2(bno,bname,btitle,bcontent,bgroup) values(
board2_bno_seq.nextval,'홍길동','제목1','내용1',board2_bno_seq.currval
);

select * from board2; -- default로 한 건 직접 입력 안해도 지정해놓은 값이 들어감

--insert into board2(bno,bname,btitle,bcontent,bgroup) values(
--1,'홍길동','제목1','내용1',board2_bno_seq.currval
--);  --오류. bno는 primary key로 고윳값으로 지정해놨. 1이 있는데 또 입력하니까. 무결성 제약 조건에 위배됩니다 


-- to_char():날짜형/숫자형-> 문자형으로 형변환
-- to_date():문자형->날짜형으로 형변환 ----> 날짜형이어야 날짜에 대한 연산이 가능.

delete board2;

commit;

select * from board2;

insert into board2(bno,bname,btitle,bcontent,bgroup) values(
board2_bno_seq.nextval,'홍길동','2023-01-05','내용1',board2_bno_seq.currval
);

select to_date(btitle)+3, btitle from board2; 
--to_date(btitle) : 23/01/01(날짜형식), btitle:2023-01-01(char형식)

select bdate,to_char(bdate,'YYYY-MM-DD HH:Mi:SS') from board2;  --2023-01-06 11:42:26

select to_char(bdate,'YYYY/MM/DD DAY') from board2;  --day는 요일 '2023/01/06 금요일'

select to_char(hire_date,'yy/mm/dd dy') from employees; --day 대신 dy만 쓰면 '금'
select to_char(hire_date,'yy/mon/dd dy') from employees; --'07/6월/21 목'

select to_char(bdate,'YYYY-MM-DD am HH24:MI:SS') from freeboard; --HH24:24시간 단위, 시간앞에 am또는pm:오전오후 표시

select to_char(bdate,'YYYY-MM-DD pm HH24:MI:SS') from freeboard;


----숫자를 문자형으로 변환 시작----
select 123000000+100 from dual;   --숫자는 연산 가능

--select '123,000,000'+100 from dual; --오류. char에 연산 안됨

select replace('123,000,000',  ',' , '')from dual;  -- 쉼표를 찾아서 빈 공백으로 대체하라

select to_number('123,000,000') from dual; -- 에러 : 쉼표가 들어가있어서 숫자로 변경할 수 없음.
select to_number(replace('123,000,000',',',''))+100 as total from dual; -- replace사용해서 숫자형식으로 바꾼다음 숫자로 변환해야. 123000100

--replace예시
select replace('white color','white','black')from dual; -- white를 찾아서 black으로 대체하라. 결과:'black color'


select to_char(12300000.5,'L999,999,999.00') from dual; -- L:지역별 통화기호

select round(total/3,2) from stuscore;

select total*10000 from stuscore; --2960000
select to_char(total*10000,'999,999,999') from stuscore; --2,960,000

select to_char(11,'0000')from dual; -- 0011 '0000'대신'9999'였으면 11의 앞의 남는자리 2개에 0이 붙지않음.

select to_char(to_date(870101),'YYYY-MM-DD') from dual;

----------------??




select * from employees
where hire_date=to_date('20071207','YYYY-MM-DD');

select * from employees
where hire_date='20080113';

select round(sysdate-to_date('2008.01.01')) from dual;


--근무연수가 6000일 이상인 사람을 출력하시오.
select hire_date, round(sysdate-hire_date) from employees
where round(sysdate-hire_date)>=6000;

select hire_date, round(sysdate-hire_date) as work from employees
where round(sysdate-hire_date)>=6000  --where 뒤에 work로 하면 안됨
order by work desc;

--데이터 2만 - 데이터 1만 계산해고 1만을 출력
select '20,000','10,000' from dual;

---------------------------------------- 형변환 끝 ------------------------------------------------------







