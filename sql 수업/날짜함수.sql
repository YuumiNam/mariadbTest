-- 함수 : 날짜

-- curdate(), current_date 날짜
select curdate(), current_date;


-- curtime(), current_time 시간
select curtime(), current_time;


-- now() vs sysdate() 날짜와 시간 (날짜함수중 제일많이씀)
select now(), sysdate();
select now(), sleep(2), now(); -- 2초 슬립시켰지만 시간이 같음
select now(), sleep(2), sysdate(); -- 2초 슬립됨


-- date_format(날짜,포맷형식) 날짜나 시간이 출력되는 방식을 임의로 편집
select date_format(now(), '%Y년 %m월 %d일 %h:%i:%s');
select date_format(now(), '%y년 %b월 %d일 %h:%i:%s');
select date_format(now(), '%d %b, \'%y %h:%i:%s');


-- period_diff(날짜1,날짜2)
-- 두 날짜의 형식을 맞춰주기위해서 포맷팅 해줘야함 date_format()
-- 예) 근무 개월 수
select first_name,
	   period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m')) as month
	from employees;
-- order by month; 기간순으로 정렬도 가능


-- date_add(날짜,표현식)(=adddate), date_sub(날짜,표현식)(=subdate)
-- 날짜를 date에 type(year, month, day)의 표현식을 더하거나 뺀다.
-- 예) 각 사원들의 근속년 수가 5년이 되는날을 구해야할때
select first_name, hire_date,
	   date_add(hire_date, interval 5 year)
	from employees;
    
    
-- max(),min()을
-- 날짜에도 사용 가능
select max(hire_date) as '가장최근입사', min(hire_date) as '가장오래된입사'
	from employees;



-- 여러가지 type들
-- 문자 : varchar, char, text
-- 정수 : int(integer), signed(unsigned)
-- 실수 : double, float
-- 시간 : date, datetime
-- LOB : CLOB(Chracter Large OBject), BLOB(Binary Large OBject)

-- cast 형변환
select '12345' + 10, cast('12345' as signed) + 10;
select '2022-10-10', date_format(cast('2022-10-10' as date),'%Y년 %m월 %d일');
select cast(cast(1-2 as unsigned) as signed);

