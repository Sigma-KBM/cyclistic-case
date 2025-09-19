CREATE OR REPLACE VIEW `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_top_start_stations` AS
SELECT
  rider_type,
  from_station_id,
  from_station_name,
  COUNT(*) AS starts
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.trips_clean`
GROUP BY rider_type, from_station_id, from_station_name;
