#DML : 데이터 조작어 
-- 데이터베이스의 테이블에 레코드를 삽입, 수정 삭제 검색 작업을 수행시키고자 할 때 사용하는 sql 문

-- 삽입문(insert into)
-- 해당 테이블에 레코드를 삽입할 때 사용하는 sql구문
/* 
 inser into 테이블명(필드1, 필드2, 필드3....) 
 values(필드1의 데이터, 필드2의 데이터, 필드3의 데이터....);
*/

/*
	모든 필드에 값을 넣을 때 
    insert into 테이블명(데이터1, 데이터2, 데이터3...);
    ***필드명을 적지 않았기 때문에 테이블의 순서대로 데이터를 넣어야함***
*/ 

use hotel;



select * from customer;

insert into customer(id, name) values ( 1, 'John Doe');

-- insert into customer(id, email) values(2 , 'qwer@qwe.com'); // name이 not null인데 안넣음
-- insert into customer(id, name, email) values(1, 'john doe', 'asdf@afADsf.com'); // id는 pk로 유니크값, 중복 안됨

insert into customer 
VALUES (3, 'Michle', '1234@qwer.com', 30 , 'This is Adress' , true);
 
 -- insert into customer
 -- VALUES(11, 'SOYOO@naver.com' , 'SOYOO','31','주소', true); 

 insert into customer 
 VALUES (12, 'Michle', 'ASDF@qwer.com', 30 , 'This is Adress', TRUE);


# update : 수정
-- 해당 테이블에서 특정 필드의 값을 수정하고자 할 때 사용하는 SQL문
-- UPDATE 테이블명 SET 필드명1 = 데이터1, 필드명2 = 데이터2 , 필드명3 = 데이터3, ....;
-- WHERE 필드명 = 데이터

UPDATE Customer SET accept_marketing = false;

UPDATE Customer set accept_marketing = true , age = 10;

-- UPDATE 테이블명 SET 필드명 1 = 데이터1 .....
-- WHERE 조건 
update customer set email = 'email@email.com'
where id = 1;

select * from customer;

# Delete : 삭제문
-- 해당테이블에서 레코드를 삭제할 때 사용하는 SQL문
-- DELETE FROM 테이블명 ; // 전부 삭제 
-- DELETE FROM 테이블명 WHERE 조건

DELETE FROM customer WHERE name = 'John Doe';
DELETE FROM customer;

# SELECT 검색문, 선택문
-- 해당 테이블에서 특정 필드를 검색하고자 할 때 사용하는 SQL문

-- SELECT 필드명1 필드명2 ...FROM 테이블명;

SELECT id, name from customer;

-- select * from 테이블명; 전체필드 조회
select * from customer;

-- 필드에 별칭 사용 
select name as 'Full Name' 
from customer;

-- 테이블에 별칭 사용
select c.name 
from customer as c;

-- 중복제거
-- DISTINCT 
SELECT DISTINCT name FROM customer;

-- 연산자 
-- 비교연산 

# BETWEEN A and B : A보다 크거나 같으면서 B보다 작거나 같으면 TRUE 반환 

SELECT * FROM customer
WHERE age BETWEEN 10 AND 20;

-- IN() : 인수로 전달된 값과 동일한 값이 하나라도 존재한다면 TRUE 반환

SELECT * FROM Customer
WHERE name IN('John Doe', 'Michle', 'James');

SELECT * FROM Customer
WHERE name = 'John Doe'
or name ='Michle'
or name = 'James';


-- IS :비교대상이 boolean 형태일 때 사용하는 비교연산자 
select * from customer
where accept_marketing IS true;

-- IS NULL : 비교대상이 NULL이면 TRUE 반환

select * from customer
where email is null;

-- Like : 문자열의 패턴을 비교하여 동일한 패턴을 가지고 있는 문자열이면 true를 반환
-- 와일드카드
--  & : 0개 이상의 패턴
-- _ : 1개의 패턴 

select * from customer
where email like '%gmail%'; -- 앞뒤에 뭐가 오든 gmail인걸 찾아라~

-- Constraint (제약조건)
-- RDBMS에서 삽입, 수정, 삭제에 대해서 무결성을 보장해주는 조건

-- not null : 입력, 수정에 있어서 해당 필드에 null이 올 수 없다.

-- create 
create table notnullTable1 (
	notnull_field int not null
);

-- alter
-- alter로 제약조건을 추가할 때는 원래 존재하는 레코드에 해당 필드의 데이터가 null이 존재하면 안된다.
alter table notnullTable1 
	modify column nonull_field int not null
;

-- default 
-- 입력 작업에서 해당 필드의 값이 들어오지 않으면 기본값으로 지정해주는 제약조건

create table defaultTable1(
	default_field int default 1
);
alter table defaultTable2
	modify column default_field int default 1;
    
-- 디폴트가 아닌데 디폴트를 넣으면 기존에 null이었고, 나중에 디폴트 제약조건을 추가해도 null로 남아있고 나중에 추가해서 작업하는 것만 1로 된다

-- unique
-- 삽입 수정 작업에서 해당 제약조건이 걸려있는 필드의 데이터에 대해 중복을 허용하지 않음

create table unique_Table1(
	unique_field int unique
);

create table unique_Table3(
	unique_field int,
    constraint unique_key_1 unique (unique_field)
);

alter table unique_Table3
	modify unique_field int unique;
    
    
create table unique_Table4(
	unique_field int
);


alter table unique_Table4
	add constraint unique_key_1 unique (unique_field);


-- primary key


create table primary_table1(
	primaty_field int primary key
);

create table primary_table2(
	primary_field int,
    constraint primary_key_1
    primary key(primary_field)
);

alter table primary_table3
modify column primary_field int primary key;

alter table primary_table4
	add constraint primary_key_1 primary key(primary_field)

-- foreign key
-- 참조 제약조건, 해당 테이블을 해당 필드를 기준으로 외부 테이블의 일부 필드를 마조하도록하는 제약조건
-- 해당 제약조건이 걸려있는 필드의 경우 참조하는 테이블의 참조 필드에 존재하는 데이터만 삽입 할 수 있음

create table referenced_table (
	primary_key int primary key
);

-- create 시에 참조 제약조건을 추가할 땐 선행적으로 참조할 테이블과 필드가 존재해야하고
-- 참조할 필드가 pk혹은 unique 제약조건이 지정되어 있어야한다.
-- 참조 제약조건이 걸리는 필드는 참조할 필드의 데이터타입과 일치해야한다.
create table foreign_table1 (
	foreign_field int,
    constraint foreign_key_1
    foreign key (primary_filed)
    references referenced_table (primary_key)
);

create table foreign_table2 (
	foreign_field int
);

alter table foreign_table2
add constraint foreign_key_1 
foreign key (foreign_field)
references referenced_table (primary_key) ;

select * from station


