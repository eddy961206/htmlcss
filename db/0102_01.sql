-- c##orauser ���·� �����ؾ� �ϳ�, c##�� ���������ϰԲ� �ϴ� ����.
alter session set "_ORACLE_SCRIPT"=true;

-- orauser ����� ���
create user "orauser" identified by "1111";

-- orauser���� ����,������ ���
grant connect,resource, dba to "orauser";