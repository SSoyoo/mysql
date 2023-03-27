SELECT * FROM hotel.namgu;

select 구분, 세대수, 면적
from namgu;

select distinct 면적 , 구분 ,세대수
from namgu;

select * from namgu where 구분 = '문현2동 ';
select * from namgu where 구성비 = 3;
select * from namgu where 구분 like '문현%'; 
select * from namgu where 구분 like '%문현%'; 

select * from namgu where 세대수 >= 10000;
select * from namgu where 세대수 <= 5000;

select * from namgu where 세대수 <=10000 AND 세대수 >=5000 ;
select * from namgu where 세대수 between 5000 and 10000;

select * from namgu where 통 in(21,22,23);
select * from namgu where 통 not in(21,22,23);

-- 인구수가 10000명 이상이면서 18세이상 인구수가 12000명 이하인 레코드 중 전체필드 검색

SELECT * FROM namgu 
WHERE 인구수 >= 10000 
AND 18세이상인구수 <=12000;

-- 남구 테이블에서 통 수가 20이상이거나 반 수가 100 이하인 레코드 중 구분, 세대수, 인구 필드 검색
SELECT 구분, 세대수, 인구수,통,반 FROM namgu 
WHERE 통 >= 20 or 반 <100;

-- 인구수가 10000명 이상이면서 18세이상 인구수가 12000명 이하이거나 반이 100 이하인 레코드 중 전체 필드 검색
-- 모호하니까 정확하게 표현하면
-- 인구수가 10000이상인 레코드 중에서 18세이상 인구수가 12000명 이하이거나 반이 100 이상인 레코드 중 전체 필드 검색

select * from namgu
where 인구수 >=10000
and (18세이상인구수 <=12000 or 반>=100);

select * from namgu
where 인구수 >=10000
and 18세이상인구수 <=12000 or 반>=100;
