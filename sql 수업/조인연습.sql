-- inner join
-- 예제1) 현재 근무하고있는 직원의 이름과 직책을 모두 출력 하세요.
select concat(a.first_name,' ',a.last_name) as name, b.title
	from employees as a, titles as b-- join할 두 테이블
	where a.emp_no = b.emp_no -- join 조건 (일반적으로 PK와 FK)
		and b.to_date like "9999%"; -- row 선택조건
        
        
-- 현재 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요.
select concat(a.first_name,' ',a.last_name) as name, a.gender, b.title
	from employees as a, titles as b
	where a.emp_no = b.emp_no 
		and b.to_date like "9999%"
        and a.gender = 'F'
        and b.title = 'engineer'; 
        
--
-- ANSI/ISO SQL19999 JOIN 표준문법
--

-- 1) Natural Join
-- 두 테이블에 이름이 같은 공통 column이 있으면 조인 조건을
-- 명시하지 않아도 암묵적으로 조인이 됨
select concat(a.first_name,' ',a.last_name) name, b.title
	from employees a join titles b on a.emp_no = b.emp_no -- 이게 표준
    where b.to_date like "9999%";
    
select concat(a.first_name,' ',a.last_name) name, b.title
	from employees a natural join titles b -- 이게 Natural join (하지만, 이름이 같은 다른 column이 있다면 그것도 join되어버림)
    where b.to_date like "9999%";


-- 2) join ~ using
-- Natural join의 문제점을 해결하기위해 나옴
-- 결론.... "그냥 join ~ on이랑 equi join 써!!"
select count(*) 
	from salaries a natural join titles b
    where b.to_date = "9999-01-01";

select count(*) 
	from salaries a join titles b using(emp_no)
    where b.to_date = "9999-01-01";
    

-- 3) join ~ on
-- 예제) 현재 직책별 평균 연봉을 큰 순서대로 출력하시오.
select b.title, avg(salary)
	from salaries a join titles b on a.emp_no = b.emp_no
    where b.to_date = '9999-01-01'
		and a.to_date = '9999-01-01'
	group by b.title
    order by avg(salary) desc;
    
select to_date
	from titles;
    
-- 실습문제1
-- 현재 직원별 근무부서를 반영한 사번, 직원 전체 이름, 근무서를 출력하세요.
select a.emp_no, concat(a.first_name,' ',a.last_name) name, c.dept_no 
	from employees a , departments b , dept_emp c
    where a.emp_no = c.emp_no
		and b.dept_no = c.dept_no
		and b.to_date like '9999%';

-- 실습문제2
-- 현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요.
-- 사번, 전체이름, 연봉 형태로 출력하세요.
select a.emp_no, concat(a.first_name,' ',a.last_name) name, b.salary
	from employees a, salaries b
    where a.emp_no = b.emp_no
		and b.to_date like '9999%';

-- 실습문제3
-- 현재 직책별로 평균 연봉과 인원수를 구하되,
-- 칙책별로 인원이 100명 이상인 직책만 출력하세요.
select a.title, avg(b.salary), count(*)
	from titles a, salaries b
    where a.emp_no = b.emp_no
group by a.title
	having count(*) >= 100;

-- 실습문제4
-- 현재 부서별로 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하세요.
-- 부서이름, 평균급여로 출력하세요.
select a.dept_name, avg(salary)
	from departments a, dept_emp b, salaries c, titles d
    where a.dept_no = b.dept_no
		and b.emp_no = c.emp_no
        and c.emp_no = d.emp_no
        and b.to_date like "9999%"
        and c.to_date like "9999%"
        and d.to_date like "9999%"
        and d.title = "Engineer"
group by a.dept_name
order by avg(salary) desc;

	
    