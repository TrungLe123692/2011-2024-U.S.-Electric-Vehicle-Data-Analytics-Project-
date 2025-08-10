# 🚗 U.S. Electric Vehicles Data Analytics
![Language](https://img.shields.io/badge/Language-SQL-blue)
![Viz](https://img.shields.io/badge/Visualization-Tableau-purple)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)
![Data](https://img.shields.io/badge/Data-2011--2024%20US%20EV%20Registrations-orange)

---

## 1. Business Objective
- Identify **EV adoption trends** by year and state.
- Quantify **manufacturer/model dominance** and **market composition** (BEV vs PHEV).
- Benchmark **technology progress** via **average electric range**.
- Evaluate **CAFV incentive** penetration and potential policy impact.

---

## 📂 Resources

- SQL Script: [U.S. Electric Vehicles SQL Script](https://github.com/TrungLe123692/2011-2024-U.S.-Electric-Vehicle-Data-Analytics-Project-/blob/main/Electric%20Vehicle%20Analytics%20SQL%20Queries.sql)  
- Tableau Dashboard: [Electric Vehicles Tableau Dashboard](https://public.tableau.com/app/profile/trung.le6260/viz/2011-2024UnitedStatesElectricVehiclesDataAnalytics/MainDashboard)
- Dataset Source: [U.S. Electric Vehicles Dataset](https://drive.google.com/file/d/1n3zlk9F1yyNRf92z-tcCnR0tOwQ8_L0Z/view?usp=sharing)

---
  
## 2. Dataset Overview
The project uses the **2011–2024 U.S. Electric Vehicles dataset** with **150k+ registrations** and **17 columns** (one row per registered vehicle), covering make, model, model year, EV type (BEV/PHEV), electric range, state, and CAFV eligibility.

### 2.1 Data Structure (Key Columns)
| Column | Description | Type |
|---|---|---|
| `VIN (partial)` | Truncated vehicle identifier | VARCHAR |
| `County`, `City`, `State`, `Postal_Code` | Registration geography | VARCHAR |
| `Model_Year` | Model year | INT |
| `Electric_Vehicle_Type` | BEV or PHEV | VARCHAR |
| `CAFV_Eligibility` | Clean Alternative Fuel Vehicle incentive status | VARCHAR |
| `Electric_Range` | Estimated miles on electric power | INT |
| `Base_MSRP` | MSRP | FLOAT |
| `Legislative_District` | State legislative district | VARCHAR |
| `DOL_Vehicle_Id` | Internal licensing ID | INT |
| `Vehicle_Location` | Lat/Long (if available) | VARCHAR |
| `Electric_Utility` | Local electric utility | VARCHAR |
| `2020_Census_Tract` | Census tract of registration | VARCHAR |


[Project Structure](https://github.com/TrungLe123692/2011-2024-U.S.-Electric-Vehicle-Data-Analytics-Project-/blob/main/Project%20Structure)

```
us-ev-data-analytics/
│
├── data/
│   └── us_electric_vehicles_2011_2024.csv
│
├── sql/
│   └── ev_analytics_queries.sql
│
├── tableau/
│   └── EV_Analytics_Dashboard.twbx
│
├── visuals/
│   ├── vehicles_by_state.png
│   ├── vehicles_by_year.png
│   ├── top10_makes.png
│   ├── bev_phev_mix.png
│   └── cafv_eligibility_breakdown.png
│
├── output/
│   └── EV_Analytics_Report.pdf
│
├── README.md
├── .gitignore
├── LICENSE
```

---

## 3. Analysis List

> ✅ This section presents key EV market insights, including overall fleet size, range, BEV/PHEV share, trends by year and state, and composition by make, model, and CAFV eligibility.

- **3.1. ETL Process**
  - **3.1.1. Extract**  
    ▪ Obtained the raw dataset from the official *2011–2024 U.S. Electric Vehicles Dataset* source.  
    ▪ Downloaded as a CSV file containing over **150,000 EV registrations**.  
    ▪ Verified file integrity and completeness before further processing.  

  - **3.1.2. Transform**  
    ▪ Renamed columns to standardized, consistent formats for easier querying.  
    ▪ Removed duplicate entries and irrelevant rows (e.g., incomplete records).  
    ▪ Converted date fields (`Model_Year`) into proper numeric or date types.  
    ▪ Filtered dataset to include **model years from 2010 onwards** for relevant trend analysis.  
    ▪ Normalized text fields (`Make`, `Model`, `State`) for consistent grouping in SQL.  
    ▪ Validated numeric fields (`Electric_Range`, `Base_MSRP`) to ensure correct data types.  

  - **3.1.3. Load**  
    ▪ Imported the cleaned and transformed dataset into a SQL database (`ev_data` table).  
    ▪ Created indexes on key columns (`Model_Year`, `State`, `Make`, `Electric_Vehicle_Type`) to optimize query performance.  
    ▪ Verified data load by running row counts and sampling data to match the source.
    
- **3.2. Key Business Metrics**
  - **3.2.1. Total Vehicles**  
    ▪ Count all electric vehicles in the dataset to determine overall market size.  
  - **3.2.2. Average Electric Range**  
    ▪ Calculate the mean electric range to evaluate technology efficiency and battery improvements.  
  - **3.2.3. Total BEVs & % of Total**  
    ▪ Count Battery Electric Vehicles (BEVs).  
    ▪ Calculate their percentage share to assess full-electric adoption rates.  
  - **3.2.4. Total PHEVs & % of Total**  
    ▪ Count Plug-in Hybrid Electric Vehicles (PHEVs).  
    ▪ Calculate their percentage share to understand hybrid market presence.

- **3.3. Trend & Distribution**
  - **3.3.1. Vehicles by Model Year (2010+)**  
    ▪ Track vehicle registrations from 2010 onwards to observe adoption growth trends.  
  - **3.3.2. Vehicles by State**  
    ▪ Measure geographic distribution of EVs.  
    ▪ Identify top states by adoption volume for market targeting.

- **3.4. Market Composition**
  - **3.4.1. Top 10 Makes by Vehicles**  
    ▪ Rank EV manufacturers based on total vehicle registrations.  
    ▪ Identify dominant brands and market leaders.  
  - **3.4.2. Vehicles by CAFV Eligibility**  
    ▪ Break down vehicles by Clean Alternative Fuel Vehicle incentive status.  
    ▪ Evaluate the reach and effectiveness of incentive programs.  
  - **3.4.3. Vehicles by Model (with EV Type)**  
    ▪ Identify top-selling EV models.  
    ▪ Segment results by BEV vs PHEV to compare consumer preferences.

---

## 4. Methods & Code

### 4.1 Data Analyst Techniques Used (Detailed)

> ✅ This section outlines the SQL-based analytics approach: aggregating and filtering EV data since 2010, calculating KPIs (market size, mix, range), ranking top makes/models, segmenting by state and eligibility, and structuring queries to support market strategy and policy decisions.

#### 4.1.1 Data Aggregation (`COUNT`, `AVG`, `SUM`, `GROUP BY`)
- Compute **totals/averages** for core KPIs.
- Segment by **year**, **state**, **make**, **model**, **EV type**.

#### 4.1.2 KPI Calculation (Market Size, Mix, Technology)
- **Total Vehicles**, **% mix (BEV/PHEV)**, **Average Electric Range**.
- Ensured consistent decimal precision for reporting.

#### 4.1.3 Market Composition & Ranking
- **Top 10 makes/models** using `ORDER BY` + `LIMIT`.
- Contribution to total via **percentage-of-total** expressions.

#### 4.1.4 Date Handling & Filters
- **Model-year** rollups; filter years **≥ 2010** as needed.

#### 4.1.5 Incentive & Policy View
- Breakdowns by **CAFV_Eligibility** to assess incentive reach.

#### 4.1.6 Business-Oriented Query Design
- Queries framed to answer **who/where/what** (makers, states, models) and **how fast** (range progress), driving **go-to-market** and **policy** choices.

---

### 4.2 SQL Queries (with Techniques Before Each Block)

> ✅ This section provides SQL queries to measure EV market size, mix, and technology trends; rank makes, models, and states; and segment vehicles by year, geography, and incentive eligibility for strategic and policy insights.

#### 4.2.1 Average Electric Range
- **What:** Benchmark technology progress via fleetwide average range.  
- **Why:** Track improving battery performance and consumer value.  
- **Columns/Functions:** `Electric_Range`, `AVG`, `ROUND`.

```sql
SELECT ROUND(AVG(Electric_Range), 2) AS Average_Electric_Range_Miles
FROM ev_data;
```

#### 4.2.2 Total Electric Vehicles
- **What:** Size the EV market represented in the dataset.  
- **Why:** Establish baseline for mix and penetration analyses.  
- **Columns/Functions:** `COUNT(*)`.

```sql
SELECT COUNT(*) AS Total_Electric_Vehicles
FROM ev_data;
```

#### 4.2.3 Total BEVs & % of Total
- **What:** Count BEVs and compute their share of all EVs.  
- **Why:** Gauge **full-electric** dominance vs. PHEV.  
- **Columns/Functions:** `Electric_Vehicle_Type`, `COUNT(*)`, scalar subquery for total, `ROUND`.

```sql
SELECT 
  COUNT(*) AS Total_BEV_Vehicles,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 1) AS Percent_of_Total
FROM ev_data
WHERE Electric_Vehicle_Type = 'Battery Electric Vehicle (BEV)';
```

#### 4.2.4 Total PHEVs & % of Total
- **What:** Count PHEVs and compute share.  
- **Why:** Understand plug-in hybrid presence and trajectory.  
- **Columns/Functions:** `Electric_Vehicle_Type`, `COUNT(*)`, subquery, `ROUND`.

```sql
SELECT 
  COUNT(*) AS Total_PHEV_Vehicles,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 1) AS Percent_of_Total
FROM ev_data
WHERE Electric_Vehicle_Type = 'Plug-in Hybrid Electric Vehicle (PHEV)';
```

#### 4.2.5 Vehicles by Model Year
- **What:** Distribution of registrations by **Model_Year**.  
- **Why:** Identify adoption growth and product cycles.  
- **Columns/Functions:** `Model_Year`, `COUNT(*)`, `GROUP BY`, `ORDER BY`.

```sql
SELECT Model_Year, COUNT(*) AS Vehicles_Registered
FROM ev_data
GROUP BY Model_Year
ORDER BY Model_Year ASC;
```

#### 4.2.6 Vehicles by State
- **What:** Geographic distribution by **State**.  
- **Why:** Prioritize infrastructure, sales, and policy engagement.  
- **Columns/Functions:** `State`, `COUNT(*)`, `GROUP BY`, `ORDER BY`.

```sql
SELECT State, COUNT(*) AS Total_Registered
FROM ev_data
GROUP BY State
ORDER BY Total_Registered DESC;
```

#### 4.2.7 Top 10 Makes by Vehicles
- **What:** Rank manufacturers by registration count and share.  
- **Why:** Understand competitive landscape and brand leadership.  
- **Columns/Functions:** `Make`, `COUNT(*)`, percent-of-total, `ORDER BY`, `LIMIT`.

```sql
SELECT 
  Make,
  COUNT(*) AS Vehicle_Count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 2) AS Percent_of_Total
FROM ev_data
GROUP BY Make
ORDER BY Vehicle_Count DESC
LIMIT 10;
```

#### 4.2.8 Vehicles by CAFV Eligibility
- **What:** Break down fleet by **CAFV_Eligibility** status.  
- **Why:** Assess incentive exposure and potential policy impact.  
- **Columns/Functions:** `CAFV_Eligibility`, `COUNT(*)`, percent-of-total, `GROUP BY`.

```sql
SELECT 
  CAFV_Eligibility AS CAFV_Status,
  COUNT(*) AS Vehicle_Count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 2) AS Percent
FROM ev_data
GROUP BY CAFV_Eligibility
ORDER BY Vehicle_Count DESC;
```

#### 4.2.9 Vehicles by Model × Make × EV Type
- **What:** Identify dominant **models** within **makes** and **EV types**.  
- **Why:** Pinpoint product winners and feature sets consumers prefer.  
- **Columns/Functions:** `Model`, `Make`, `Electric_Vehicle_Type`, `COUNT(*)`, percent-of-total, `GROUP BY`, `ORDER BY`.

```sql
SELECT 
  Model,
  Make,
  Electric_Vehicle_Type AS EV_Type,
  COUNT(*) AS Total_Vehicles,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 2) AS Percent_of_Total
FROM ev_data
GROUP BY Model, Make, EV_Type
ORDER BY Total_Vehicles DESC;
```

---

## 5. Business Impacts
- **Market Strategy Optimization**
  - Align production, distribution, and marketing with **state** and **make/model** demand patterns.
- **Incentive Effectiveness**
  - Use **CAFV** shares to evaluate policy reach and refine subsidy targeting.
- **Technology Benchmarking**
  - Track **average range** improvements to guide **R&D** and messaging.
- **Regional Deployment Planning**
  - Prioritize **charging** and **dealer** expansion in high-growth geographies.
- **Consumer & Competitor Insights**
  - Focus on **top models/makes** for partnerships, inventory, and promos.
