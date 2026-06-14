-- TABLE EXPLORATION --
-- This is to see and understand all the tables --
SELECT *
FROM customers;
-- There are 200 rows and 8 columns on the table --

SELECT *
FROM delivery_events;
-- There are 170820 rows and 11 columns on the table --

SELECT *
FROM driver_monthly_metrics;
-- There are 4464 rows and 9 columns on the table --

SELECT *
FROM drivers;
-- There are 150 rows and 12 columns on the table --

SELECT *
FROM facilities;
-- There are 50 rows and 9 columns on the table --

SELECT *
FROM fuel_purchases;
-- There are null values in truck_id and driver_id  to be handled in data cleaning section --
-- There 192442 rows and 11 columns on the table --

SELECT *
FROM loads;
-- There are 85410 rows and 12 columns on the table --

SELECT *
FROM maintenance_records;
-- There 2920 rows and 12 columns on the table --

SELECT *
FROM routes;
-- There are 58 rows and 9 columns on the table --

SELECT *
FROM safety_incidents
WHERE truck_id IS NULL;
-- There 170 rows and 15 columns on the table --

SELECT *
FROM trailers;
-- There 180 rows and 9 columns on the table --

SELECT *
FROM trips;
-- There are Null values in driver_id, truck_id and trailer_id --
-- There 85410 rows and 12 columns on the table --

SELECT *
FROM truck_utilization_metrics;
-- There are 3312 rows and 10 columns on the table --

SELECT *
FROM trucks;
-- There are 120 rows on the table and 11 columns on the table --

-- DATA CLEANING & PREPARATION --
-- CHECKING FOR NULL VALUES --
SELECT
  SUM(CASE WHEN driver_id       IS NULL THEN 1 ELSE 0 END) AS null_driver,
  SUM(CASE WHEN first_name   IS NULL THEN 1 ELSE 0 END) AS null_firstname,
  SUM(CASE WHEN last_name      IS NULL THEN 1 ELSE 0 END) AS null_lastname,
  SUM(CASE WHEN hire_date       IS NULL THEN 1 ELSE 0 END) AS null_hire,
  SUM(CASE WHEN termination_date    IS NULL THEN 1 ELSE 0 END) AS null_termination,
  SUM(CASE WHEN license_number    IS NULL THEN 1 ELSE 0 END) AS null_licence
FROM drivers;
--- There are 124 null termination date on the drivers table because they are active drivers --

SELECT
  SUM(CASE WHEN fuel_purchase_id       IS NULL THEN 1 ELSE 0 END) AS null_purchase_id,
  SUM(CASE WHEN trip_id   IS NULL THEN 1 ELSE 0 END) AS null_trip_id,
  SUM(CASE WHEN truck_id      IS NULL THEN 1 ELSE 0 END) AS null_truck_id,
  SUM(CASE WHEN driver_id       IS NULL THEN 1 ELSE 0 END) AS null_driver_id,
  SUM(CASE WHEN purchase_date    IS NULL THEN 1 ELSE 0 END) AS null_purchase_date,
  SUM(CASE WHEN location_city    IS NULL THEN 1 ELSE 0 END) AS null_city,
  SUM(CASE WHEN location_state    IS NULL THEN 1 ELSE 0 END) AS null_state,
  SUM(CASE WHEN gallons    IS NULL THEN 1 ELSE 0 END) AS null_gallons,
  SUM(CASE WHEN price_per_gallon    IS NULL THEN 1 ELSE 0 END) AS null_price_per_gallon,
  SUM(CASE WHEN total_cost    IS NULL THEN 1 ELSE 0 END) AS null_tot_cost,
  SUM(CASE WHEN fuel_card_number    IS NULL THEN 1 ELSE 0 END) AS null_card
FROM fuel_purchases;
-- There are 3880 null truck_id and 3988 null driver_id on the fuel_purchase table --

