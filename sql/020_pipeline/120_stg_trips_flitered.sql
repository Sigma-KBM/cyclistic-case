CREATE OR REPLACE TABLE `cyclistic-bikes-470901.Cyclistic_Bike_Clean.stg_trips_filtered` AS
SELECT *
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.stg_trips_dedup`
WHERE SAFE_CAST(start_time AS TIMESTAMP) IS NOT NULL
  AND SAFE_CAST(end_time   AS TIMESTAMP) IS NOT NULL
  AND TIMESTAMP_DIFF(
        SAFE_CAST(end_time AS TIMESTAMP),
        SAFE_CAST(start_time AS TIMESTAMP),
        MINUTE
      ) BETWEEN 1 AND 1440
  AND from_station_id IS NOT NULL
  AND to_station_id   IS NOT NULL;
