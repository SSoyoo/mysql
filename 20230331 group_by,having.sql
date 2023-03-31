select count(면적)
from namgu;

select count(면적), max(세대수), min(세대수)
from namgu;

select 면적, count(*), max(세대수), min(세대수)
from namgu 
group by 면적;

select 면적, count(*), max(세대수), min(세대수)
from namgu 
where max(세대수) >=5000
group by 면적
order by 면적;

-- 그룹바이 되지 않는 필드는 having절 사용불가
select 면적, count(*), max(세대수), min(세대수)
from namgu 
group by 면적
having max(세대수) >= 5000
order by 면적;
