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
   
--nvl(A,B) : null value A이 null일때 B에 쓴 인자값이 반환  
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


--decode :  ?:이랑 비슷한 연산자, java의 switch문과 유사

--직원의 성별별로 직원출력
select emp_id, emp_name, decode(substr(emp_no,8,1),1,'남',2,'여') 성별
from employee;
--decode 인자값에 대하여 이 값이 1과 같다면 '남'이라 출력
--조건을 두개씩 짝지어서 확장시킬 수 있음 decode(substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여')
--decode(substr(emp_no,8,1),1,'남','여')1일 경우 남, 나머지 경우에는 ‘여’ 
--대소비교는 불가능

--case : 같다다르다만 가능한 decode보다 경우의 수를 더 크게 확장시킬 수 잇다.
select
emp_id,
emp_name,
case
    when substr(emp_no,8,1) = 1 then '남'
    when substr(emp_no,8,1) = 2 then '여'
    else 'none'
end 성별
from employee;


--quiz1
--2000년도 이전 입사자 중에 bonus가 null값인 직원을 격려비 대상자로 출력하세요.
--(풀력 포함 사항 사번, 이름, 고용일)

select emp_id 사번, emp_name 이름, hire_date 고용일,
case
    when hire_date < '00/01/01' and bonus is null then '격려비 대상자'
    else '해당없음'
end 대상여부
from employee;

--quiz02    
--60년대생 직원들 중
--60~65까지는 60년생 초반
--66~69까지는 60년생 후반
--으로 출력해보세요
select emp_name, 
case
    when substr (emp_no,1,2)<65 then '60년생 초반'
    when substr (emp_no,1,2)>=65 then '60년생 후반'
    end 나이대
from employee
where substr(emp_no,1,2) between 60 and 69;

--------------------------------여기까지는 모두 단일행 함수 (각각의 행마다 따로 적용되는 함수)

--------------------------------그룹함수 (전체 행에서 하나의 결과를 도출하는 함수)

--sum() : 전체 행에 대해 특정 컬럼의 전체 합을 반환하는 함수
select sum(salary) 월인건비 from employee; --전체 직원의 급여 합

--avg() : 전체 행에 대해 특정 컬럼의 전체 평균을 반환하는 함수
select avg(salary) from employee; --전체 직원의 급여 평균

--count() : 전체 행의 개수를 반환하는 함수 (조건에 따하 null 값은 counting 되지 않을 수 있음)
select count(emp_name) from employee; --null 이 아닌 직원명의 개수
select count(dept_code) from employee;--null이 아닌 부서코드의 개수
select count(*) from employee; --null 문관하게 전체 행의 개수

--max() :  전체 행 중에서 가장 큰 값을 반환하는 함수
select max(salary) from employee;

--min() : 전체 행 중에서 가장 작은 값을 반환하는 함수
select min(salary) from employee;

-------------------------------------------------------------------------------------------------------------
--1. 60년생의 직원명과 년생,보너스 값을 출력하세요
--그때 보너스 값이 null인 경우에는 0이라고 출력 되게 만드시오
--       직원명    년생      보너스
--   ex) 선동일    62        0.3
--   ex) 송은희    63        0

select emp_name 직원명 ,substr(emp_no,1,2)년생, nvl(bonus,0) 보너스 
from employee
where substr(emp_no,1,2) between 60 and 69;

--2. '010' 핸드폰 번호를 쓰지 않는 사람의 수를 출력하시오.(뒤에 단위는 명을 붙이시오)
--   인원
--  ex) 3명

select count(*)||'명' 인원
from employee
where phone not like '010%' ;

--3. 부서코드가 D5, D9 인 직원들 중에서 2004년도에 입사한 직원의 수를 조회/
--사번 사워명 부서코드 입사일

select count(*)
from employee
where dept_code in('D5','D9') and substr(hire_date,1,2)=04;
--and extract(year from hire_date)=2004;

--4. 모든 직원의 나이 중 가장 많은 나이와 가장 적은 나이를 출력하세요(나이만 출력)

select 
max(extract(year from sysdate)-(substr(emp_no,1,2)+1900)) 최연장자,
min(extract(year from sysdate)-(substr(emp_no,1,2)+1900)) 최연소자
from employee;

