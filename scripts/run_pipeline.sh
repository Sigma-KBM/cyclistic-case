#!/usr/bin/env bash
set -euo pipefail


# Set your GCP Project ID
PROJECT="cyclistic-bikes-470901"


echo "Using project: $PROJECT"


# Step 1: Apply all view definitions (sql/010_views/*.sql)
for f in sql/010_views/*.sql; do
  echo "Applying view: $f"
  bq --location=US query --project_id="${PROJECT}" --use_legacy_sql=false < "$f"
done


# Step 2: Apply all pipeline steps (sql/020_pipeline/*.sql)
for f in sql/020_pipeline/*.sql; do
  echo "Applying pipeline step: $f"
  bq --location=US query --project_id="${PROJECT}" --use_legacy_sql=false < "$f"
done


echo "Pipeline finished successfully!"

add run_pipeline.sh script
