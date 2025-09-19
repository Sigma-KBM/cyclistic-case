CREATE OR REPLACE VIEW `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_dow_duration` AS
SELECT
  rider_type,
  EXTRACT(DAYOFWEEK FROM start_time_ts) AS dow,
  COUNT(*) AS trips,
  APPROX_QUANTILES(ride_length_min, 100)[OFFSET(50)] AS median_min,
  APPROX_QUANTILES(ride_length_min, 100)[OFFSET(90)] AS p90_min
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.trips_clean`
GROUP BY rider_type, dow;
