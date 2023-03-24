# DDL (데이터 정의어)
# 데이터베이스 혹은 테이블을 생성, 수정, 삭제할 때 사용하는 SQL문

-- create
-- 데이터베이스나 테이블 등을 생성할 때 사용하는 SQL문
-- 데이터베이스 생성 : CREATE DATABASE 데이터베이스명;

CREATE DATABASE Hotel;

-- 데이터베이스를 생성했으면 사용할 데이터베이스를 선택alter
-- USE 데이터베이스명 ; 
show databases;
USE Hotel;

/*
 테이블생성 
 CREATE TABLE 테이블명 (
 필드명 데이터타입(데이터길이) 제약조건, -> 데이터타입이 프로그래밍 언어의 데이터 타입과는 약간 상이
 ...
 );
*/

CREATE TABLE Customer(
	id int primary key , 
    name varchar(20) NOT NULL , 
    email VARCHAR(30) unique,
    age int,
    address TEXT ,
    accept_marketing BOOLEAN DEFAULT false
);

SHOW TABLES;

-- 데이터베이스 수정 : 테이이블에 필드 추가 삭제, 제약조건 변경 등 -- 
-- ALTER DATABASE 데이터메이스명 속성명 = 값; 

-- 테이블 수정 
-- ALTER TABLE 테이블명

-- 테이블 필드 추가
-- ALTER TABLE 테이블명 ADD 필드명 데이터타입 (데이터길이) 제약조건
-- 필드 삭제
-- ALTER TABLE 테이블명 DROP 필드명
-- 테이블 필드 수정
-- ALTER TABLE 테이블명 MODIFY COLUMN 데이터타입(데이터길이) 제약조건;

## DROP

-- 테이블 삭제 
-- DROP TABLE 테이블명; -> 테이블의 정의 자체를 제거 
-- TRUNCATE TABLE 테이블명; -> 테이블을 정의만 남기고 모두 제거 (생성 초기상태로 돌려 놓는다)











