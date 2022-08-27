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
select emp_name from EMPLOYEE where emp_name like '%연';
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
--or 조건이 너무 많이 사용될 경우 in 표현으로 대체 가능
-- EX) dept_code in ('D9','D6','D3','D5')

--order by: 데이터 정렬 문법
select emp_id, emp_name, salary from EMPLOYEE;
--가장 끝에 order by 문법이 온다. ~에 의거해서 줄을 세우다.
--급여순으로 정렬 
select emp_id, emp_name, salary from EMPLOYEE order by emp_name;

--전체항목을 부서코드로 내림차순으로 정렬하고 그 안에서 잡코드로 오름차순으로 다시 정렬
select * from EMPLOYEE order by dept_code desc, job_code ;

--floor(실수값) : 소수점을 없애는 메서드, 실수값을 정수값으로 반환
select floor(3.14) from dual;
select emp_name, floor(sysdate-hire_date) 근속일수 from EMPLOYEE;

--Quiz
--1. 근속년수가 5년 이상, 10년 이하인 직원의 이름, 주민번호, 급여, 입사일을 출력하세요.
select emp_name,emp_no, hire_date
from EMPLOYEE 
where sysdate-HIRE_DATE BETWEEN 5*365 and 10*365;

--2. 재직 중이 아닌 직원의 이름,근무기간, 부서코드를 출력하세요.(ENT_YN 컬럼)
select emp_name,ent_date-hire_date ||'일',dept_code from EMPLOYEE where ent_yn = 'Y'; 

--3. 근속년수가 10년 이상인 직원들의 이름, 급여, 근속년수(소수점X)를 근속년수 오름차순으로 정렬하여 출력하세요.
        --(급여는 50% 인상된 급여로 출력하세요.)
select emp_name, salary*1.5, floor((sysdate-hire_date)/365)근속년수 
from EMPLOYEE
where 10*365 <= sysdate-hire_date
order by sysdate-hire_date;
--order by 3;

--4. 입사일이 99/01/01~10/01/01 인 직원 중에서 급여가 2백만원 이하인 사람의 이름, 주민번호, 이메일, 폰번호, 급여를 출력하세요.
select emp_name, emp_no, email, phone, salary 
from EMPLOYEE
where hire_date between '99/01/01' and '10/01/01' 
and salary <= 2000000;

--5. 급여가 200~300만원 사이인 여직원 중에서 4월 생일자의 이름, 주민번호, 급여 부서코드를 출력하세요.
        --(주민번호 내림차순으로 출력하세요.)
select emp_name, emp_no, salary, dept_code
from EMPLOYEE
where salary between 2000000 and 3000000 and 
emp_no like '_______2%' and emp_no like '___4%'
order by emp_no desc;
--where ~ and emp_no like '___4%-2%';

--6. 남직원 중 보너스가 없는 직원의 오늘까지의 근무일을 측정하여 각 1000일마다 급여의 10%를 보너스로 계산하여 이름, 계산된 금액(특별보너스로 별칭 설정)을 출력하세요.
        --(이름 오름차순으로 정렬하세요.)
select  emp_name, salary*0.1*floor((sysdate-hire_date)/1000) 특별보너스 
from EMPLOYEE
where emp_no like '_______1%' and bonus is null
order by emp_name;
--where bonus is null and emp_no like '%-1%';
   
--nvl(A,B) : null value A이 null일때 B에 쓴 인자값이   ?  
select emp_id, emp_name, nvl(dept_code,'인턴') from EMPLOYEE;
        
---------------------------------------------------------------------        
--함수 (Function)
--length :  인자로 전달된 데이터의 길이값을 반환하는 함수 
select length('Hello')||'글자' 글자길이 from dual;

--lengthb : 인자로 전달된 데이터의 바이트수를 반환하는 함수
select length('Hello')||'글자' 글자길이 from dual;
select length('한글도됩니다')||'글자' 글자길이 from dual;

--instr(A,B,C,D) : 문자열 내에서 문자열을 검색하여 위치를 반환하는 함수 
--A문자열 안에서 문자B를 찾는데 C번째 자리에서부터 오른쪽으로 찾기 시작하여
--D번째로 만나는 B의 자리를 리턴하겠다. 만약 찾지 못하면 0이 반환된다. 
select instr('Hello Oracle Hi High','H',2,1) from dual;

--substr() : 문자열 내에서 문자열을 추출해내는 기능 
select substr('Hello World of Oracle',7,5) from dual;

--employee 테이블에서 직원들의 사번 및 이름 성만 출력해보세요.
select substr(emp_name,1,1) 성, emp_id
from EMPLOYEE;

--distinct
select distinct substr(emp_name,1,1) 성, emp_id
from EMPLOYEE;

