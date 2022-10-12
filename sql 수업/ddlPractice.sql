-- 현재버전과 오늘날짜(함수는 대소문자 구분x)
select version(), current_date();


show databases;
show tables;


-- 쿼리에서 계산도 가능
select sin(pi()/4), (4+1)*5;


-- ,(콤마)는 두 쿼리를 나누는 역할을 한다
select version(); select now();


-- 테이블 만들기
create table pet(
	name varchar(20), -- varchar는 타입 20자 이내 스트링
    owner varchar(20),
    species varchar(20),
    gender char(1), -- char는 타입 1자만 가능
	birth date,
    death date
	);


-- 테이블 삭제
drop table pet;
    
    
-- 스키마 확인 (스키마란?? db나 table의 구조)
desc pet;


-- 조회
select name, owner, species, gender, birth, death from pet;


-- 데이터 넣기(row열)
insert
	into pet -- 특정 column만 넣고 싶다면 pet(name, owner) 이런식으로만... value 뒤에도 name과 owner만 와야함
	value('초코','이선무','puppy','m','2022-5-12',null);
    
    
-- 데이터 삭제
delete
	from pet
    where name = '초코'; 



-- load data local file (파일을 테이블로 불러오기)
-- 안되면 MySQL Connections를 들어가서 Advanced - others에 OTP_LOCAL_INFILE=1 값을 넣어준다
load data local infile 'c://pet.txt' into table pet;



-- update수정 (death가 '0000-00-00'인것을 null로 바꿔줌)
update pet
	set death = null
    where name != 'Bowser';


-- 조회1 : where (row열 선택조건)
-- 1990년 이후에 태어난 아이들은? (출력 : 이름, 종, 생일)
select name, species, birth
	from pet 
    where birth > '1990-12-31';
    
    
-- 주인이 Gwen인 pet들은?? (츨력 : 이름, 종, 주인)
select name, species, owner
	from pet
    where owner = 'Gwen';
    
    
-- null 다루기1 : 현재 살아있는 아이들은? (출력 : 이름, 생일, 사망일)
select name, birth, death
	from pet
    where death is null; -- null은 =을 쓸수없다.
    
    
-- null 다루기2 : 사망한 아이들은? (출력 : 이름, 생일, 사망일)
 select name, birth, death
	from pet
    where death is not null;
    
    
-- like 검색1 (패턴매칭) : 이름이 b로 시작하는 아이들은? (출력 : 이름)
select name
	from pet
    where name like 'b%'; -- b% : b로 시작하는 모든 문자열, %b : b로 끝나는 문자열, %b% : b가 포함된문자열  
    
    
-- like 검색2 (패턴매칭) : 이름이 b로 시작하는 아이들중 이름이 6자? (출력 : 이름)
select name
	from pet
    where name like 'b_____'; -- '_'한개당 글자 한개
    
    
-- 정렬1 (order by) : 나이가 적은 순으로 정렬하려면? (출력 : 이름 생일)
select name, birth
	from pet 
    order by birth desc; -- 내림차순 작은것부터 (desc), 오름차순 큰것부터 (asc)
    
    
-- 정렬2 (order by) : 나이가 많은 순으로 정렬하려면? (출력 : 이름 생일)
select name, birth
	from pet
    order by birth asc; -- 내림차순 작은것부터 (dsec), 오름차순 큰것부터 (asc)
    
    
-- 집계 함수 (통계) : 전체 개수를 구하려면?
select count(*) from pet; -- count()안에 *를 넣어주면 가장 빨리 셀수있는 index를 알아서 잡아줌(우리가 임의지정하면 이상한걸 셀수도있으니까)
    
    