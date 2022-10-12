-- 함수 : 문자열

-- upper 대문자로 변환
select upper('seoul'), upper('sEouL'), upper('Seoul');
select upper(first_name) from employees;


-- lower 소문자로 변환
select lower('seoul'), lower('sEouL'), lower('Seoul');
select lower(first_name) from employees;


-- substring(문자열, index, length) 0번째가 아닌 1번째부터 시작
select substring('Hello World',3,2);

-- 예제) 1989년에 입사한 사원들의 이름, 입사일 출력
select first_name, hire_date
 from employees
 where '1989' = substring(hire_date,1,4);
 
 
-- lpad(오른쪽 정렬), rpad(왼쪽 정렬)
select lpad('1234', 10, '-'), rpad('1234', 10, '-');

-- 예제) 직원들의 월급을 오른쪽 정렬(빈공간은 *)
select lpad(salary, 10, '*')
	from salaries;
    
    
-- trim, ltrim, rtrim "이메일 생성시 space바 실수로눌러서 공백일때 없어주기 위해서 사용"
select concat('---',ltrim('    hello    '),'---'),
	   concat('---',rtrim('    hello    '),'---'),
	   concat('---',trim(both 'x' from 'xxxhelloxxx'),'---');