SELECT
  SUM(CASE WHEN incident_id       IS NULL THEN 1 ELSE 0 END) AS null_incident_id,
  SUM(CASE WHEN trip_id   IS NULL THEN 1 ELSE 0 END) AS null_trip,
  SUM(CASE WHEN truck_id      IS NULL THEN 1 ELSE 0 END) AS null_truck,
  SUM(CASE WHEN driver_id       IS NULL THEN 1 ELSE 0 END) AS null_driver,
  SUM(CASE WHEN incident_date     IS NULL THEN 1 ELSE 0 END) AS null_incident_date,
  SUM(CASE WHEN location_city    IS NULL THEN 1 ELSE 0 END) AS null_location_city,
  SUM(CASE WHEN location_state    IS NULL THEN 1 ELSE 0 END) AS null_location_state,
  SUM(CASE WHEN at_fault_flag    IS NULL THEN 1 ELSE 0 END) AS null_at_fault,
  SUM(CASE WHEN injury_flag    IS NULL THEN 1 ELSE 0 END) AS null_injury,
  SUM(CASE WHEN vehicle_damage_cost    IS NULL THEN 1 ELSE 0 END) AS null_vehicle_damage_cost,
  SUM(CASE WHEN cargo_damage_cost    IS NULL THEN 1 ELSE 0 END) AS null_cargo_damage_cost,
  SUM(CASE WHEN claim_amount    IS NULL THEN 1 ELSE 0 END) AS null_claim_amount,
  SUM(CASE WHEN preventable_flag    IS NULL THEN 1 ELSE 0 END) AS null_preventable,
  SUM(CASE WHEN description    IS NULL THEN 1 ELSE 0 END) AS null_description
FROM safety_incidents;
-- There is 1 null truck_id and 1 null driver_id on the safety_incidents table --

SELECT
	SUM(CASE WHEN trip_id    IS NULL THEN 1 ELSE 0 END) AS null_trip_id,
	SUM(CASE WHEN load_id    IS NULL THEN 1 ELSE 0 END) AS null_load_id,
	SUM(CASE WHEN driver_id    IS NULL THEN 1 ELSE 0 END) AS null_driver_id,
	SUM(CASE WHEN truck_id    IS NULL THEN 1 ELSE 0 END) AS null_truck_id,
	SUM(CASE WHEN trailer_id    IS NULL THEN 1 ELSE 0 END) AS null_trailer_id,
	SUM(CASE WHEN dispatch_date    IS NULL THEN 1 ELSE 0 END) AS null_dispatch_date,
	SUM(CASE WHEN actual_distance_miles    IS NULL THEN 1 ELSE 0 END) AS null_distance_miles,
	SUM(CASE WHEN actual_duration_hours    IS NULL THEN 1 ELSE 0 END) AS null_duration_hours,
	SUM(CASE WHEN fuel_gallons_used    IS NULL THEN 1 ELSE 0 END) AS null_fuel_gallons_used,
	SUM(CASE WHEN average_mpg    IS NULL THEN 1 ELSE 0 END) AS null_fuel_average_mpg,
	SUM(CASE WHEN idle_time_hours    IS NULL THEN 1 ELSE 0 END) AS null_idle_time,
	SUM(CASE WHEN trip_status    IS NULL THEN 1 ELSE 0 END) AS null_trip_status
FROM trips;
-- There are 1714 null driver_id on the trips table --
-- There are 1672 null truck_id on the trips table --
-- There are 1680 null trailer_id on the trips table --

-- The other tables were checked and without null values --

-- DETECTION OF DUPLICATES --
-- The checks will be done on the primary key column --

SELECT driver_id, COUNT(*) AS cnt
FROM driver_monthly_metrics
GROUP BY driver_id
HAVING COUNT(*) > 1;
-- These are not duplicate entries but rather, drivers going on multiple trips for delivery --

SELECT truck_id, COUNT(*) AS cnt
FROM truck_utilization_metrics
GROUP BY truck_id
HAVING COUNT(*) > 1;
-- Theses are not duplicate entries, they are different truck usage entries --

-- There are no duplicate value entries on all the tables --

-- DATA TYPE VALIDATION AND FORMATTING --
-- Date column standardisation --
-- To check Date standardization accross tables --
SELECT TOP 10 
    contract_start_date,
    'Invalid Format' AS format_check
FROM customers
WHERE contract_start_date NOT LIKE '____-__-__' 
   OR contract_start_date IS NULL; -- check on customer table

SELECT TOP 10 
    date_of_birth,
    'Invalid Format' AS format_check
FROM drivers
WHERE date_of_birth NOT LIKE '____-__-__' 
   OR date_of_birth IS NULL; -- check on driver table

SELECT TOP 10 
    load_date,
    'Invalid Format' AS format_check
FROM loads
WHERE load_date NOT LIKE '____-__-__' 
   OR load_date IS NULL; -- check on loads table

-- Validate revenue is positive
SELECT COUNT(*) AS negative_revenue
FROM loads
WHERE revenue <= 0;

