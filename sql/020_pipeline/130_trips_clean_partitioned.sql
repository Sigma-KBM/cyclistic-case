CREATE OR REPLACE TABLE `cyclistic-bikes-470901.Cyclistic_Bike_Clean.trips_clean`
PARTITION BY DATE(start_time_ts)
CLUSTER BY rider_type, from_station_id, to_station_id AS
SELECT
  trip_id,
  SAFE_CAST(start_time AS TIMESTAMP) AS start_time_ts,
  SAFE_CAST(end_time   AS TIMESTAMP) AS end_time_ts,
  bikeid,
  from_station_id, from_station_name,
  to_station_id,   to_station_name,
  LOWER(usertype)  AS rider_type,
  gender,
  birthyear,
  TIMESTAMP_DIFF(SAFE_CAST(end_time   AS TIMESTAMP),
                 SAFE_CAST(start_time AS TIMESTAMP), SECOND) AS ride_length_sec,
  TIMESTAMP_DIFF(SAFE_CAST(end_time   AS TIMESTAMP),
                 SAFE_CAST(start_time AS TIMESTAMP), MINUTE) AS ride_length_min
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.stg_trips_filtered`;
