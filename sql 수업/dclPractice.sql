-- 실행은 ctrl + enter

-- 데이터베이스 생성
create database webdb;

-- db 사용자 생성
create user 'webdb'@'localhost' identified by 'webdb'; -- localhost는 내 컴퓨터 안에서만 도는 것

-- db 사용자 삭제
-- drop user 'webdb'@'localhost';

-- 권한 부여
grant all privileges on webdb.* to 'webdb'@'localhost'; -- 원래 webdb.뒤에는 테이블이 나와야함 *는 와일드카드

-- 권한 정보 재로딩
flush privileges;

-- 데이터베이스 생성 확인
show databases;