-- Validate MPG is within realistic range (3–15 for heavy trucks)
SELECT COUNT(*) AS suspicious_mpg
FROM trips
WHERE average_mpg < 3 OR average_mpg > 15;

-- Check all unique values in status columns
SELECT DISTINCT status 
FROM trucks;

SELECT DISTINCT employment_status 
FROM drivers;

SELECT DISTINCT load_status 
FROM loads;

SELECT DISTINCT trip_status 
FROM trips;

-- Orphan check: trips referencing non-existent loads
SELECT COUNT(*) AS orphan_trips
FROM trips t
LEFT JOIN loads l ON t.load_id = l.load_id
WHERE l.load_id IS NULL;

-- Orphan check: loads with invalid customer references
SELECT COUNT(*) AS invalid_customers
FROM loads l
LEFT JOIN customers c ON l.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- TABLE INDEXING --
-- Indexes for core join columns --
CREATE NONCLUSTERED INDEX idx_trips_load_id ON trips(load_id);
CREATE NONCLUSTERED INDEX idx_trips_driver_id ON trips(driver_id);
CREATE NONCLUSTERED INDEX idx_trips_truck_id ON trips(truck_id);
CREATE NONCLUSTERED INDEX idx_loads_customer ON loads(customer_id);
CREATE NONCLUSTERED INDEX idx_loads_route ON loads(route_id);
CREATE NONCLUSTERED INDEX idx_loads_date ON loads(load_date);
CREATE NONCLUSTERED INDEX idx_fuel_trip ON fuel_purchases(trip_id);
CREATE NONCLUSTERED INDEX idx_delivery_load ON delivery_events(load_id);
 
-- DATA EXPLORATION --
-- Complete fleet and operations overview
-- To establish a baseline count of every thing in the system 
SELECT
  (SELECT COUNT(*) FROM trucks)                             AS total_trucks,
  (SELECT COUNT(*) FROM trucks WHERE status = 'Active')     AS active_trucks,
  (SELECT COUNT(*) FROM trailers)                             AS total_trailers,
  (SELECT COUNT(*) FROM trailers WHERE status = 'Active')     AS active_trailers,
  (SELECT COUNT(*) FROM drivers
   WHERE employment_status = 'Active')                      AS active_drivers,
  (SELECT COUNT(*) FROM customers
   WHERE account_status = 'Active')                         AS active_customers,
  (SELECT COUNT(*) FROM routes)                             AS total_routes,
  (SELECT COUNT(*) FROM loads)                              AS total_loads,
  (SELECT ROUND(SUM(revenue), 2) FROM loads)                AS total_revenue_usd;

  -- Load level statistical profile --
  -- This helps to understand the spread of revenue per load and identify the operating date range
SELECT
  COUNT(*)             AS total_loads,
  MIN(load_date)        AS first_load_date,
  MAX(load_date)        AS last_load_date,
  ROUND(MIN(revenue), 2)	AS min_revenue,
  ROUND(MAX(revenue), 2)     AS max_revenue,
  ROUND(AVG(revenue), 2)	  AS avg_revenue,
  ROUND(SUM(revenue), 2)     AS total_revenue
FROM loads;

-- Total number of trips
SELECT COUNT(*) AS total_trips
FROM trips;

-- Earliest and latest trip dates
SELECT
MIN(dispatch_date)		AS first_trip,
MAX(dispatch_date)		AS last_trip
FROM trips;

-- Top 10 customers by total freight revenue
-- Identify VIP accounts for relationship management and prioritised service allocation
SELECT TOP 10
  c.customer_name,
  c.customer_type,
  COUNT(l.load_id)            AS total_loads,
  ROUND(SUM(l.revenue), 2)    AS total_revenue,
  ROUND(AVG(l.revenue), 2)    AS avg_revenue_per_load
FROM loads l
JOIN customers c ON l.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.customer_type
ORDER BY total_revenue DESC;

-- Top 10 drivers ranked by average MPG (min 100 trips)
-- Most fuel-efficient drivers with a minimum 100 trips)
SELECT TOP 10
  d.first_name || ' ' || d.last_name   AS driver_name,
  d.home_terminal,
  d.years_experience,
  COUNT(t.trip_id)                     AS completed_trips,
  ROUND(AVG(t.average_mpg), 2)         AS avg_mpg,
  ROUND(SUM(t.fuel_gallons_used), 0)   AS total_gallons
