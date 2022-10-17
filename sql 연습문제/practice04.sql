-- practice04 : 혼합

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*)
	from employees a, salaries b
    where a.emp_no = b.emp_no
		and b.to_date like '9999%'
        and b.salary > (select avg(salary)
							from salaries
							where to_date like '9999%');

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select a.dept_no, max(salary) as max_salary
	from dept_emp a, salaries b
	where a.emp_no = b.emp_no
		and a.to_date like '9999%'
		and b.to_date like '9999%'
	group by a.dept_no; -- 부서별 최고급여

-- 1) where 서브쿼리
select b.emp_no, b.first_name, c.salary
	from dept_emp a, employees b, salaries c
    where a.emp_no = b.emp_no
		and b.emp_no = c.emp_no
        and a.to_date like '9999%'
        and c.to_date like '9999%'
        and (dept_no, salary) in (select a.dept_no, max(salary) as max_salary
										from dept_emp a, salaries b
										where a.emp_no = b.emp_no
											and a.to_date like '9999%'
											and b.to_date like '9999%'
										group by a.dept_no)
order by c.salary desc;

-- 2) from 서브쿼리
select b.emp_no, b.first_name, c.salary
	from dept_emp a, employees b, salaries c, (select a.dept_no, max(salary) as max_salary
												from dept_emp a, salaries b
												where a.emp_no = b.emp_no
													and a.to_date like '9999%'
													and b.to_date like '9999%'
												group by a.dept_no) d
    where a.emp_no = b.emp_no
		and b.emp_no = c.emp_no
        and a.to_date like '9999%'
        and c.to_date like '9999%'
        and d.max_salary = c.salary
order by c.salary desc;


-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select a.dept_no, avg(salary) as avg_salary
	from dept_emp a, salaries b
    where a.emp_no = b.emp_no
		and a.to_date like '9999%'
        and b.to_date like '9999%'
	group by a.dept_no; -- 부서별 평균급여
	

select b.emp_no, b.first_name, c.salary
	from dept_emp a, employees b, salaries c
    where a.emp_no = b.emp_no
		and b.emp_no = c.emp_no
        and a.to_date like '9999%'
        and c.to_date like '9999%';




-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select c.emp_no, c.first_name ,d.first_name ,a.dept_name
	from departments a, dept_manager b, employees c , (select b.first_name
														from dept_manager a, employees b
														where a.emp_no = b.emp_no
															and a.to_date like '9999%') d
    where a.dept_no = b.dept_no
		and b.emp_no = c.emp_no
        and b.to_date like '9999%'
order by c.emp_no;
        
        
-- 매니저 이름
select b.first_name
	from dept_manager a, employees b
	where a.emp_no = b.emp_no
		and a.to_date like '9999%';






-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select a.dept_name, avg(salary) as avg_salary
	from departments a, dept_emp b ,salaries c
    where a.dept_no = b.dept_no
		and b.emp_no = c.emp_no
		and b.to_date like '9999%'
        and c.to_date like '9999%'
	group by a.dept_name; -- 부서별 평균연봉
    
select a.dept_name, avg(salary) as avg_salary
	from departments a, dept_emp b ,salaries c
    where a.dept_no = b.dept_no
		and b.emp_no = c.emp_no
		and b.to_date like '9999%'
        and c.to_date like '9999%'
	group by a.dept_name
    having avg_salary = (select max(a.avg_salary) 
							from (select a.dept_name, avg(salary) as avg_salary
									from departments a, dept_emp b ,salaries c
									where a.dept_no = b.dept_no
										and b.emp_no = c.emp_no
										and b.to_date like '9999%'
										and c.to_date like '9999%'
							group by a.dept_name) a); -- 평균연봉이 가장 높은 부서

select b.emp_no, b.first_name, c.title, d.salary
	from (select a.dept_name, avg(salary) as avg_salary
			from departments a, dept_emp b ,salaries c
			where a.dept_no = b.dept_no
				and b.emp_no = c.emp_no
				and b.to_date like '9999%'
				and c.to_date like '9999%'
			group by a.dept_name
			having avg_salary = (select max(a.avg_salary) 
									from (select a.dept_name, avg(salary) as avg_salary
											from departments a, dept_emp b ,salaries c
											where a.dept_no = b.dept_no
												and b.emp_no = c.emp_no
												and b.to_date like '9999%'
												and c.to_date like '9999%'
											group by a.dept_name) a)) a,
			employees b,
            titles c,
            salaries d
            where b.emp_no = c.emp_no
				and b.emp_no = d.emp_no
                and c.to_date like '9999%'
                and d.to_date like '9999%'
order by d.salary;



-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
select a.dept_name, avg(salary) as avg_salary
	from departments a, dept_emp b ,salaries c
    where a.dept_no = b.dept_no
		and b.emp_no = c.emp_no
		and b.to_date like '9999%'
        and c.to_date like '9999%'
	group by a.dept_name; -- 부서별 평균연봉


select a.dept_name, avg(salary) as avg_salary
	from departments a, dept_emp b ,salaries c
    where a.dept_no = b.dept_no
		and b.emp_no = c.emp_no
		and b.to_date like '9999%'
        and c.to_date like '9999%'
	group by a.dept_name
    having avg_salary = (select max(a.avg_salary) 
							from (select a.dept_name, avg(salary) as avg_salary
									from departments a, dept_emp b ,salaries c
									where a.dept_no = b.dept_no
										and b.emp_no = c.emp_no
										and b.to_date like '9999%'
										and c.to_date like '9999%'
							group by a.dept_name) a);


-- 문제7.
-- 평균 연봉이 가장 높은 직책?
select a.title, avg(salary) as avg_salary
	from titles a, salaries b
    where a.emp_no = b.emp_no
		and a.to_date like '9999%'
        and b.to_date like '9999%'
	group by a.title; -- 직책별 평균연봉


select a.title, avg(salary) as avg_salary
	from titles a, salaries b
    where a.emp_no = b.emp_no
        and a.to_date like '9999%'
        and b.to_date like '9999%'
	group by a.title
    having avg_salary = (select max(c.avg_salary)
							from (select a.title, avg(salary) as avg_salary
									from titles a, salaries b
									where a.emp_no = b.emp_no
										and a.to_date like '9999%'
										and b.to_date like '9999%'
								   group by a.title) c); -- 평균연봉중 가장 높은 직책
 
    
-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.



