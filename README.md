## MySQL 대신 mariaDB설치 + MySQL Workbench 설치

1. [MariaDB 다운로드 10.5.18](https://mariadb.org/download/?t=mariadb&p=mariadb&r=11.0.0&os=windows&cpu=x86_64&pkg=zip&m=blendbyte) <br/>
2. [MySQL Workbench 다운로드](https://dev.mysql.com/downloads/workbench/)


## DB생성 및 삭제
create database **DB이름**;

create user '**user이름**'@'localhost' identified by '**비밀번호**';

grant all privileges on **DB이름**.* to '**user이름**'@'**localhost**';    

flush privileges;


<br/><br/>

drop database **DB이름**;

drop user '**user이름**'@'localhost';

