CREATE OR REPLACE TABLE `cyclistic-bikes-470901.Cyclistic_Bike_Clean.stg_trips_dedup` AS
WITH ranked AS (
  SELECT t.*,
         ROW_NUMBER() OVER (PARTITION BY trip_id ORDER BY start_time) AS rn
  FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.stg_trips` t
)
SELECT * EXCEPT(rn)
FROM ranked
WHERE rn = 1;
