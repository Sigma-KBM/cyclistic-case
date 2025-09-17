CREATE OR REPLACE TABLE `cyclistic-bikes-470901.Cyclistic_Bike_Clean.stg_trips` AS
SELECT
  CAST(trip_id AS STRING)        AS trip_id,
  CAST(start_time AS STRING)     AS start_time,
  CAST(end_time   AS STRING)     AS end_time,
  CAST(bikeid AS STRING)         AS bikeid,
  CAST(from_station_id AS STRING) AS from_station_id,
  TRIM(from_station_name)        AS from_station_name,
  CAST(to_station_id   AS STRING) AS to_station_id,
  TRIM(to_station_name)          AS to_station_name,
  LOWER(TRIM(CAST(usertype AS STRING))) AS usertype,
  CAST(gender AS STRING)         AS gender,
  CAST(birthyear AS INT64)       AS birthyear
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_2019_q1_mapped`


UNION ALL


SELECT
  CAST(trip_id AS STRING),
  CAST(start_time AS STRING),
  CAST(end_time   AS STRING),
  CAST(bikeid AS STRING),
  CAST(from_station_id AS STRING),
  TRIM(from_station_name),
  CAST(to_station_id   AS STRING),
  TRIM(to_station_name),
  LOWER(TRIM(CAST(usertype AS STRING))),
  CAST(gender AS STRING),
  CAST(birthyear AS INT64)
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_2020_q1_mapped`;
