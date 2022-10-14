-- DDL
-- 테이블 편집, column 편집, row 편집
-- 하지만 요즘에는 다 툴을써서 함

-- 테이블 생성하기
create table member(
	no int(11) not null auto_increment,
    email varchar(100) not null,
    password varchar(64) not null,
    name varchar(100) not null,
    department varchar(100),
    primary key(no)
);

-- 테이블 column 확인
desc member;

-- 테이블 삭제
drop table member;




-- 테이블에 column넣기
-- add, drop, change

-- column 생성
alter table member add column juminbunho varchar(13) not null;

-- column 삭제
alter table member drop column juminbunho;

-- column을 특정 column뒤에 생성
alter table member add column juminbunho varchar(13) not null after email;

-- column 변경
alter table member change department dept varchar(90) not null;





-- column에 row넣기
-- insert , update, delete 

-- insert
insert
	into member
    values(null,'dltjsam@gmail.com', password('1234'), '이선무', '개발팀', null);
    
insert
	into member(no, email, name, password, dept)
    values(null,'dltjsam@gmail.com', '이선무', password('1234'), '개발팀');
    
select *
	from member;
    
    
-- update
update member
	set email = 'dltjsam1@gmail.com', password = password('4321')
    where no = 2;
    
    
-- delete
delete
	from member
    where no = 2;
    
    

-- transaction DB에 실제 반영하는것을 미룸
-- 은행에서 계좌이체를 할때 송급계좌는 업데이트 됐는데, 입금계좌는 업데이트가 에러난 경우
-- 모든 업데이트가 정상적으로 이루어져야지 DB에 실제 반영시키도록 만듬
select @@autocommit;
set autocommit = 0;

insert
	into member
    values(null,'dltjsam1@gmail.com', password('2134'), '선무', '개발팀', null); -- 추가를 했지만, 실제 db에는 반영x mariadb에 들어가보면 확인가능

select *
	from member;

commit;

