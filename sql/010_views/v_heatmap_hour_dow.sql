CREATE OR REPLACE VIEW `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_heatmap_hour_dow` AS
SELECT
  rider_type,
  EXTRACT(DAYOFWEEK FROM start_time_ts) AS dow,       -- 1=Sun..7=Sat
  EXTRACT(HOUR       FROM start_time_ts) AS start_hour -- 0..23
  ,
  COUNT(*) AS trips
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.trips_clean`
GROUP BY rider_type, dow, start_hour;
