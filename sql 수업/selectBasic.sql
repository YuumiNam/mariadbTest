-- select 연습
select * from departments;
select dept_no, dept_name from departments;

-- alias(as 생략 가능)
-- 예제1 : employees 테이블에서 직원의 성, 성별, 입사일을 출력 (20개까지만)
select first_name as '성',
	   gender as '성별',
	   hire_date as '입사일'
	from employees limit 0, 20;

-- 예제2 : employees 테이블에서 직원의 이름, 성별, 입사일을 출력 (20개까지만) concat 함수 사용
select concat(first_name,'',last_name) as '이름',
	   gender as '성별',
	   hire_date as '입사일'
	from employees limit 0, 20;
    
    
-- distinct
-- 예제 : titles 테이블에서 모든 직급의 이름 출력
select distinct title from titles limit 0, 20;


-- where절 #1
-- 예제1 : employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
select concat(first_name,'',last_name) as '이름', gender, hire_date
	from employees
    where hire_date < '1991-01-01';
    
-- where절 #2 and
-- 예제2 : employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 성별, 입사일을 출력 "조건이 2개네?"
select concat(first_name,'',last_name) as '이름', gender, hire_date
	from employees
    where hire_date < '1989-01-01'
		and gender = 'f';
        
-- where절 #3 in
-- 예제3 : dept_emp 테이블에서 부서번호가 d005거나 d009에 속한 사원의 사번, 부서번호를 출력
select emp_no, dept_no
	from dept_emp
    where dept_no in ('d005','d009')
    
-- where절 #4 like
-- 예제4 : employees 테이블에서 1989년에 입사한직원의 성, 입사일을 출력
select first_name, hire_date
	from employees
    where hire_date >= '1989-01-01'
		and hire_date <= '1989-12-31';
  -- where hire_date like '1989%';
  -- where hire_date between '1989-01-01' and '1989-12-31';
  

-- order by절
-- 예제1 : salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급 출력
select emp_no, salary 
	from salaries 
    where from_date like '2001%'
		and to_date like '2001%'
order by salary desc;

-- 예제2 : 남자 직원의 이름,성벌,입사일을 입사일순으로 출력
select concat(first_name,'',last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees
    where gender = 'm'
order by hire_date desc;

-- 예제3 : 직원들의 사번과 월급을 사번은 오름차순 월급은 내림차순으로 출력
select emp_no, salary
	from salaries
order by emp_no asc, salary desc;
