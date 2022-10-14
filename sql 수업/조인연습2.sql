-- outer join

-- table 확인
desc dept;

-- row넣기
-- insert into dept values(null, '총무');
-- insert into dept values(null, '개발');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '기획');

select * 
	from dept;
    
-- table 확인    
desc emp;

-- row넣기
-- insert into emp values(null,'둘리',1);
-- insert into emp values(null,'마이콜',2);
-- insert into emp values(null,'또치',3);
-- insert into emp values(null,'길동',null);

select * 
	from emp;
    
-- inner join해보기 (사장인 길동은 부서가 없어서 안뜸)
select a.name as '이름', b.name as '부서'
	from emp a join dept b on a.dept_no = b.no;
    
    
-- left join
select a.name as '이름', b.name as '부서'
	from emp a left join dept b on a.dept_no = b.no;
    
select a.name as '이름', ifnull(b.name, '없음') as '부서' -- null 값을 임의로 바꿔줌
	from emp a left join dept b on a.dept_no = b.no;


-- right join (거의 안씀)
select a.name as '이름', b.name as '부서'
	from emp a right join dept b on a.dept_no = b.no;