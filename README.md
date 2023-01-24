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
![employees](https://user-images.githubusercontent.com/114986610/211687282-21634756-5b2a-46c4-b38b-cc1e39dd2af0.png) \
(employeesDB 안에있는 테이블간 관계를 불러온것!! 이 관계도를 **ERD**라고 부른다.)


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

## 1대N관계 vs N대N
**1대N 관계** \
한쪽 엔티티가 관계를 맺은 상대 엔티티쪽에서 여러개의 객체를 생성할수 있다. \
ex) 한 사람이 여러개의 전화번호를 가질수는있지만, 여러 사람이 같은번호를 가질수는 없다.

**N대M 관계** \
관계를 맺은 각 엔티티가 서로에게 여러개의 객체를 생성할수 있다. \
ex) 한명의 학생이 여러 수업을 수강하고, 한 수업은 여러 학생을 수용한다.

![화면 캡처 2023-01-24 195803](https://user-images.githubusercontent.com/114986610/214274384-6cfd0905-4b5c-42bd-b5c8-7290a30278ed.png)

논리적으로 N대M 관계의 표현은 가능하지만, 2개의 테이블만으로 구현하는 것은 불가능하다. \
각 테이블의 기본키(PK)를 외래키(FK)로 참조 하고 있는 연결테이블을 사용해야 한다.

![화면 캡처 2023-01-24 200012](https://user-images.githubusercontent.com/114986610/214274807-5cfdfba2-38e0-4b5b-96cb-41c02bedc9ec.png)

- '철수'는 '국어', '영어', '수학' 3가지의 수업을 수강하고 있고, '수학'은 '철수', '영희', '미자'를 수용 하고 있다. \
- 만약 철수가 듣고있는 수업들을 알고 싶다면, 철수의 학생코드 1을 조건문으로 학생_수업 테이블을 조회 \
- 만약 영희가 국어 수업을 듣게 된다면, 영희의 학생 코드 2와 국어의 수업코드 a를 학생_수업 테이블에 삽입


### TIP) 테이블간의 관계를 이해하기가 어려운 분들에게
**1. 논리적으로 생각할 땐, 연결(매핑) 테이블은 생각하지 않는다.**
- 철수의 학생 코드는 학생_수업 테이블에 여러개 존재함 (X)
- 철수는 국어, 영어, 수학 수업을 수강한다 (O)

**2. 항상 일대다(1:N) 기준으로 생각하기! 다대일(N:1)보다 직관적으로 이해하기 쉽다.**
- 철수가 여러 수업을 수강한다 (O)
- 국어, 영어, 수학은 철수를 수용한다 (X)
