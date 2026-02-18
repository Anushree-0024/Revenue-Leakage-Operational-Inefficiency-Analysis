# What percentage of total booking demand is lost due to ride failures?
with cte_1 as (select
sum(booking_value) as total_booking_value, 
sum(case when ride_outcome in ('cancelled_by_driver','incomplete_ride') then booking_value else 0 end) as lost_revenue
from rides)
select 
total_booking_value,
lost_revenue, round((lost_revenue * 100.0 /total_booking_value),2) as pct 
from cte_1;


# Which vehicle type contributes the highest share to total revenue leakage?
with vehicle_leakage as (select Vehicle_Type,
sum(booking_value) as total_booking_value, 
sum(case when ride_outcome in ('cancelled_by_driver','incomplete_ride') then booking_value else 0 end) as lost_revenue
from rides
group by Vehicle_Type),

total_revenue_leakage as ( select
sum(lost_revenue) as total_lost_revenue 
from vehicle_leakage)
select v.Vehicle_type, v.lost_revenue,
round((v.lost_revenue * 100.0/ t.total_lost_revenue),2) as share_to_total_revenue_leakage
from vehicle_leakage v 
cross join total_revenue_leakage t
order by share_to_total_revenue_leakage desc
limit 2 ;




#What percentage of total lost revenue comes from the top 20% highest-risk locations?
with location_leakage as (
select pickup_location,
sum(case 
when ride_outcome in ('incomplete_ride', 'cancelled_by_driver') then booking_value 
else 0 
end) as lost_revenue
from rides
group by pickup_location
),

ranked_locations as (
select 
pickup_location,
lost_revenue,
row_number() over (order by lost_revenue desc) as rn,
count(*) over () as total_locations,
sum(lost_revenue) over () as total_lost_revenue
from location_leakage
)

select 
round(
sum(case 
when rn <= total_locations * 0.2 
then lost_revenue 
else 0 
end
) * 100.0 / max(total_lost_revenue), 2 ) as pct_lost_revenue_from_top_20pct_locations
from ranked_locations;


#If cancellation rate reduces by 10%, how much additional revenue can be realized?
with lost_revenue_Cal as (
select sum(
case when ride_outcome in ('cancelled_by_driver') then booking_value else 0 end) as total_lost_revenue 
from rides
)
select total_lost_revenue, total_lost_revenue * 0.10 as additional_revenue
from lost_revenue_Cal




#Which time-of-day segment contributes the highest revenue leakage rate?

with time_of_day as (
select 
case
when booking_hour between 0 and 6 then 'Midnight'
when booking_hour between 7 and 12 then 'Morning'
when booking_hour between 13 and 18 then 'Afternoon'
else 'Night'
end as time_segment,
sum(
case when ride_outcome in ('cancelled_by_driver','incomplete_ride') then booking_value else 0 end) as lost_revenue_per_time_segment
from rides
group by 1 ),
lost_revenue_cal as ( 
select sum(case when ride_outcome in ('cancelled_by_driver','incomplete_ride') then booking_value else 0 end) as total_lost_revenue
from rides)
select time_segment, lost_revenue_per_time_segment * 100.00 /sum(lost_revenue_per_time_segment) over() as pct_contribution
from time_of_day
order by pct_contribution desc;