-- view 
-- 복잡한 쿼리문(select)을 미리 작성해두고 재사용할 수 있도록 해주는 읽기전용의 가상테이블
-- 읽기전용이기 때문에 테이블의 삽입, 수정, 삭제 작업의 제약을 걸 때 사용할 수 없다 
-- create view 뷰이름 as 
-- select ~~~~

create view join_result as
select r.room_number as '방번호', c.name as '고객이름'
from room r right join customer c
on c.id = r.customer_id;

select * from join_result
where 방번호 = 1001;

-- VIEW 수정
-- ALTER VIEW 뷰 이름 AS
-- select~~~~~

ALTER VIEW join_result as
select r.room_number as '방번호', c.name as '고객이름', c.email as'고객이메일'
from room r inner join customer c
on c.id = r.customer_id;

select * from join_result;

-- view 삭제 
-- drop view 뷰이름

drop view join_result;



# index!
select * from mysql.user;

-- Index 
-- 테이블의 검색속도를 향상시켜주는 기능을 담당하는 요소
-- 인덱스가 적용되어 있는 필드의 경우 해당 필드를 조건으로 검색을 시도할 때 검색속도가 향상된다
-- 인덱스가 적용되어 있는 필드를 수정할 경우 인덱스도 함께 변경되어 검색 속도에 영향을 미칠 수가 있음

-- create index 인덱스명 
-- on 테이블 (필드명,....);

create index seadesu_index
on namgu (세대수); 

-- 인덱스 확인하기 
show index from namgu;

create index seadesu_index2
on namgu (세대수,인구수,통); 

create unique index seadesu_unique_index
on namgu(세대수);
-- non unique  자리가 0이 된다. 

select * from namgu;







