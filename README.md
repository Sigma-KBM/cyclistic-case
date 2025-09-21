# Cyclistic Case Study — From Casuals to Members


**Goal:**  
Determine how annual members and casual riders use Cyclistic bikes differently to inform a conversion strategy for the first quarter of the year.


---


## 📊 Business Context
Cyclistic, a Chicago-based bike-share company, wants to increase annual memberships.  
The marketing team believes that converting casual riders into members is key to growth.  
This project explores how members and casual riders differ in their usage patterns, and translates those insights into actionable recommendations.


---


## 🛠️ Tech Stack
- **Google BigQuery** — SQL data cleaning, transformation, and feature engineering  
- **Tableau Public** — interactive dashboards and data visualizations  
- **GitHub** — version control and workflow documentation  


---


## 📂 Repository Structure

- `sql/010_views/` → unified schemas and aggregated views  
- `sql/020_pipeline/` → data cleaning and transformation pipeline  
- `scripts/run_pipeline.sh` → script to recreate the workflow in BigQuery  
- `schemas/` → JSON schema definitions of final tables  
- `exports/` → sample CSVs (small extracts only)  


---


## 🔄 Data Workflow
1. **Data Cleaning (BigQuery)**  
   - Unified 2019 and 2020 schemas (trip_id, timestamps, rider type, station info).  
   - Removed duplicates and invalid trips.  
   - Filtered rides with duration < 1 min or > 24 hours.
  
```mermaid
flowchart TD
    A[2019_Q1 Raw] --> B[v_2019_q1_mapped];
    C[2020_Q1 Raw] --> D[v_2020_q1_mapped];
    B --> E[stg_trips (union)];
    D --> E[stg_trips (union)];
    E --> F[stg_trips_dedup];
    F --> G[stg_trips_filtered];
    G --> H[trips_clean];
    H --> I[v_daily_summary];
    H --> J[v_dow_duration];
    H --> K[v_heatmap_hour_dow];
    H --> L[v_top_start_stations / v_top_end_stations];
    H --> M[v_monthly_trend];
```

2. **Feature Engineering**  
   - Ride length (seconds/minutes).  
   - Date features: day of week, month, season, weekend flag, start hour.  


3. **Aggregations / Views**  
   - Daily summary (rides, median/avg duration).  
   - Hour × day heatmap.  
   - Duration by weekday.  
   - Top start/end stations.  
   - Monthly trend.  


4. **Visualization**  
   - Built in Tableau Public for interactive exploration.  


---


## 📈 Key Insights
- **Daily trends:** Members ride ~10× more than casuals, consistent across weekdays. Casuals spike on weekends.  
- **Ride duration:** Members average ~8 minutes; casuals ~20+, especially longer on Sundays.  
- **Heatmap:** Members peak at 8am/5pm weekdays (commuting). Casuals peak afternoons on weekends (leisure).  
- **Stations:** Members cluster near downtown transit hubs. Casuals around tourist hotspots (Navy Pier, Millennium Park).  
- **Monthly:** Members steady (~119k trips/month). Casuals seasonal (peaks in spring/summer, up to 24k).  


---


## 💡 Recommendations
1. **Weekend Promotions:** Discounted passes and family bundles for leisure riders.  
2. **Commuter Incentives:** Perks for annual members during rush hours (bonus minutes, docking priority).  
3. **Seasonal Campaigns:** “Join before summer” ads to capture casuals before ridership peaks.  
4. **Station-Based Marketing:** Target casual riders at tourist hotspots with QR codes and kiosk promotions.  


---


## 🔗 Deliverables
- 📊 [Interactive Dashboard (Tableau Public)](https://public.tableau.com/views/CommutetoLeisureATaleofCyclisticRiders/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
- 💻 [Blog Article (Behind the Numbers)](https://btninsights.blogspot.com/2025/09/from-casual-to-members-what-data-tells.html)  
- 📄 [Short Report (PDF with visuals)](https://drive.google.com/file/d/1AtTrose-DIJj7OZdQ80ujl7ZQukk20HU/view?usp=sharing)  


---


## 🚀 How to Reproduce
1. Clone this repository:
   ```bash
   git clone https://github.com/Sigma-KBM/cyclistic-case.git
   cd cyclistic-case
