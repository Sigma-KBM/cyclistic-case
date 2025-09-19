#!/usr/bin/env bash
set -euo pipefail


PROJECT="cyclistic-bikes-470901"
echo "Using project: $PROJECT"


run() {
  local file="$1"
  echo ">> Applying: $file"
  bq --location=US query --project_id="${PROJECT}" --use_legacy_sql=false < "$file"
}


# Ensure CLEAN dataset exists (no-op if already there)
bq --location=US mk --dataset --if_not_exists "${PROJECT}:Cyclistic_Bike_Clean" >/dev/null 2>&1 || true


# 010 - mapped views
run sql/010_views/v_2019_q1_mapped.sql
run sql/010_views/v_2020_q1_mapped.sql


# 020 - pipeline (build base → filtered → trips_clean)
run sql/020_pipeline/100_stg_trips_union.sql
run sql/020_pipeline/110_stg_trips_dedup.sql
run sql/020_pipeline/120_stg_trips_filtered.sql


# Drop trips_clean to allow partition spec changes safely
bq --location=US rm -f -t ${PROJECT}:Cyclistic_Bike_Clean.trips_clean || true


# Recreate final table with start_time_ts partitioning
run sql/020_pipeline/130_trips_clean_partitioned.sql


# Analytics view(s) that depend on trips_clean
run sql/010_views/v_daily_summary.sql

# more analytics views
run sql/010_views/v_heatmap_hour_dow.sql
run sql/010_views/v_dow_duration.sql
run sql/010_views/v_top_start_stations.sql
run sql/010_views/v_top_end_stations.sql
run sql/010_views/v_monthly_trend.sql


echo "Pipeline finished successfully!"
