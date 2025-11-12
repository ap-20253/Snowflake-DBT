with cte as(
select 
    to_timestamp(STARTED_AT) as STARTED_AT,
    date(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
    hour(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,
    case when DAYNAME(to_timestamp(STARTED_AT))  in ('Sat','Sun') then 'Weekend'
         else 'Businessdays'
         end as Day_type,
    case when month(to_timestamp(STARTED_AT)) in (12,1,2) then 'Winter'
         when  month(to_timestamp(STARTED_AT)) in (3,4,5) then 'Spring'
         when month(to_timestamp(STARTED_AT)) in (6,7,8) then 'Summer'
         else 'Autumn'
         end as Season
from {{ source('demo', 'bike') }} 
)

select * from cte