-----------------------------------------------------------------------------------
--여기까지 함수파트
-----------------------------------------------------------------------------------


--Group by (그룹화 데이터를 요청하는 문법) - ~~헤쳐 모여!
--총 급여합계  : select sum(salary) from employee;
--부서별 급여 합계
select 
    dept_code "부서별코드", 
    sum(salary) "부서별 급여합계"
from employee 
group by dept_code 
order by dept_code;

--직급코드별 인원수를 파악해보세요.
select 
    job_code "직급별코드", 
    count(*)"직급별 인원수"
from employee 
where bonus is not null
group by job_code
order by job_code;
--쿼리문의 실행순서 
--employee에서 보너스가 null이 아닌 사람에 대하여 
--잡코드로 묶고 잡코드와 카운트를 출력하고 잡코드로 정렬한다. 

-- from -> where -> group by -> having (아직 안배움) -> select -> order by

-----------------------------------------------------------------------

select 
   decode(substr(emp_no,8,1),2,'여','남') 성별,
   count(*) 인원수
from employee 
group by decode(substr(emp_no,8,1),2,'여','남');

--------------------------------------------
--employee 테이블에서 직급이 J1을 제외하고, 부서, 부서별 사원수 및 평균급여를 출력하세요.
select 
nvl(dept_code, '인턴') 부서,
count(*) "부서별 사원수",
avg(salary) "평균 급여"
from employee
where not job_code in('J1')
group by dept_code;
--where job_code !='J1'

--employee테이블에서 직급이 J1을 제외하고 입사년도별 인원수를 조회해서, 입사년 기준으로 오름차순 정렬하세요
select 
    extract(year from hire_date) 입사년도,
    count(*)||'명' 인원수 
from employee
where job_code!='J1'
group by  extract(year from hire_date)
order by  extract(year from hire_date);

--그룹화는 여러번 할 수 있다.
select 
   dept_code, job_code, count(*)
from employee
group by dept_code, job_code
order by 1;
--부서별로 모이고 그 안에서 직급코드대로 모여라
--부서내 직급별 인원수 

--부서내 성별별 인원수를 구해보세요
select 
nvl(dept_code,'인턴') 부서코드,
decode(substr(emp_no, 8,1),2,'여','남') 성별,
count(*)||'명' 인원수
from employee
group by dept_code,decode(substr(emp_no, 8,1),2,'여','남')
order by dept_code;

--직급 나이대  인원수
select
job_code 직급,
decode(substr(emp_no, 1,1),6,'60',7,'70', 8,'80')||'년대생' 나이대,
count(*) 인원수
from employee
group by job_code, decode(substr(emp_no, 1,1),6,'60',7,'70', 8,'80')
order by 1;

-----------------------------------------------------

--having
--부서별 급여 평균이 300만원을 넘는 부서의 부서코드 및 급여평균 출력

select 
    dept_code,
    floor(avg(salary))
from employee
group by dept_code
having avg(salary) >= 3000000;

--where절은 프럼에 조건을 두는 것
--해빙은 그룹바이에 의해 만들어진 조건절
--where절에서는 그룹함수를 사용할 수 없다.


--Join
--두 개 이상의 테이블에서 연관성 있는 데이터들을 분류하고 새로운 가상 테이블로 생성하는 문법

select * from job;
select * from department;

--cross join
select * from job, department; --oracle 전용 문법
select * from job, cross join department; --ANSI 표준

--cross join의 결과물을  cartesian product 부름, 아무런 가치가 없는 데이터

--inner join
select 
emp_id, 
emp_name,
dept_code,
dept_title
from
    employee inner join department on dept_code = dept_id;
--단 이 조건하(on)에 employee와 department를 합치겠다

select emp_id, emp_name,job_name, e.job_code
from employee e inner join job j on e.job_code = j.job_code;
--겹치면 모호함으로 에러발생하기 때문에 from에서 앨리어스를 만들어 구분한다.
--select 에서도 겹치는 부분을 넣으면 에러가 발생하여 구분해줘야한다. 
--실행 순서가 select는 5번째이기 때문에 from에서 설정한 별칭이 사용가능하다. 

select 
dept_Id,
dept_title,
national_code
from department inner join location on location_id = local_code;
--departmet와 locationd의 inner join

select 
    emp_id,
    emp_name,
    dept_title
