-------------데이터 객체 시작---------------
--데이터형 종류 clob,blob...---
create table board3 (
id number(4),
name varchar2(30),
txt clob
);

insert into board3 values(
1, '홍길동','게시글 내용을 입력합니다.'
);
commit;
select * from board3;

create table board4(
id number(4),
name varchar2(30),
txt varchar2(4000)
);

desc board4;

drop table board4;
drop table board3;

select * from board2;

----테이블 복사본 만들기 복습 
--board의 타입과 내용 복제---
create table board3
as
select * from board; -- board3에 board의 타입, 내용물 복제

select * from board3;
---------------------------
create table board4
as 
select no,title,content from board; --board4엔 board의 no,title,content 컬럼의 내용들만 복제

select * from board4;
---------------------------
create table board5
as
select * from board where 1=2;  -- board5엔 board의 타입(틀)들만 복제

select * from board5;
desc board5;

--------------------------

select * from board5;
--------------내용물만 그대로 집어넣기-------------
insert into board5 select * from board;
---------------------------------------------

select * from board4; -- no,title,content컬럼밖에 없는 상태

--insert into board4 select * from board; --에러 : 컬럼 개수 틀려서 오류
insert into board4 select no,title,content from board;

select * from board4;

delete board4;

commit;

select * from board4;

---------board의 no컬럼의 데이터들만 board4의 no컬럼에 집어넣기--------
insert into board4(no) select no from board; 

select * from board2;


drop table board3;


-----------ALTER 시작-------------------- create, alter는 자동 커밋. 나머진 수동
alter table board2
add(bfile varchar2(30),bfile2 varchar2(30)); -- 컬럼 추가 alter - add();

desc board2;

alter table board2
modify (bfile varchar(100));  --타입 바꾸기 alter - modify();

alter table board2
rename column bfile2 to bfile22; -- 컬럼의 이름 바꾸기 alter - rename column A to B;

-- bhit의 타입을 -> varchar2(30)변경
alter table board2
modify(bhit varchar2(30)); --이미 컬럼 안에 데이터가 있으면 형변환 안됨. 안에있는걸 먼저 변경하든지 지우든지 해야

select * from board2;

update board2
set bhit='';  --bhit 싹 지우기 

select * from board2;

commit;

alter table board2
modify(bhit varchar2(30));  --bhit의 타입을 varchar2로 바꿈

desc board2;

update board2
set bhit=1;  -- bhit의 값들을 모두 1로.  set은 UPDATE 사용

select * from board2;

select bgroup, bgroup + 1 from board2; --22222

select bhit, bhit+1 from board2; --- 자동 형변환 되어서 bhit가 varchar2라도 연산 됨.


-----제약조건 바꾸기(추가하기)------
alter table board2 modify btitle varchar2(200) not null; --btitle에 null을 넣을 수 없도록.
--alter modify

desc board2;


--create table board2 (
--bno number(4) primary key,
--bname varchar2(100),
--btitle varchar2(100),
--bcontent varchar2(3000),
--bdate date,
--bhit varchar2(30),
--bgroup number(4),
--bstep number(4),
--bindent number(4),
--bfile varchar2(100),
--bfli varchar2(100),
--bfile22 varchar2(30)
--);
--
--drop table board;



