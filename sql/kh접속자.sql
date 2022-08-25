--select 문법
--존재하는 테이블 내에서 특정 데이터를 선별하여 출력하는 명령
--select * from [데이블 이름]
select table_name from user_tables;

--전체 컬럼 모두 출력
select * from employee;
--객체는 대소문자를 구분짓지 않지만 문자열은 대소문자를 구분짓는다.

--특정 컬럼명만 선택하여 출력
select emp_id, emp_name, email from employee;

--특정 조건을 만족하는 row만 출력
select emp_id, emp_name, salary from employee where emp_id=210;
select * from employee where emp_name='유하진';
select * from employee where dept_code='D8' or emp_name='이태림';
--where은 자바의 for문-if문처럼 실행됨
--자바에서는 == 을 사용하지만 오라클에서는 = 사용
--자바에서는 &&,||을 사용하지만 오라클에서는 and, or 을 사용

--quiz
--1.job 테이블에서 job_name의 정보만 출력해보세요
select job_name from job;
--2.Department 테이블에서 모든 컬럼을 출력해보세요.
select * from department;
--3.Employee 테이블에서 이름, 이메일, 전화번호, 고용일만 출력해보세요.
select emp_name, email, phone, hire_date from employee;
--4.Employee 테이블에서 월급이 250이상인 사람의 이름과 급여등급만 출력해보세요.
select emp_name, sal_level from employee where salary >= 2500000;
--5.Employee 테이블에서 급여가 350만원 이상이면서 job_code가 J3인 사람의 이름과 전화번호를 출력해보세요.
select emp_name, phone from employee where salary >=3500000 and job_code = 'J3';
--6.Employee 테이블에서 급여가 400만원 이상 600만원 이하인 사람의 사번, 이름, 부서코드,급여를 출력해보세요.
select emp_id, emp_name, dept_code, salary from employee where 4000000 <= salary and salary <= 6000000;
-- = select emp_id, emp_name, dept_code, salary from employee where salary between 4000000 and 6000000;

-----------------------------------------------------------------------------------------------------------------
--Alias 별칭
select emp_name, salary*12 as "연봉", '원' from employee;
--as "별명"/ as와 더블쿼테이션은 생략 가능 
--'원'은 데이터 영역으로 표현되어 싱글쿼테이션 사용
--"연봉"은 데이터 밖, 헤더로 들어가는 값으로 더블쿼테이션 사용

--sysdate : timestamp, 날짜타입
select sysdate from dual;
-- dual 더미테이블은 딱 한 개의 컬럼, 한 개의 로우만 가지고 있음 테스트용

--Employee 테이블 내에서 20년 이상 근속한 직원의 이름, 급여, 보너스율을 출력하세요.
select emp_name, salary, bonus from EMPLOYEE where sysdate - hire_date >=20*365;
--select emp_name, salary, bonus from EMPLOYEE where = (sysdate - hire_date)/365>=20;
--날짜타입에서 연산 가능, 단 빨셈만 가능/ 대소비교 가능 / between 가능 
--sysdate - hire_dated의 결과의 단위는 일수

--2000년도부터 2010년까지 입사한 직원의 이름, 입사날짜를 출력하세요.
select emp_name, hire_date from EMPLOYEE where '00/01/01'<=hire_date and hire_date<='10/12/31';

select emp_name, salary ||'원' 급여 from EMPLOYEE;
--오라클 내에서 데이터 연결은 || 연산자

-- 근속년수가 10년 이상 된 직원 중 급여가 200만원 이하인 직원의 이름과 급여, 직급 코드를 출력해보세요.
select emp_name, salary, job_code from employee where sysdate-hire_date >= 10*365 and salary <= 2000000;

--like 어떤 글자가 포함된 데이터를 찾고 싶을 때 사용 <-> not like
--언더바는 언더바 개수만큼의 어떠한 문자를 의미
-- '하_' 하로 시작하고 뒤에 어떠한 하나의 문자가 있는 데이터
--'__하' 마지막이 하로 끝나며 하 앞에 어떠한 두 개의 문자가 있는 데이터
select * from employee where emp_name like '하__';
--%는  0글자 이상 존재할 수도 존재하지 않을 수도 있다는 표기
--'하%' 하로 시작하는 어떤 문자열이 있다
--'%하' 하로 끝나는 어떤 문자열이 있다
--'%하%' 하가 포함된 어떤 문자열이 있다.
select * from employee where emp_name like '하%';

--언더바 앞에 세글자가 존재하는 이메일을 가진 사람을 출력해보세요.
select * from employee where email like '___#_%'ESCAPE'#';
--ESCAPE’#’ : # 뒤에 붙어있는 한글자에게는 그 글자가 가지고 있는 기능을 뺏어버리고 글자 그래도 사용하겠다 라는 의미 

--보너스가 null인 사람들만 추려서 출력해보세요.
select * from EMPLOYEE where bonus is null;

--quiz
-- 1. employee 테이블에서 이름이 연으로 끝나는 사원의 이름을 출력하세요.
select emp_name from EMPLOYEE where emp_name like '__연';
-- 2. employee 테이블에서 전화번호 첫 3 자리가 010이 아닌 사원의 이름과 전화번호를 출력하세요.
select emp_name, phone from EMPLOYEE where phone not like '010%';
-- 3. employee 테이블에서 생일이 9월자인 사원의 이름과 주민번호만 출력하세요.
select emp_name, emp_no from EMPLOYEE where emp_no like '___9%';
-- 4. employee 테이블에서 메일 주소에 s가 들어가면서, dept_code가 D9 도는 D6인 직원들 중에서 
--    고용일이 90년 1월 1일부터 2000년 12월 1일 사이에 입사했으며, 급여가 270만원 이상인 
--    사원의 전체 정보를 출력하세요.
select * 
from EMPLOYEE 
where (email like '%s%' and (dept_code = 'D9' or dept_code='D6'))and salary >=2700000 and ('90/01/01'<=hire_date and hire_date<='00/12/01') ;



