CREATE OR REPLACE VIEW `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_daily_summary` AS
SELECT
  DATE(start_time_ts) AS ride_date,
  rider_type,
  COUNT(*) AS trips,
  APPROX_QUANTILES(ride_length_min, 100)[OFFSET(50)] AS median_min,
  AVG(ride_length_min) AS avg_min
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.trips_clean`
GROUP BY 1,2;