from employee inner join department on dept_code=dept_id;
--부서코드가 null인 사원은 빠져있으며 부서코드는 있지만 사람이 속해있지 않은 부서도 나타나지 않음


--outer join
select 
    emp_id,
    emp_name,
    dept_title
from 
employee left outer join department on dept_code = dept_id;
--left 왼쪽에 있는 것의 모든 것을 다 보여주겠다

select 
    emp_id,
    emp_name,
    dept_title
from 
employee right outer join department on dept_code = dept_id;

select 
    emp_id,
    emp_name,
    dept_title
from 
employee full outer join department on dept_code = dept_id;


--self join
select
    e1.EMP_ID,
    e1.emp_name,
    e2.emp_name
from 
employee e1 inner join employee e2 on e1.manager_id =e2.emp_id;


--직원명, 부서명, 직급명을 출력하세요 -> join이 3테이블 사이에서 일어남
select 
    emp_id,
    emp_name, 
    dept_title, 
    job_name
from 
    employee e
        join department d on dept_code=dept_id
        join job j on e.job_code=j.job_code;

-- 사번 / 직원명 / 부서코드 / 부서명 / 지역명 (location 테이블의 local_name)
select 
    emp_id,
    emp_name,
    dept_code,
    dept_title,
    local_name
from
    employee e
    join department d on e.dept_code = d.dept_id
    join location l on d.location_id=l.local_code;


--1. 2020년 12월 25일이 무슨 요일인지 조회하시오.
select to_char(to_date(20201225, 'yyyymmdd'), 'DAY') from dual;

--2. 주민번호가 1970년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의 사원명, 주민번호, 부서명, 직급명을 조회하시오.
select 
    emp_name 사원명, 
    emp_no 주민번호, 
    dept_title  부서명, 
    job_name 직급명
from 
    employee e
        join department d on e.dept_code = d.DEPT_ID
        join JOB j on e.job_code = j.job_code
where emp_name like '전%' and emp_no like '7%' and substr(emp_no,8,1) in('2','4');

--3. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.
select 
    emp_id 사번, 
    emp_name 사원명, 
    dept_title 부서명
from 
    employee e join department d on e.dept_code = d.DEPT_ID
where emp_name like '%형%';

--4. 해외영업부에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.
select 
    emp_name 사원명, 
    job_name 직급명, 
    dept_code 부서코드, 
    dept_title 부서명
from 
    employee e 
        join department d on e.dept_code = d.DEPT_ID
        join job j on e.JOB_CODE = j.JOB_CODE
where dept_title like '%해외영업%';

--5. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
select 
    emp_name 사원명, 
    bonus 보너스포인트, 
    dept_title 부서명, 
    local_name 근무지역명
from   
    employee e
        join department d on e.DEPT_CODE = d.DEPT_ID
        join location l on d.location_ID = l.local_code
where bonus is not null;

--6. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.
select 
    emp_name 사원명, 
    job_name 직급명,
    dept_title 부서명,
    local_name 근무지역명
from 
    employee e
     join department d on e.DEPT_CODE = d.DEPT_ID
     join job j on e.JOB_CODE = j.job_code
     join location l on d.LOCATION_ID = l.local_code
where dept_code like 'D2';

--7. 한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을 조회하시오.
select 
    emp_name 사원명, 
    dept_title 부서명,
    local_name 지역명,
    national_code 국가명
from
    employee e
     join department d on e.DEPT_CODE=d.DEPT_ID
     join location l on d.LOCATION_ID = l.local_code
where national_code in ('KO', 'JP');

--8. 보너스포인트가 없는 직원들 중에서 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회하시오. 단, join과 IN 사용할 것
select 
    emp_name 사원명, 
    job_name 직급명,
    salary 급여
from 
    employee e
        join job j on e.JOB_CODE = j.JOB_CODE
where bonus is null and j.job_name in('차장','사원');

--9. 재직중인 직원과 퇴사한 직원의 수를 조회하시오.
select (count(*)-count(ent_date)) "재직중인 직원",count(ent_date) "퇴사한 직원" from employee;

SELECT  DECODE(ENT_YN,'N','재직','Y','퇴사') AS "재직여부",
        COUNT(*) AS "인원 수"
FROM EMPLOYEE
GROUP BY ENT_YN;





--------------DQL

