
drop table board;

create table board(
bId number(4),
bName varchar2(20),
bTitle varchar2(100),
bContent varchar2(300),
bDate date,
bHit number(4),
bGroup number(4),
bStep number(4),
bIndent number(4)
);

insert into board (bId,bName,bTitle,bContent,bDate,bHit,bGroup,bStep,bIndent) values(
1,'홍길동','제목입니다','내용입니다',sysdate,1,1,1,0);

select * from board;

commit;