FROM trips t
JOIN drivers d ON t.driver_id = d.driver_id
WHERE t.trip_status = 'Completed'
GROUP BY d.driver_id, d.driver_id, d.first_name || ' ' || d.last_name, d.home_terminal, d.years_experience
HAVING COUNT(t.trip_id) >= 100
ORDER BY avg_mpg DESC;

-- Delayed deliveries
SELECT *
FROM delivery_events
WHERE on_time_flag = '0'
ORDER BY actual_datetime DESC;

SELECT COUNT(*)  AS cnt_delayed_deliveries
FROM delivery_events
WHERE on_time_flag = '0';

-- High maintenance trucks
SELECT *
FROM maintenance_records
WHERE total_cost > 2500
ORDER BY total_cost DESC;

SELECT COUNT(*)
FROM maintenance_records
WHERE total_cost > 2500;

-- Monthly revenue with load count and average per load
-- to check monthly revenue trend from 2022 - 2024
SELECT
    FORMAT(load_date, 'yyyy-MM')      AS month,
    COUNT(*)                          AS load_count,
    ROUND(SUM(revenue), 2)            AS monthly_revenue,
    ROUND(AVG(revenue), 2)            AS avg_revenue_per_load,
    ROUND(SUM(fuel_surcharge), 2)     AS total_fuel_surcharge
FROM loads
GROUP BY FORMAT(load_date, 'yyyy-MM')
ORDER BY FORMAT(load_date, 'yyyy-MM');


-- Maintenance spending and downtime by category
-- Identify which maintenance categories consume the most budget and cause the most operational disruption
SELECT
  maintenance_type,
  COUNT(*)                            AS total_events,
  ROUND(SUM(total_cost), 2)           AS total_cost,
  ROUND(AVG(total_cost), 2)           AS avg_cost_per_event,
  ROUND(SUM(downtime_hours), 1)       AS total_downtime_hrs,
  ROUND(AVG(downtime_hours), 1)       AS avg_downtime_per_event,
  ROUND(SUM(labor_cost), 2)           AS total_labor,
  ROUND(SUM(parts_cost), 2)           AS total_parts
FROM maintenance_records
GROUP BY maintenance_type
HAVING COUNT(*) > 5
ORDER BY total_cost DESC;

-- Complete trip profile joining all core operational tables
SELECT
  t.trip_id,
  d.first_name || ' ' || d.last_name         AS driver_name,
  d.home_terminal,
  tr.unit_number                             AS truck_unit,
  tr.make                                    AS truck_make,
  trl.trailer_type,
  r.origin_city || ', ' || r.origin_state    AS origin,
  r.destination_city || ', ' || r.destination_state AS destination,
  t.actual_distance_miles,
  ROUND(t.average_mpg, 4)		AS avreage_mpg,
  ROUND(t.fuel_gallons_used, 4)		AS fuel_gallons_used,
  ROUND(l.revenue, 2)			AS revenue,
  ROUND(l.revenue / NULLIF(t.actual_distance_miles, 0), 4)
                                             AS revenue_per_mile
FROM trips t
JOIN drivers  d   ON t.driver_id  = d.driver_id
JOIN trucks   tr  ON t.truck_id   = tr.truck_id
JOIN trailers trl ON t.trailer_id = trl.trailer_id
JOIN loads    l   ON t.load_id    = l.load_id
JOIN routes   r   ON l.route_id   = r.route_id
WHERE t.trip_status = 'Completed'
ORDER BY l.revenue DESC;

-- Trips, Drivers and their trucks
SELECT
t.trip_id,
d.first_name || ' ' || d.last_name         AS driver_name,
tr.unit_number                             AS truck_unit_number,
t.actual_distance_miles
FROM trips t
JOIN drivers d ON t.driver_id = d.driver_id
JOIN trucks tr ON t.truck_id = tr.truck_id;

-- On-time delivery performance per facility
SELECT
  f.facility_name,
  f.facility_type,
  f.city || ', ' || f.state   AS location,
  COUNT(*)                    AS total_events,
  SUM(CASE WHEN de.on_time_flag = 'True' THEN 1 ELSE 0 END)  AS on_time,
  ROUND(
    SUM(CASE WHEN de.on_time_flag = 'True' THEN 1 ELSE 0 END)
    * 100.0 / COUNT(*), 1)   AS on_time_pct,
  ROUND(AVG(de.detention_minutes), 1) AS avg_detention_min
FROM delivery_events de
JOIN facilities f ON de.facility_id = f.facility_id
WHERE de.event_type = 'Delivery'
GROUP BY f.facility_name, f.facility_type,f.city || ', ' || f.state
HAVING COUNT(*) > 50
ORDER BY on_time_pct ASC;

