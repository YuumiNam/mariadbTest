-- 함수 : 수학

-- abs 절대값
select abs(1), abs(-1);

-- ceil 올림
select ceil(3.14);

-- floor 내림
select floor(3.14);

-- mod 나머지
select mod(10,3);

-- round(x) x와 가장 근접한 정수
-- round(x,d) x값 중에 소수정 d자리에 가장 근접한 정수
select round(1.498), round(1.498,1), round(1.498,0);

-- power(x,y), pow(x,y) : x의 y제곱
select power(2,3), pow(2,3);

-- sign(x) x가 양수라면 1, 음수라면 -1, 0이라면 0
select sign(20), sign(-100), sign(0);

-- greatest(x,y, ...) , least(x,y, ...)
-- 가장 큰 값, 가장 작은 값
select greatest(10,40,20,50), least(10,40,20,50);
select greatest('b','A','C','B'), greatest('hello','help','hell'); -- 소문자 알파벳, 대문자 알파벳순