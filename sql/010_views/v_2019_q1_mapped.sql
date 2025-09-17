CREATE OR REPLACE VIEW `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_2019_q1_mapped` AS
SELECT
  CAST(trip_id AS STRING)                        AS trip_id,
  CAST(start_time AS STRING)                     AS start_time,
  CAST(end_time   AS STRING)                     AS end_time,
  CAST(bikeid AS STRING)                         AS bikeid,
  CAST(from_station_id AS STRING)                AS from_station_id,
  TRIM(from_station_name)                        AS from_station_name,
  CAST(to_station_id   AS STRING)                AS to_station_id,
  TRIM(to_station_name)                          AS to_station_name,
  LOWER(TRIM(CAST(usertype AS STRING)))          AS usertype,
  CAST(gender AS STRING)                         AS gender,
  CAST(birthyear AS INT64)                       AS birthyear
FROM `cyclistic-bikes-470901.Cyclistic_Bike.2019_Q1`;
