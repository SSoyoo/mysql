-- 기차 예약 데이터베이스 생성 

create database train_reservation;
use train_reservation;

-- 가격 테이블 생성

create table Cost(

	departure_staion VARCHAR(50) not null,
    arrival_station varchar(50) not null ,
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
    address  text NOT NULL UNIQUE,
    tel_number VARCHAR(15) NOT NULL UNIQUE 
);


CREATE TABLE Stop_station(
	
    station_name int NOT NULL ,
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
