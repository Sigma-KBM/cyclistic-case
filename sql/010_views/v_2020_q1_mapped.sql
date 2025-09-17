CREATE OR REPLACE VIEW `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_2020_q1_mapped` AS
SELECT
  CAST(ride_id AS STRING)                        AS trip_id,
  CAST(started_at AS STRING)                     AS start_time,
  CAST(ended_at   AS STRING)                     AS end_time,
  CAST(NULL AS STRING)                           AS bikeid,
  CAST(start_station_id AS STRING)               AS from_station_id,
  TRIM(start_station_name)                       AS from_station_name,
  CAST(end_station_id   AS STRING)               AS to_station_id,
  TRIM(end_station_name)                         AS to_station_name,
  LOWER(TRIM(CAST(member_casual AS STRING)))     AS usertype,
  CAST(NULL AS STRING)                           AS gender,
  CAST(NULL AS INT64)                            AS birthyear
FROM `cyclistic-bikes-470901.Cyclistic_Bike.2020_Q1`;
