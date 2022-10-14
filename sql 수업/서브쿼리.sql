-- subquery
-- 1) select절의 서브쿼리는 실효성의 좀 떨어져서 예제x


-- 2) from절의 서브쿼리
select now() as a, sysdate() as b, (3+1) as c;

select s.a, s.b, s.c
	from (select now() as a, sysdate() as b, 3+1 as c) s; -- from절의 서브쿼리를 table로 이해하면 쉬움
    
    

-- 3) where절의 서브쿼리
-- 예제) 현재 Fai Bale이 근무하는 부서의 직원들의 사번,이름을 출력하세요.

-- 서브쿼리를 몰랐을때 푸는법
select dept_no
	from dept_emp a, employees b
    where a.emp_no = b.emp_no
		and concat(first_name,' ',last_name) = 'Fai Bale' -- 일단 Fai Bale이 속해있는 부서를 구함
        and a.to_date like '9999%';
        
select b.emp_no, b.first_name
	from dept_emp a, employees b
    where a.emp_no = b.emp_no
		and a.to_date like '9999%'
        and a.dept_no = 'd004';

-- sol) where절 안에 첫번째 select문을 넣어줌
select b.emp_no, b.first_name
	from dept_emp a, employees b
    where a.emp_no = b.emp_no
		and a.to_date like '9999%'
        and a.dept_no = (select dept_no
						from dept_emp a, employees b
						where a.emp_no = b.emp_no
							and concat(first_name,' ',last_name) = 'Fai Bale'
							and a.to_date like '9999%');