----------------------------
--DDL : 객체를 수정 / 삭제 / 생성하는 명령어
--create (객체 생성) / drop (객체 제거) / alter (객체 수정)

create table cafe_menu(
        --컬럼명 자료형 제약조건
    pid number primary key, 
    pname varchar(20) unique not null,
    pprice number not null,
    iced char(1) check(iced in ('Y','N','y','n')) not null
);

--varchar(사이즈) :  20은 우리가 입력할 수 있ㄴ 최대 글자
--최대 20바이트 
--20바이트를 다 사용하지 않더라도 varchar가 스스로 입력한 바이트 사이즈로 사이즈를 조절함
--char(20)도 사용할 수 있으며 똑같이 문자형이지만 스스로 사이즈를 조절하지 못해 공간낭비
--하나의 컬럼에 값이 수시로 빠른 속도로 변할 때에는 varchar보다는 공간을 낭비하더라도 char를 사용하는 게 낫다.
--하지만 대개의 경우에는 varchar가 더 낫다.

--primary key
--하나의 컬럼을 만들 때 딱 한개의 컬럼에만 부여할 수 있는 속성
--기본적으로 not null을 포함하고 중복을 모조리 제거

--unique
--중복 방지, null 값 허용

--unique not null
--primary key와 동일한 기능을 가진다(중복 방지, null 값 금지)
--primary key와는 달리 여러 컬럼에서 동시에 사용 가능
--primary key와 기능은 같지만 식별자로 인식되지는 않는다. 

--check
--check가 걸린 컬럼에는 지정한 글자 외에는 저장될 수 없다. 

drop table cafe_menu;
--삭제
--데이터가 없을 경우에는 drop , 데이터가 있을 경우에는 alter 사용



-------DML 

--insert

insert into cafe_menu values (cafe_menu_seq.nextval, 'Americano', 2000, 'Y'); 
--모든 컬럼 값을 입력할 때 문법 
--가로 안에는 데이터를 컬럼순서대로 채워주면 됨

insert into cafe_menu (pid, pname) values (1002, 'Cafe Latte');
--일부 컬럼 값을 선택적으로 입력할 때 문법
--각각의 값이 들어가는 컬럼을 values 앞 가로 안에 명시

insert into cafe_menu values (1002, 'Cafe Latte', 2000); 
insert into cafe_menu values (cafe_menu_seq.nextval, 'Americano', 2000, 'Y'); 
insert into cafe_menu values (cafe_menu_seq.nextval, 'Cafe Latte', 3000, 'Y'); 
insert into cafe_menu values (cafe_menu_seq.nextval, 'Mocha', 3500, 'Y'); 

select * from cafe_menu;


-----------------------------------------------------------------
-- Sequence : 특정 단일 값을 규칙에 따라 증가시키며 기억하는 객체

create sequence cafe_menu_seq
start with 1001 --1001부터 시작
increment by 1 --1씩 증가
nomaxvalue --제한을 두지 않겠다. maxvalue 9999;9999까지 갔다가 다시 1001로 돌아감
nocache; 

drop sequence cafe_menu_seq;

select cafe_menu_seq.nextval from dual;
-- 다음 값을 가져와
--우리에게 1001을 주면서 값을 1002로 증가 

select cafe_menu_seq.currval from dual;
--현재 값



create table sales_record(
    sid number primary key, --거래 id값
    pid references cafe_menu(pid), --팔린 상품
    --cafe_menu테이블의 pid를 가져오겠다
    sdate timestamp default sysdate not null --팔린 시간 
    --default는 현재시간으로 세팅됨, 제약조건보다는 설정에 가깝다
);

--세일즈 레코드는 차일드 테이블, 카페메뉴는 부모테이블

--시퀀즈 생성 : 1부터 무한대까지 1식 증가하는 sales_record_seq 생성
create sequence sales_record_seq
start with 1
increment by 1
nomaxvalue
nocache;

insert into sales_record values(sales_record_seq.nextval, 1001, sysdate);
insert into sales_record values(sales_record_seq.nextval, 1002, sysdate);
insert into sales_record values(sales_record_seq.nextval, 1003, sysdate);

--세일즈레코드 2번 삭제
delete from sales_record where sid=2;
--한 행을 다 지우는 것이기때문에 컬럼이름을 적을 필요가 없다
--조건(where)을 안적으면 다 지우는 것

