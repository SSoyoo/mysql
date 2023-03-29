-- 기차 예약 데이터베이스 생성 

create database train_reservation;
use train_reservation;

-- 가격 테이블 생성

create table Cost(

	departure_staion int not null,
    arrival_station int not null ,
    amount int not null
    
);

drop table cost;

create table train(
    train_number VARCHAR(10) PRIMARY KEY,
    departure_station VARCHAR(10) NOT NULL,
    departure_time TIME NOT NULL,
    arrival_station varchar(50) NOT NULL,
    arrival_time TIME NOT NULL,
    take_minuate TIME NOT NULL,
    type VARCHAR(10) not null
 );


CREATE TABLE Staion (
	Station_number int AUTO_INCREMENT PRIMARY KEY,
    Station_name VARCHAR(50) NOT NULL UNIQUE,
    address  varchar(500) NOT NULL UNIQUE,
    tel_number VARCHAR(15) NOT NULL UNIQUE 
);


CREATE TABLE Stop_station(
	
	station_number int NOT NULL ,
    train_number VARCHAR(10) NOT NULL,
    arrival_time TIME NOT NULL ,
    depature_time TIME NOT NULL  

);
	
CREATE TABLE Seat(
	seat_code VARCHAR(5) PRIMARY KEY,
	type VARCHAR(10) NOT NULL, -- 일반실, 특실 
	Seat_number VARCHAR(2) NOT NULL,
    Train_type VARCHAR(10) NOT NULL
);

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

alter table cost
add constraint cost_primary_key 
primary key (departure_staion, arrival_station); 

alter table cost 
add constraint cost_foreign_key_1 
foreign key (departure_staion)
references Staion (station_number);

alter table cost 
add constraint cost_foreign_key_2
foreign key (arrival_station)
references Staion (Station_number);

alter table stop_station
add constraint stop_station_primary_key
primary key (Station_number,train_number);



alter table stop_station
add constraint stop_station_foreign_key_1
foreign key (station_number)
references staion(station_number);

alter table stop_station
add constraint stop_station_foreign_key_2
foreign key (train_number)
references train (train_number);







