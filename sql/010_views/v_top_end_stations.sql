CREATE OR REPLACE VIEW `cyclistic-bikes-470901.Cyclistic_Bike_Clean.v_top_end_stations` AS
SELECT
  rider_type,
  to_station_id,
  to_station_name,
  COUNT(*) AS ends
FROM `cyclistic-bikes-470901.Cyclistic_Bike_Clean.trips_clean`
GROUP BY rider_type, to_station_id, to_station_name;
