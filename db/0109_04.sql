select * from board2;

insert into board2 values(
6,'a1006','이순신','내용6',sysdate,1,1,1,1
);


commit;

---------unused(컬럼명) -> invisible과 비슷. 사용 안한다는 뜻--------
alter table board2
set unused(bindent);

desc board2;

insert into board2 values(
7,'a1007','유관순','내용7',sysdate,1,1,1
); -- bindent 컬럼을 unused처리 해놔서 덜 입력해야.

alter table board2
drop unused columns;
---------unused(컬럼명) -> invisible과 비슷. 사용 안한다는 뜻--------



----------테이블 이름 변경------------
rename board2 to fboard;
----------테이블 이름 변경------------

-------------------------제약조건----------------------------
select * from member;

create table board2( --board2를 fboard로 바꿔놔서 가능)
bno number(4) primary key,
bid varchar2(30) not null,
btitle varchar2(100) not null,
bcontent clob,
bdate date,
bhit number(4),
bgroup number(4),
bstep number(4),
bindent number(4)
);

desc board2;

insert into board2 (bno,bid,btitle) values(
board2_seq.nextval,'aaa','제목입니다.1');

select * from board2;

insert into board2(bno, bid,btitle) values(
3,'aaa','제목입니다.1'
);

select * from tab;

desc board2;
----------------NOT NULL: null허용X, 중복은 허용------------------
alter table board2 modify bhit number(4) not null; 
-- bhit컬럼의 값들 중 이미 null 들어가있는 게
-- 있으면 바로 안됨. 그것들 없애거나 null이 아닌 걸로 변환 후 바꿀 수 있

select bhit from board2;

update board2 set bhit=1;

select * from board2;
------------------------------------------
----------UIQUE : NULL 허용, 중복 허용X--(alter사용)-----------
alter table board2 modify bindent number(4) unique;

insert into board2 values(
4,'aaa','제목1','내용1',sysdate,1,1,1,2);
-----------------------UIQUE-----------------------------

---------primary key: 중복과 null 둘 다 허용X------------
alter table board modify no number(4) primary key;
------------------primary key---------------------

desc board;

-------------------foreign key--------------------
select * from board;

select * from member;

desc member;


alter table board
add constraint fk_id foreign key(id) references member(id);


create table board3 (
no number(4) primary key,
title varchar2(30) not null,
content varchar2(2000),
userid varchar2(20) references member(id),  --foreign key 만듦. member테이블과 연결됨
bdate date
);


insert into board3 values(
1,'제목입니다.1','내용','aaa',sysdate
);

select * from member;

insert into board3 values(
2,'제목입니다.1','내용','aaa',sysdate
);

insert into board3 values(
3,'제목입니다.1','내용','ggg',sysdate
); 

insert into board3 values(
3,'제목입니다.1','내용','abc',sysdate
); --안됨. 부모키 없다고 함. member에 'abc'라는 사람이 없다는 뜻

commit;

create table board4 (
no number(4) primary key,
title varchar2(30) not null,
content varchar2(2000),
userid varchar2(30),
bdate date,
constraint fk_userid foreign key(userid) references member(id) -- foreign key 별칭fk_userid. 
--에러 시에 '무결성 제약조건(ORAUSER.FK_USERID)이 위배되었습니다- 부모 키가 없습니다' 라고 알려줌
);

insert into board4 values(
3,'제목1','내용1','abc',sysdate);

select * from board4;

drop table board4;
drop table board3; 

create table board3 (
no number(4) primary key,
title varchar2(40),
content varchar2(3000),
userid varchar2(20) references member(id), --외래키 설정 방법 1
bdate date
);

create table board4 (
no number(4) primary key,
title varchar2(40),
content varchar2(3000),
userid varchar2(20),
bdate date,
constraint fk_userid foreign key(userid) references member(id) -- 외래키 설정 방법2
);

desc board;

alter table board
add constraint fk_userid1 ------------- 외래키 나중 등록 
foreign key(userid) references member(id);

alter table memeber modify id varchar2(20) primary key; -- 기본키를 id컬럼에 등록
-------------------foreign key 끝-------------------

drop table board4;
-----------------CHECK(특정값제한-------------------------------
create table emp01(
empno number(4) primary key,
ename varchar2(20) not null,
jobid varchar2(9),
salary number(7,2) check(salary between 500 and 5000), --500과 5000사이만 값 들어올 수
gender varchar2(1) check(gender in('M','F')) -- M 또는 F만 가능
);

insert into emp01 values(
5,'이순신','30',4000,'M');

commit;
---------------------check끝-----------------


















