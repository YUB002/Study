
--SQL(Structured Query Language) 구조화된 쿼리문들 
--Query문
--DDL(Data Definition Language): create, drop. alter 객체를 다루는 명령어
--DML(Data Manipulation Language): update, delete, insert select 데이터를 다루는 명령어
       -->DQL(Data Query Language): select 
--DCL(Data Control Language): grant, revoke 권한통제 명령어
--TCL(Transaction Control Language): rollback, commit, savepoint 트랜젝션 통제 명령어 



--  id가 cafe이고 패스워드가 cafe인 사용자 계정을 만들어라.
create user cafe identified by cafe;
create user kh identified by kh;

--계정 cafe에 접속할 권한과 자원을 관리할 수 있는 권한 부여
grant connect, resource to cafe;
grant connect, resource to kh;