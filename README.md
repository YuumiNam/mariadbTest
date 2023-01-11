# MySQL 대신 mariaDB설치 + MySQL Workbench 설치

1. [MariaDB 다운로드 10.5.18](https://mariadb.org/download/?t=mariadb&p=mariadb&r=11.0.0&os=windows&cpu=x86_64&pkg=zip&m=blendbyte) <br/>
2. [MySQL Workbench 다운로드](https://dev.mysql.com/downloads/workbench/)


## DB생성 및 삭제
create database **DB이름**;

create user '**user이름**'@'localhost' identified by '**비밀번호**';

grant all privileges on **DB이름**.* to '**user이름**'@'**localhost**';    

flush privileges;

<br/>

drop database **DB이름**;

drop user '**user이름**'@'localhost';


## 기본공식
**select** (column) \
**from** (table) \
**where** (조건식)                    
                          
**order by** (column or 표현식) asc desc


## 집계함수를 썼을 때 공식
**select** (column) \
**from** (table) \
**where** (조건식)

**group by** (column)  <<  group by가 된 column은 select절에 올수 있다 \
**having**  (조건식)

**order by** (column or 표현식) asc desc


## Primary Key vs Foreign Key
**primary key** = 기본키,고유키 \
각 행을 고유하게 식별하는 키

**Foreign key** = 외래키 \
한 테이블의 column(속성)으로써 다른 테이블의 row(행)을 식별할수 있는 키


## 식별관계 vs 비식별관계
![employees](https://user-images.githubusercontent.com/114986610/211687282-21634756-5b2a-46c4-b38b-cc1e39dd2af0.png)

**식별관계** = 실선관계 \
다른 엔티티에 참조된 기본키가 그 엔티티에서도 기본키로 쓰이는경우

**비식별관계** = 점선관계 \
다른 엔티티에 참조된 기본키가 그 엔티티에서는 외래키로 쓰이는경우

즉, salaries에 있는 emp_no는 employees에서 가져온 속성이니까 외래키!! \
그리고 동시에 이 외래키가 salaries에서도 기본키로도 쓰였으니까 기본키!! \
둘다 충족하는셈이므로 외래키이자 기본키 라고 할수있다.

대부분의 관계는 **비식별관계**일것이다. \
왜냐하면 \
테이블 안에있는 각 행(데이터)을 고유하게 식별하기 위해서는 \
애초에 속성을 만들때 그 테이블과는 관계없는 넘버를 따로 지정해주고 \
그걸 기본키로 쓰는것이 절대 데이터끼리 겹칠일이 없기 때문이다.
