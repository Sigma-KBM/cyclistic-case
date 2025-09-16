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
- 📊 [Interactive Dashboard (Tableau Public)](URL-YOUR-TABLEAU)  
- 💻 [Blog Article (Behind the Numbers)](URL-YOUR-BLOG)  
- 📄 [Short Report (PDF with visuals)](URL-YOUR-PDF)  


---


## 🚀 How to Reproduce
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/cyclistic-case.git
   cd cyclistic-case