-- Above-average drivers by revenue with efficiency context
-- Combine revenue contribution and fuel efficiency to find truly high-performing drivers
WITH driver_stats AS (
  SELECT
    d.driver_id,
    d.first_name || ' ' || d.last_name  AS driver_name,
    d.home_terminal,
    d.years_experience,
    COUNT(t.trip_id)                    AS trips_completed,
    ROUND(SUM(l.revenue), 2)            AS total_revenue,
    ROUND(AVG(t.average_mpg), 2)        AS avg_mpg,
    ROUND(SUM(t.fuel_gallons_used), 0)  AS total_gallons_used
  FROM trips t
  JOIN drivers d ON t.driver_id  = d.driver_id
  JOIN loads   l ON t.load_id    = l.load_id
  WHERE t.trip_status = 'Completed'
  GROUP BY d.driver_id,  d.first_name || ' ' || d.last_name, d.home_terminal, d.years_experience
),
fleet_averages AS (
  SELECT AVG(total_revenue) AS avg_fleet_revenue,
         AVG(avg_mpg)       AS avg_fleet_mpg
  FROM driver_stats
)
SELECT TOP 15
  ds.driver_name,
  ds.home_terminal,
  ds.years_experience,
  ds.trips_completed,
  ds.total_revenue,
  ds.avg_mpg,
  ROUND(ds.total_revenue - fa.avg_fleet_revenue, 2)
                                     AS vs_fleet_avg_revenue,
  ROUND(ds.avg_mpg - fa.avg_fleet_mpg, 3)
                                     AS vs_fleet_avg_mpg
FROM driver_stats ds, fleet_averages fa
WHERE ds.total_revenue > fa.avg_fleet_revenue
ORDER BY ds.total_revenue DESC;

-- Monthly fuel cost ratio to revenue
-- Monitor the health of fuel cost management against revenue generation over time
WITH monthly_revenue AS (
  SELECT FORMAT(load_date, 'yyyy-MM')  AS month,
         ROUND(SUM(revenue), 2)       AS total_revenue
  FROM loads
  GROUP BY FORMAT(load_date, 'yyyy-MM')
),
monthly_fuel AS (
  SELECT FORMAT(purchase_date, 'yyyy-MM')  AS month,
         ROUND(SUM(total_cost), 2)        AS fuel_spend,
         ROUND(AVG(price_per_gallon), 3)  AS avg_price_per_gallon
  FROM fuel_purchases
  GROUP BY FORMAT(purchase_date, 'yyyy-MM')
)
SELECT
  r.month,
  r.total_revenue,
  f.fuel_spend,
  ROUND(f.fuel_spend / r.total_revenue * 100, 2) AS fuel_pct_of_revenue,
  f.avg_price_per_gallon
FROM monthly_revenue r
JOIN monthly_fuel f ON r.month = f.month
ORDER BY r.month;

-- Customer revenue ranking with segment share
-- Rank customers within their segment (Dedicated, Contract, Spot) and 
-- calculate each customer's share of their segment's total revenue
SELECT 
  customer_name,
  customer_type,
  total_revenue,
  RANK() OVER (
    PARTITION BY customer_type
    ORDER BY total_revenue DESC
  )                                          AS rank_in_segment,
  ROUND(total_revenue / SUM(total_revenue) OVER (
    PARTITION BY customer_type),2) * 100     AS pct_of_segment
FROM (
  SELECT
    c.customer_name,
    c.customer_type,
    ROUND(SUM(l.revenue), 2) AS total_revenue
  FROM loads l
  JOIN customers c ON l.customer_id = c.customer_id
  GROUP BY c.customer_id, c.customer_name, c.customer_type
) AS customer_totals
ORDER BY customer_type, rank_in_segment;

