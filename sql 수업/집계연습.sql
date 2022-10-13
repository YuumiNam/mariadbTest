-- 집계쿼리 : select에 그룹함수(sum, count, avg, max, min ...)가 적용된 경우

select avg(salary) 
	from salaries;
    
select avg(salary), sum(salary)
	from salaries;
    
-- select절에 그룹함수가 있는경우, 어떤 컬럼도 select절에 올 수 없다.
-- emp_no는 아무 의미 없다 "사원번호의 평균이 나오는게 무슨의미가 있느냐"
-- 오류!! MySQL에서는 오류안뜨고 사원번호의 평균도 계산해줌. 하지만 의미없음
select avg(salary) , emp_no
	from salaries;
    

-- 쿼리가 실행되는 순서
-- 1) from : 접근 테이블 확인
-- 2) where : 조건에 맞는 row를 선택
-- 3) (집계)
-- 4) select
-- 5) order by


-- 집계쿼리가 실행되는 순서
-- 1) from
-- 2) where
-- 3) (집계)
-- 4) group by 집계쿼리에 포함이 안된 column을 그룹핑해줌
-- 5) having 집계가 나온 이후의 row열에서 조건식이 필요할때
-- 6) select
-- 7) order by


select avg(salary)
	from salaries
    where emp_no = "10060";
    
-- group by에 참여하고 있는 column은 select절에 올 수 있다.
select emp_no, avg(salary) 
	from salaries
    group by emp_no;
    
-- having
-- 예제) salaries테이블에서 평균연봉이 60000이상인 사원의 사번과 평균연봉을 내림차순으로 나타내시오.
-- 집계결과(결과 임시 테이블)에서 row를 선택해야하는 경우 써야함
-- 이미 where절은 실행이 되었기 때문에 having절에서 이 조건을 주어야 한다.
select emp_no, avg(salary) as 평균연봉
	from salaries
    group by emp_no
    having 평균연봉 > 60000
order by 평균연봉 desc;

-- 예제 : salaries테이블에서 사번이 10060인 직원의 사번 급여평균 총합을 출력하세요.
select emp_no, avg(salary), sum(salary)
	from salaries
    where emp_no = "10060"
    group by emp_no;

select emp_no, avg(salary), sum(salary)
	from salaries
    group by emp_no
    having emp_no = "10060";