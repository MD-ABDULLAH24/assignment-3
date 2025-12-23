# 🚗 Vehicle Rental System – SQL Queries


---

## 📦 Database Schema

### 1️⃣ users

Stores system users.

* **user_id** (Primary Key)
* **name**
* **email** (unique)
* **role** (Admin / Customer)

### 2️⃣ vehicles

Stores rentable vehicles.

* **vehicle_id** (Primary Key)
* **name**
* **type** (car / bike / truck)
* **model**
* **registration_number** (unique)
* **rental_price**
* **status** (available / rented / maintenance)

### 3️⃣ bookings

Stores booking information.

* **booking_id** (Primary Key)
* **user_id** (Foreign Key → users)
* **vehicle_id** (Foreign Key → vehicles)
* **start_date**
* **end_date**
* **booking_status**

---

## 🧠 SQL Queries

### 🔹 Query 1: INNER JOIN

**Objective:** Show booking details with customer and vehicle names.

```sql
select
  b.booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  b.start_date,
  b.end_date,
  b.booking_status as status
from bookings b
inner join users u
  on b.user_id = u.user_id
inner join vehicles v
  on b.vehicle_id = v.vehicle_id;
```

**Explanation:**

* Uses `bookings` as the base table
* Joins `users` and `vehicles` using foreign keys
* Returns only matching records across all tables

---

### 🔹 Query 2: NOT EXISTS

**Objective:** Find vehicles that have never been booked.

```sql
select
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
from vehicles v
where not exists (
  select 1
  from bookings b
  where b.vehicle_id = v.vehicle_id
);
```

**Explanation:**

* Checks if a vehicle has no related records in `bookings`
* Returns only unbooked vehicles

---

### 🔹 Query 3: WHERE Clause

**Objective:** Retrieve available cars only.

```sql
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
```

**Explanation:**

* Filters rows using conditions
* Applies multiple filters with `AND`

---

### 🔹 Query 4: GROUP BY & HAVING

**Objective:** Find vehicles booked more than 2 times.

```sql
select
  v.name as vehicle_name,
  count(b.booking_id) as total_bookings
from vehicles v
inner join bookings b
  on v.vehicle_id = b.vehicle_id
group by v.vehicle_id, v.name
having count(b.booking_id) > 2;
```

**Explanation:**

* Groups bookings by vehicle
* Counts bookings per vehicle
* Filters grouped results using `HAVING`

---

## 🧩 ERD Diagram

ERD Design Link:
[https://drawsql.app/teams/abdullah-48/diagrams/vehicle-rental-system](https://drawsql.app/teams/abdullah-48/diagrams/vehicle-rental-system)