-- Running mileage and rolling average MPG per truck
SELECT 
  tu.truck_id,
  t.make,
  month,
  total_miles,
  SUM(total_miles) OVER (
    PARTITION BY tu.truck_id
    ORDER BY month
  )                                         AS cumulative_miles,
  ROUND(AVG(average_mpg) OVER (
    PARTITION BY tu.truck_id
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2)                                     AS rolling_3m_avg_mpg,
  utilization_rate,
  maintenance_cost
FROM truck_utilization_metrics tu
JOIN trucks t ON tu.truck_id = t.truck_id
ORDER BY truck_id, month;

Select *
From trucks;

-- RESEARCH QUESTIONS --
-- Q1: Which routes deliver the highest revenue and are they also the most profitable?
SELECT 
  r.origin_city || ', ' || r.origin_state || ' --> '
  || r.destination_city || ', ' || r.destination_state  AS route,
  r.typical_distance_miles,
  r.base_rate_per_mile,
  COUNT(l.load_id)                  AS total_loads,
  ROUND(SUM(l.revenue), 2)          AS total_revenue,
  ROUND(AVG(l.revenue), 2)          AS avg_revenue_per_load,
  ROUND(AVG(l.revenue /
    NULLIF(r.typical_distance_miles,0)), 4) AS avg_revenue_per_mile
FROM loads l
JOIN routes r ON l.route_id = r.route_id
GROUP BY l.route_id, r.origin_city || ', ' || r.origin_state || ' --> '
  || r.destination_city || ', ' || r.destination_state, r.typical_distance_miles, r.base_rate_per_mile
HAVING COUNT(l.load_id) > 100
ORDER BY total_revenue DESC;

-- Q2: Is there a measurable on-time delivery crisis on specific routes or at specific facilities?
-- On-time delivery analysis by route
WITH route_otd AS (
  SELECT
    l.route_id,
    r.origin_city || '-->' || r.destination_city AS route_name,
    COUNT(*)                                   AS total_deliveries,
    SUM(CASE WHEN de.on_time_flag = 'True'
        THEN 1 ELSE 0 END)                     AS on_time_count,
    ROUND(SUM(CASE WHEN de.on_time_flag = 'True'
          THEN 1 ELSE 0 END) * 100.0 /
          COUNT(*), 1)                         AS otd_rate,
    ROUND(AVG(de.detention_minutes), 1)        AS avg_detention_min
  FROM delivery_events de
  JOIN loads  l ON de.load_id  = l.load_id
  JOIN routes r ON l.route_id  = r.route_id
  WHERE de.event_type = 'Delivery'
  GROUP BY l.route_id, r.origin_city || '-->' || r.destination_city
  HAVING COUNT(*) > 200
)
SELECT * 
FROM route_otd
ORDER BY otd_rate ASC;

-- Q3: Which drivers are true high performers across both revenue and fuel efficiency?
WITH driver_stats AS (
    -- Build one row per driver with all key metrics ──
    SELECT
        d.driver_id,
        d.first_name + ' ' + d.last_name              AS driver_name,
        d.home_terminal,
        d.cdl_class,
        d.years_experience,
        d.employment_status,
        DATEDIFF(YEAR, d.hire_date, GETDATE())         AS tenure_years,

        COUNT(t.trip_id)                               AS trips_completed,
        ROUND(SUM(l.revenue), 2)                       AS total_revenue,
        ROUND(AVG(l.revenue), 2)                       AS avg_revenue_per_load,
        ROUND(SUM(t.actual_distance_miles), 0)         AS total_miles,
        ROUND(AVG(t.average_mpg), 2)                   AS avg_mpg,
        ROUND(SUM(t.fuel_gallons_used), 1)             AS total_gallons_used,
        ROUND(AVG(t.idle_time_hours), 2)               AS avg_idle_hours,
        ROUND(SUM(l.revenue)
            / NULLIF(SUM(t.actual_distance_miles), 0), 4)
                                                       AS revenue_per_mile

    FROM dbo.trips t
    JOIN dbo.drivers d ON t.driver_id  = d.driver_id
    JOIN dbo.loads   l ON t.load_id    = l.load_id
    WHERE t.trip_status = 'Completed'
      AND t.driver_id   IS NOT NULL
    GROUP BY
        d.driver_id,
        d.first_name,
        d.last_name,
        d.home_terminal,
        d.cdl_class,
        d.years_experience,
        d.employment_status,
        d.hire_date
),

fleet_benchmarks AS (
    -- Calculate fleet-wide averages as benchmarks ───
    SELECT
        ROUND(AVG(total_revenue), 2)  AS fleet_avg_revenue,
        ROUND(AVG(avg_mpg), 3)        AS fleet_avg_mpg,
        ROUND(AVG(total_miles), 0)    AS fleet_avg_miles
    FROM driver_stats
)
-- Assign tiers and rank within each tier ────────────
SELECT
    -- Identifiers
    ds.driver_id,
    ds.driver_name,
    ds.home_terminal,
    ds.cdl_class,
    ds.years_experience,
    ds.tenure_years,
    ds.employment_status,
    -- Performance metrics
    ds.trips_completed,
    ds.total_revenue,
    ds.avg_revenue_per_load,
    ds.total_miles,
    ds.avg_mpg,
    ds.total_gallons_used,
    ds.revenue_per_mile,
    -- Variance vs fleet average
    ROUND(ds.total_revenue - fb.fleet_avg_revenue, 2)  AS revenue_vs_fleet_avg,
    ROUND(ds.avg_mpg       - fb.fleet_avg_mpg,     3)  AS mpg_vs_fleet_avg,
    -- Fleet benchmarks (repeated on every row for reference)
    fb.fleet_avg_revenue,
    fb.fleet_avg_mpg,
    -- Performance tier assignment
    CASE
        WHEN ds.total_revenue > fb.fleet_avg_revenue
         AND ds.avg_mpg       > fb.fleet_avg_mpg
            THEN 'Elite'
        WHEN ds.total_revenue > fb.fleet_avg_revenue
         AND ds.avg_mpg      <= fb.fleet_avg_mpg
            THEN 'High Revenue'
        WHEN ds.total_revenue <= fb.fleet_avg_revenue
         AND ds.avg_mpg       > fb.fleet_avg_mpg
            THEN 'High Efficiency'
        ELSE 'Standard'
    END                                                AS performance_tier,
    -- Rank within tier by total revenue
    RANK() OVER (
        PARTITION BY
            CASE
                WHEN ds.total_revenue > fb.fleet_avg_revenue
                 AND ds.avg_mpg       > fb.fleet_avg_mpg
                    THEN 'Elite'
                WHEN ds.total_revenue > fb.fleet_avg_revenue
                 AND ds.avg_mpg      <= fb.fleet_avg_mpg
                    THEN 'High Revenue'
                WHEN ds.total_revenue <= fb.fleet_avg_revenue
                 AND ds.avg_mpg       > fb.fleet_avg_mpg
                    THEN 'High Efficiency'
                ELSE 'Standard'
            END
        ORDER BY ds.total_revenue DESC
    )                                                  AS rank_within_tier,
    -- Overall rank across all drivers
    RANK() OVER (
        ORDER BY ds.total_revenue DESC
    )                                                  AS overall_rank
FROM driver_stats ds
CROSS JOIN fleet_benchmarks fb
ORDER BY
    performance_tier,
    rank_within_tier;

------
WITH driver_stats AS (
    SELECT
        d.driver_id,
        COUNT(t.trip_id)              AS trips_completed,
        ROUND(SUM(l.revenue), 2)      AS total_revenue,
        ROUND(AVG(t.average_mpg), 2)  AS avg_mpg
    FROM dbo.trips t
    JOIN dbo.drivers d ON t.driver_id = d.driver_id
    JOIN dbo.loads   l ON t.load_id   = l.load_id
    WHERE t.trip_status = 'Completed'
      AND t.driver_id   IS NOT NULL
    GROUP BY d.driver_id
),
fleet_benchmarks AS (
    SELECT
        AVG(total_revenue) AS fleet_avg_revenue,
        AVG(avg_mpg)       AS fleet_avg_mpg
    FROM driver_stats
),
tiered AS (
    SELECT
        ds.*,
        CASE
            WHEN ds.total_revenue > fb.fleet_avg_revenue
             AND ds.avg_mpg       > fb.fleet_avg_mpg  THEN 'Elite'
            WHEN ds.total_revenue > fb.fleet_avg_revenue
             AND ds.avg_mpg      <= fb.fleet_avg_mpg  THEN 'High Revenue'
            WHEN ds.total_revenue <= fb.fleet_avg_revenue
             AND ds.avg_mpg       > fb.fleet_avg_mpg  THEN 'High Efficiency'
            ELSE 'Standard'
        END AS performance_tier
    FROM driver_stats ds
    CROSS JOIN fleet_benchmarks fb
)
SELECT
    performance_tier,
    COUNT(*)                              AS driver_count,
    ROUND(MIN(total_revenue), 2)          AS min_revenue,
    ROUND(MAX(total_revenue), 2)          AS max_revenue,
    ROUND(AVG(total_revenue), 2)          AS avg_revenue,
    ROUND(MIN(avg_mpg), 2)                AS min_mpg,
    ROUND(MAX(avg_mpg), 2)                AS max_mpg,
    ROUND(AVG(avg_mpg), 3)                AS avg_mpg,
    ROUND(AVG(CAST(trips_completed AS FLOAT)), 1) AS avg_trips
FROM tiered
GROUP BY performance_tier
ORDER BY
    CASE performance_tier
        WHEN 'Elite'           THEN 1
        WHEN 'High Revenue'    THEN 2
        WHEN 'High Efficiency' THEN 3
        ELSE 4
    END;

-- Q4: What is the true total cost of fleet maintenance, and which trucks are money pits?
-- Per-truck maintenance cost with utilisation context
WITH truck_maint AS (
  SELECT
    truck_id,
    COUNT(*)                      AS maint_events,
    ROUND(SUM(total_cost), 2)     AS total_maint_cost,
    ROUND(SUM(downtime_hours), 1) AS total_downtime_hrs,
    ROUND(AVG(total_cost), 2)     AS avg_cost_per_event
  FROM maintenance_records
  GROUP BY truck_id
),
truck_miles AS (
  SELECT truck_id, SUM(total_miles) AS lifetime_miles,
         ROUND(AVG(utilization_rate), 3) AS avg_utilization
  FROM truck_utilization_metrics
  GROUP BY truck_id
)
SELECT 
  tm.truck_id,
  tk.make, tk.model_year,
  tm.maint_events,
  tm.total_maint_cost,
  tm.total_downtime_hrs,
  mi.lifetime_miles
FROM truck_maint tm
JOIN trucks           tk ON tm.truck_id = tk.truck_id
LEFT JOIN truck_miles mi ON tm.truck_id = mi.truck_id
ORDER BY tm.total_maint_cost DESC;


-- Q5: What is the safety risk exposure and financial liability from incidents?
-- Safety incident financial exposure by type
SELECT
  incident_type,
  COUNT(*)                                     AS total_incidents,
  SUM(CASE WHEN preventable_flag = 'True'
      THEN 1 ELSE 0 END)                       AS preventable_count,
  SUM(CASE WHEN injury_flag = 'True'
      THEN 1 ELSE 0 END)                       AS injury_incidents,
  ROUND(SUM(vehicle_damage_cost), 2)           AS total_vehicle_damage,
  ROUND(SUM(cargo_damage_cost), 2)             AS total_cargo_damage,
  ROUND(SUM(claim_amount), 2)                  AS total_claims,
  ROUND(AVG(claim_amount), 2)                  AS avg_claim_per_incident
FROM safety_incidents
GROUP BY incident_type
ORDER BY total_claims DESC;

-- Driver Performance Analysis
SELECT
 d.first_name || ' ' || d.last_name   AS driver_name,
 COUNT(t.trip_id) AS total_trips,
 AVG(t.actual_distance_miles) AS avg_distance,
 SUM(l.revenue) AS total_revenue
FROM drivers d
JOIN trips t ON d.driver_id = t.driver_id
JOIN loads l ON t.load_id = l.load_id
GROUP BY d.first_name || ' ' || d.last_name
ORDER BY total_revenue DESC;


--  ROUTE WITH THE MOST DELAYED DELIVERIES
--  Delayed = on_time_flag = 'False' on Delivery events

SELECT
    r.origin_city + ', ' + r.origin_state
        + '  -->  ' +
    r.destination_city + ', ' + r.destination_state     AS route,
    r.typical_distance_miles,
    COUNT(*)                                            AS total_deliveries,
    SUM(CASE WHEN de.on_time_flag = 'False'
        THEN 1 ELSE 0 END)                              AS delayed_deliveries,
    SUM(CASE WHEN de.on_time_flag = 'True'
        THEN 1 ELSE 0 END)                              AS on_time_deliveries,
    ROUND(
        SUM(CASE WHEN de.on_time_flag = 'False'
            THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100, 1)                            AS delay_rate_pct,
    ROUND(AVG(CASE WHEN de.on_time_flag = 'False'
        THEN CAST(de.detention_minutes AS FLOAT)
        END), 1)                                        AS avg_delay_detention_min,
    ROUND(MAX(de.detention_minutes), 0)                 AS worst_single_delay_min
FROM dbo.delivery_events de
JOIN dbo.loads  l ON de.load_id  = l.load_id
JOIN dbo.routes r ON l.route_id  = r.route_id
WHERE de.event_type = 'Delivery'
GROUP BY
    r.route_id,
    r.origin_city, r.origin_state,
    r.destination_city, r.destination_state,
    r.typical_distance_miles
ORDER BY delayed_deliveries DESC;

SELECT *
FROM trips;