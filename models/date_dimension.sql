with cte as(
select 
    to_timestamp(STARTED_AT) as STARTED_AT,
    date(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
    hour(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,
          {{Day_type('STARTED_AT')}}            ,
          {{season('STARTED_AT')}}              ,
         {{function1('STARTED_AT')}}
         
from {{ ref('stg_bike') }}
where STARTED_AT != 'started_at' and STARTED_AT != '"started_at"'
)

select * from cte

