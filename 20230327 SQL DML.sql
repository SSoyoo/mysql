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