delete from cafe_menu where pid =1002;

drop table sales_record;

create table sales_record(
    sid number primary key, 
    pid references cafe_menu(pid) on delete cascade, 
    sdate timestamp default sysdate not null 
);
--on delete cascade : 부모키가 지워졌을 때 연쇄적으로 부모키와 연관된 것들을 지운다.

select * from sales_record;
select * from cafe_menu;

create table sales_record(
    sid number primary key, 
    pid references cafe_menu(pid) on delete set null, 
    sdate timestamp default sysdate not null 
);



drop table sales_record;
drop sequence cafe_menu_seq;
drop table cafe_menu;


select * from cafe_menu;
select * from sales_record;


update cafe_menu set pprice =3200 where pid = 1002; 
--cafe_menu테이블의 pid가 1002번인 pprice의 값을 3000으로 바꾸겠다
update cafe_menu set pprice =3300, pname='Orange Juice' where pid = 1002; 
--여러개 수정

-----------------------------------------------------------------
--alter : 객체를 수정하는 명령

--새로운 컬럼 추가 -원산지()
alter table cafe_menu add (origin varchar(30) default 'none'  not null);

update cafe_menu set origin = '브라질' where pid = 1001;
update cafe_menu set origin = '미국' where pid = 1002;
update cafe_menu set origin = '케냐' where pid = 1003;

--기존 컬럼 수정
alter table cafe_menu modify (origin varchar(50));

--기존 컬럼의 이름 변경
alter table cafe_menu rename column origin to originate;

--기존 컬럼 삭제
alter table cafe_menu drop column originate;

desc cafe_menu;
select * from cafe_menu;


--Dictionary :  오라클 내에 내장된 시스템 테이블 
select table_name from user_tables;
select * from user_sequences; -- 모든 시퀀스 출력
select * from user_constraints; 


drop table sales_record;
drop table cafe_menu;

--컬럼명 자료형 제약조건 
create table cafe_menu(
    pid number constraint cafe_menu_pk primary key, 
    pname varchar(20) constraint cafe_menu_pname_uk unique constraint cafe_menu_pname_nn not null,
    pprice number constraint cafe_menu_pprice_nn  not null,
    iced char(1) constraint cafe_menu_iced_ck  check(iced in ('Y','N','y','n')) constraint cafe_menu_iced_nn not null
);

alter table cafe_menu drop constraint cafe_menu_pk; --컬럼에 적용된 제약조건을 제거하는 명령
alter table cafe_menu add constraint cafe_menu_pk primary key(pid);
desc cafe_menu;
select * from user_constraints; 

alter table cafe_menu drop constraint cafe_menu_pname_uk;


---------------TCL
-- commit / rollback /savepoint 

--트랜잭션
--DBMS와 DB 사이 임시 저장공간에 DML 쿼리를 보관하는 작업의 단위
--쿼리 작업의 원자성을 확보하기 위한 수단으로 사용 가능 

commit;

select * from sal_grade;

delete from sal_grade;

rollback;

----------------------------------------------------------------------
----------------------------------------------------------------------
--view 
--특정 테이블(or 테이블들)에서 추려낸 정보로 만들어지는 링크형 임시 테이블 

select * from employee;

create table employee_dev
as 
select emp_id, emp_name, email, phone from employee;
--as ~ 을 바탕으로 employee_dev테이블을 만들겠다. 

select * from employee_dev;




----------------DCL
--revoke :  부여된 권한을 회수하는 명령

select * from user_views;
grant select on employee_view to dev; --dev 계정에 있는 employee_view에 대한 select 권한 부여

revoke select on employee_view from dev;
--dev계정으로부터 employee_view에 셀렉트할 권한을 뺏겠다.


--Set operator 

create table t1(
    data number
);
create table t2(
    data number
);

insert into t1 values(1);
insert into t1 values(2);
insert into t1 values(3);
select * from t1;

insert into t2 values(2);
insert into t2 values(3);
insert into t2 values(4);
select * from t2;

--union : 두 테이블의 출력 결과를 합치지만 중복되는 값은 한번만 병합
select * from t1
union 
select * from t2;

--union all : 두 테이블의 출력 결과를 중복 제거 없이 병합 
select * from t1
union all
select * from t2;

