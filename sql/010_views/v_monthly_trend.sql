CREATE OR REPLACE VIEW `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_monthly_trend` AS
SELECT
  EXTRACT(YEAR  FROM start_time_ts) AS yr,
  EXTRACT(MONTH FROM start_time_ts) AS mo,
  rider_type,
  COUNT(*) AS trips,
  APPROX_QUANTILES(ride_length_min, 100)[OFFSET(50)] AS median_min
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.trips_clean`
GROUP BY yr, mo, rider_type;
