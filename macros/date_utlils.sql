{% macro function1(x) %}
 
 case when  To_timestamp({{x}}) < Current_date then 'PAST'
 else 'Future'
 end  


{% endmacro %}



{% macro season(x)%}


 case when    month(to_timestamp({{x}})) in (12,1,2) then 'Winter'
         when  month(to_timestamp({{x}})) in (3,4,5) then 'Spring'
         when month(to_timestamp({{x}})) in (6,7,8) then 'Summer'
         else 'Autumn'
         end as Season

{% endmacro %}



{% macro Day_type(x) %}

    case when DAYNAME(to_timestamp({{x}}))  in ('Sat','Sun') then 'Weekend'
         else 'Businessdays'
         end as Day_type

{% endmacro %}