--intersect : 두 테이블의 교집합을 병합
select * from t1
intersect
select * from t2;

--minus : 첫 번째 테이블 조회 결과에서 두번째 테이블 조회 결과를 빼고 남는 (차집합)결과만 생성
select * from t1
minus
select * from t2;


select emp_name, phone, email from employee
union 
select * from department;
--union 대상이 되는 두 테이블은 컬럼 개수가 같아야 하고 데이터타입이 일치해야 함




-- SubQuery : 쿼리 내부에서 사용되는 쿼리

--전지연 직원의 매니저 이름을 출력하세요.
select * from employee where emp_name='전지연';
select * from employee where emp_id=214;

--위의 문제를 해결하기 위해서는 두번의 쿼리가 필요
--하지만 서브쿼리를 사용하면 한번으로 가능 

select * from employee where emp_id=(select manager_id from employee where emp_name='전지연');
--서브쿼리는 항상 괄호안에 써야 함
--서브쿼리는 쿼리보다는 데이터로 보는 것이 맞다 실행될 때 나오는 데이터

--전 직원의 평균 급여보다 월급을 많이 받는 직원의 사번, 이름, 급여를 출력하세요.
select avg(salary) from employee;
select emp_id, emp_name, salary from employee where salary >=2822556;

select emp_id, emp_name, salary from employee where salary >=(select avg(salary) from employee);

--subquery
--단일행 단일열 서브쿼리
--다중행 서브쿼리
--다중열 서브쿼리
--다중행 다중열 서브쿼리


--단일행 단일열 서브쿼리
--1.직원 중에서 윤은해와 급여가 같은 사원들을 검색하여, 사원번호, 이름, 급여를 출력하세요.(윤은해는 제외)
select 
    emp_id,
    emp_name,
    salary
from employee 
where salary =(select salary from employee where emp_name='윤은해')
and emp_name !='윤은해';

--2. employee테이블에서 급여가 가장 많은 직원의 이름과 급여를 출력하세요.
select emp_name, max(salary) from employee;--에러 사원명은 여러개를 최대값은 하나를 나타내므로 에러발생 
select 
    emp_name, 
    salary 
from employee 
where salary = (select max(salary) from employee) 
or salary =(select min(salary) from employee);

--3.D1,D2부서에서 근무하는 직원들 중에 급여가 D5 부서 직원들의 평균 급여보다
--많이 받는 사람들의 사번, 사원명, 급여, 부서코드를 출력하세요.
select
    emp_id,
    emp_name,
    salary,
    dept_code
from employee
where dept_code in('D1','D2') 
and salary > (select avg(salary) from employee where dept_code='D5');



--다중행 서브쿼리
--송종기 또는 박나라 속한 부서에 속해 있는 모든 직원이 정보
select dept_code from employee where emp_name in('박나라','송종기');
select * from employee where dept_code in('D9','D5');

select
    * 
from employee 
where dept_code in(select dept_code from employee where emp_name in('박나라','송종기'));

--다중행 서브쿼리에서 비교식에서 =은 사용할 수 없고 in은 사용할 수 잇다.

--송종기 또는 박나라 속한 부서를 제외한 모든 직원이 정보
select
    * 
from employee 
where dept_code not in(select dept_code from employee where emp_name in('박나라','송종기'));

--차태연, 전지연 직원의 급여등급과 동일한 등급을 가진 직원들의 사뭔명, 직급명
select 
    emp_name,
    job_name,
    sal_level
from employee e join job j on e.job_code=j.job_code
where sal_level in (select sal_level from employee where emp_name in('차태연','전지연'))
order by 3;

--직급명이 대표, 부사장도 아닌 모든 직원의 이름, 부서명, 직급코드를 부서명으로 정렬하여 출력
select 
    emp_name,
    nvl(dept_title, '인턴'),
    job_code
from employee left join department on dept_code = dept_id
where job_code in (select job_code from job where job_name not in ( '대표','부사장'))
order by dept_title;



--다중열 서브쿼리
--박나라 직원의 부서코드와 직급코드가 같은 직원 출력

select emp_name, dept_code, job_code 
from employee 
where (dept_code,job_code) 
in (select dept_code, job_code 
from employee  
where emp_name in ('박나라')) ;

