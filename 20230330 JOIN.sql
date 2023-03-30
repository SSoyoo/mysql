create table room(
	room_number varchar(4) primary key,
    room_type varchar(20) not null,
    room_amount int not null,
    customer_id int,
    constraint room_foreign_key
    foreign key (customer_id) 
    references customer(id)
);

select * from room;
select * from customer;

insert into room 
values(1001,'비지니스', 200, 1);

insert into room 
values(1204,'vip', 1000, 3);

insert into room 
values(1802,'vip', 1000, 12);

insert into room 
values(1005,'비지니스', 200, 1);

insert into room 
values(1206,'vip', 1000, 3);

insert into room 
values(1803,'vip', 1000, 12);

insert into room 
values(1006,'비지니스', 200, null);

insert into room 
values(1207,'vip', 1000, null);

insert into room 
values(1804,'vip', 1000, null);

-- join 
-- 여려개의 테이블에서 관계로 연결되어 있는 표현을 하나로 검색하도록 해주는 쿼리

-- inner join
-- from 첫번째 테이블 inner join 두번째 테이블 on 조건
-- 혹은
-- from 첫번재 테이블 join 두번째 테이블 on 조건
-- 혹은
-- from 첫번재 테이블, 두번째 테이블 where 조건 


select * from room  Inner join customer
on customer.id = room.customer_id; 
-- null 인건 안나옴


select * from room r Inner join customer c 
on c.id = r.customer_id; 

select * from room join customer; -- 모든 조합 다 나옴. cross 조인! 

select * from room, customer
where room.customer_id = customer.id;

-- left join : 첫번째 테이블에 두번째 테이블을 붙임
-- from 첫번재 테이블 letf join 두번째 테이블 on 조건


select * from room left join customer
on room.customer_id = customer.id;

insert into customer 
values(20, 'david', 'david@gamil.com',30,'new york',1);


-- right join
-- from 첫번재 테이블 right join 두번째 테이블 on 조건

select * from room right join customer
on customer.id = room.customer_id;

-- 서브쿼리
-- 복잡한 join문을 조금 더 간결하게 사용할 수 있도록 해주는 쿼리
-- select inset update delete set do 에서 사용가능 
-- from , where 절에 사용가능

-- michle 이란 사람이 예약한 방을 조회할 때 서브쿼리를 사용한다.
-- 1. where절에서 사용

-- 하나의 고객은 여러개의 방을 예약할 수 있음. 고객한명당 여러개의 방이 나올 수 있다.
select * from room 
where customer_id in  (
	select id 
    from customer
    where name = 'Michle'
);

-- ex) in 연산 + like 


select * from customer
where id in (
	select id
    from customer
    where name like 'M%'
    or name like 'd%'
    );
    
select customerId
from(
	select id as customerId, email as customerEmail
    from customer
) c;

-- oder by(정렬) 특정 필드를 기준으로 정렬하여 결과반환

select * from namgu;

select * from namgu
order by 세대수 desc;

select * from namgu
order by 통 desc, 반 asc;













