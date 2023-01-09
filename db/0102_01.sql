-- c##orauser 형태로 접근해야 하나, c##을 생략가능하게끔 하는 구문.
alter session set "_ORACLE_SCRIPT"=true;

-- orauser 사용자 등록
create user "orauser" identified by "1111";

-- orauser에게 접근,사용권한 등록
grant connect,resource, dba to "orauser";