select emp_id, emp_name, substr(emp_no,1,8)||'******' 주민번호 
from EMPLOYEE where substr(emp_no,8,1) in ('1','3') ;

--ABS :  절대값 구하는 함수
select abs(-1) from dual;

--MOD : 나머지를 구하는 함수 
select mod(10,3) from dual;

--Round() : 반올림 함수
select round (123.456, 2) from dual;
select round (123.446, 1) from dual;
select round (123.546, 0) from dual;
select round (123.546, -1) from dual;

--FLOOR() : 버림 함수
SELECT floor(123.456) from dual;

--TRUNC : 지정 위치에서 버림 함수 
select trunc (123.456,1) from dual;
select trunc (123.456,2) from dual;
select trunc (123.456,3) from dual;

--CEIL : 올림 함수
select ceil (123.456) from dual;

------------------------------------------------
--날짜 관련 함수 

--sysdate :  현재날짜+현재시간을 가지는 값을 반환
-- 단순 출력에서는 시간까지는 눈에 보이지 않지만 내부적인 값은 존재함.
select sysdate from dual;

--months_between : 인자로 전달된 두 날짜 사이의 개월 수를 반환하는 함수
select emp_name, months_between(sysdate, hire_date) from EMPLOYEE;

--add_months : 첫번째 인자 날짜에 두번째 인자 숫자 개월 수를 더하여 반환 
select emp_name, add_months(hire_date, 6) from EMPLOYEE;
select add_months(sysdate, 2) from dual;

-- next_day :  인자로 전달받은 날짜에 인자로 전달받은 요일 중 가장 가까운 다음 요일의 날짜를 반환
select next_day(sysdate, '목요일') from dual;

-- last_day : 인자로 전달받은 날짜가 속해있는 달의 가장 마지막 날짜를 반환
select last_day(sysdate) from dual;

--퀴즈 : 다음 달 마지막 날짜를 구하시오.
select last_day(add_months(sysdate, 1)) from dual;

--extract : 날짜값으로부터 연/월/일 값을 독립적으로 추출하여 반환
select extract(year from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(day from sysdate) from dual;

--퀴즈 : employee 테이블에서 사원의 이름, 입사일, 년차를 출력하세요.
-- 조건1. 입사일은 출력형태를 YYYY년M월D일 형태로 출력하세요.
-- 조건2. 년차 출력은 소수점이 발생할 경우 올림처리하여 출력할 것(28.114 ->29년차)
-- 조건3. 입사일 기준으로 오름차순 정렬하여 출력하세요.
select emp_name 사원명, 
extract(year from hire_date)||'년 ' || 
extract(month from hire_date)||'월 ' || 
extract(day from hire_date)||'일' 입사일, 
ceil((sysdate-hire_date)/365)||'년차' 년차
from EMPLOYEE
order by 2;

--------------------------------------------------------------------------------------

--형 변환 함수 

--to_char(A,B) : 숫자 또는 날짜를 문자열로 변환하는 함수, B에는 출력될 형식 삽입
select to_char(sysdate, 'yyyy/mm/dd hh:mi:ss') from dual;
select to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss') from dual; --24시간 표기법
select to_char(sysdate, 'yyyy"년"mm"월"dd"일" hh24"시"mi"분"ss"초"') from dual;
select to_char(sysdate, 'yyyy"년"mm"월"dd"일" hh24:mi:ss (day)') from dual; --(금요일)
select to_char(sysdate, 'yyyy"년"mm"월"dd"일" hh24:mi:ss (dy)') from dual; --(금)

-- 퀴즈
-- employee 테이블에서 사원명, 고용일을 출력하세요.
-- 조건. 고용일은 (1990/02/01 (화))와 같은 형태로 출력하세요.
select emp_name, to_char(hire_date, 'yyyy/mm/dd (dy)') 
from EMPLOYEE;

--숫자표현   , A보다 B가 짧으면 안됨 
select to_char(1000000 , 'L999,999,999') from dual; 
select emp_id, emp_name, to_char(salary,'L999,999,999') from EMPLOYEE;

--to_date: 숫자 또는 문자열을 날짜로 표현
--숫자 -> 날짜
select to_date(20000101, 'yyyymmdd') from dual;

--문자열 -> 날짜
select to_date('01012000', 'mmddyyyy') from dual;

--1901년을 표현하고 싶은데 앞에 19는 어떻게 나타낼 수 있나요?
select to_char(to_date(19010101, 'yyyymmdd'), 'yyyy mm dd') 
from dual;

-- 2013/4/8의 요일은?
select to_char(to_date(20130408, 'yyyymmdd'), 'dy') from dual;



