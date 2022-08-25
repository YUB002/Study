--cafe_menu라는 테이블을 만들어라.
--테이블 헤더 id, name, price
--number : 숫자열
--varchar(20) : 문자열(사이즈)
create table cafe_menu(
id number ,
name varchar(20),
price number
);

--생성된 cafe_menu 테이블에 대해 묘사하라.
desc cafe_menu;

--cafe_menu 테이블 안에 모든 내용(*)을 출력하라.
select * from cafe_menu;

--cafe_menu 테이블 안에 테이더를 저장하라
--문자열 표현은 싱글쿼테이션으로 표현
insert into cafe_menu values(1001, 'Americano', 2000);
insert into cafe_menu values(1002, 'Latte', 3000);

