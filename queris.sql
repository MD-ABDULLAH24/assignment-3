-- query 1 - Inner Join


select
  b.booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  b.start_date,
  b.end_date,
  b.booking_status
from
  bookings as b
  inner join users as u on b.user_id = u.user_id
  inner join vehicles as v on b.vehicle_id = v.vehicle_id;



--   query 2 - EXISTS

select
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
from vehicles as v
where not exists (
  select booking_id
  from bookings b
  where b.vehicle_id = v.vehicle_id
);

-- query 3 WHERE

select
  vehicle_id,
  name,
  type,
  model,
  registration_number,
  rental_price,
  status
from vehicles
where type = 'car'
  and status = 'available';


  -- Query 4  GROUP BY and HAVING

  select
  v.name as vehicle_name,
  count(b.booking_id) as total_bookings
from vehicles v
inner join bookings b
  on v.vehicle_id = b.vehicle_id
group by v.vehicle_id, v.name
having count(b.booking_id) > 2;