--다중행 다중열 서브쿼리
--박나라와 차태연 직원의 부서코드와 직급코드가 같은 직원 출력
select emp_name, dept_code, job_code 
from employee 
where (dept_code,job_code) 
in (select dept_code, job_code 
from employee  
where emp_name in ('박나라','차태연')) ;


--직급별로 급여가 가장 적은 사람의 이름과 급여를 출력하세요
select emp_name, salary , job_code
from employee
where (job_code, salary) 
in (select job_code,min(salary) 
from employee
group by job_code) 
order by job_code
;-- group by를 쓰면 group by의 기준은 출력할 수 있다???

--상관 서브쿼리
--SubQuery에서 MainQuery 요소를 가져가 사용한 후 결과를 반환하는 형태
select emp_name, (select dept_title from department where dept_id = dept_code)부서명 
from employee;

--Inline View
select emp_name, email 
from(select emp_id,emp_name, phone,email from employee);
-------------------------------------------------------------------------------------------------------------



--- TOP-N 분석(순위 기법)
select 
    emp_id,
    emp_name,
    salary,
    rank() over(order by salary desc)"급여 순위"
from employee;
  
select 
    emp_id,
    emp_name,
    salary,
    dense_rank() over(order by salary desc)"급여 순위"
from employee;
  
select
    emp_id,
    emp_name,
    salary,
    row_number() over(order by salary desc)"급여 순위"
from employee;


--5~10위까지만 출력

select  * from (
    select 
        emp_id,
        emp_name,
        salary,
        rank() over(order by salary desc)"급여 순위"
    from employee)
where "급여 순위" between 5 and 10;


-----------------------------------문제
--문제1
--기술지원부에 속한 사람들의 사람의 이름,부서코드,급여를 출력하시오
select 
    emp_name 이름
    ,dept_code 부서코드
    ,salary 급여
from employee 
    inner join department 
    on dept_code=dept_id
where dept_title='기술지원부';

--완 



--문제2
--기술지원부에 속한 사람들 중 가장 연봉이 높은 사람의 이름,부서코드,급여를 출력하시오
select 
    emp_name 이름 
    ,dept_code 부서코드  
    ,salary 급여
from employee 
where salary = (select max(salary) 
                from employee 
                    inner join department 
                    on dept_code=dept_id
                where dept_title='기술지원부'); 

---완




--문제3
--매니저가 있는 사원중에 월급이 전체사원 평균을 넘고 
--사번,이름,매니저 이름,월급(만원단위부터)을 구하시오
 --* 단, JOIN을 이용하시오


select
    A.emp_id 사번
    ,A.emp_name 이름
    ,B.emp_name "매니저 이름"
    ,trunc (A.salary/10000,0)||'만' 월급
from employee A 
    inner join employee B 
    on A.manager_id =B.emp_id
where A.manager_id is not null
    and A.salary >= (select avg(salary) from employee);



--문제4
--각 직급마다 급여 등급이 가장 높은 직원의 이름, 직급코드, 급여, 급여등급 조회

select 
    emp_name  이름 
    ,job_code 직급코드 
    ,salary 급여 
    ,sal_level 급여등급
from employee
where 
(job_code, sal_level) 
    in(select 
            job_code,
            min(Sal_level)
        from employee
        group by job_code)
order by job_code;


---완



--문제5

-- 부서별 평균 급여가 2200000 이상인 부서명, 평균 급여 조회
-- 단, 평균 급여는 소수점 버림

select 
    dept_title 부서명
    ,floor(avg(salary)) "평균 급여"
from employee 
    inner join department 
    on dept_code=dept_id
group by dept_title
having avg(salary) >= 2200000;


--문제6
--직급의 연봉 평균보다 적게 받는 여자사원의
--사원명,직급코드,부서코드,연봉을 이름 오름차순으로 조회하시오
--연봉 계산 => (급여+(급여*보너스))*12    

select 
    emp_name 사원명
    ,job_code 직급코드
    ,dept_code 부서코드
    ,salary*(1+nvl(bonus,0))*12 연봉
from employee A
where substr(emp_no,8,1)in('2','4') 
and salary*(1+nvl(bonus,0))*12 < (select avg(salary*(1+nvl(bonus,0))*12) 
                                                from employee B 
                                                where B.job_code = A.job_code)
order by emp_name;

