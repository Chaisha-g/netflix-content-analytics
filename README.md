# Netflix Content Analytics | SQL, Excel & Tableau

### End-to-End Data Analytics Portfolio Project

## Project Overview

Analyzed **8,784 Netflix titles** to explore content distribution, growth trends, audience ratings, popular genres, and geographic patterns.

This project demonstrates an end-to-end data analytics workflow using **SQL for data analysis, Excel for data preparation, and Tableau for interactive visualization**.

**Tools:** SQL | Excel | Tableau | GitHub

**Dataset:** 8,784 Netflix titles

**Project Type:** Data Cleaning, Exploratory Data Analysis (EDA), Business Intelligence & Data Visualization

---

## Interactive Tableau Dashboard

### [CLICK HERE TO EXPLORE THE LIVE DASHBOARD](https://public.tableau.com/app/profile/chaisha.gallage/viz/NetflixContentAnalyticsPortfolioProject/Dashboard1)

The interactive Tableau dashboard includes five visualizations:

1. Movies vs. TV Shows
2. Content Added Over Time
3. Top 10 Primary-Listed Countries
4. Netflix Content Ratings
5. Top 10 Primary Genres

The dashboard allows users to explore Netflix's content catalog through interactive visualizations.

---

## Business Questions

This project addresses five key analytical questions:

1. What percentage of Netflix's catalog consists of movies versus TV shows?
2. How have Netflix content additions changed over time?
3. Which countries contribute the most titles?
4. What are the most common content ratings?
5. Which genres dominate Netflix's catalog?

---

## Data Analytics Workflow

### 1. Data Import | SQL

Imported the Netflix dataset into a relational database for analysis.

**SQL Script:** `01_data_import.sql`

### 2. Data Profiling | SQL

Examined the dataset to understand its structure, completeness, and potential data quality issues.

**SQL Script:** `02_data_profiling.sql`

### 3. Data Cleaning | SQL & Excel

Prepared the dataset for analysis by reviewing missing values, inconsistencies, and formatting.

**SQL Script:** `03_data_cleaning.sql`

**Cleaned Dataset:** `netflix_titles_clean final.csv`

### 4. Exploratory Data Analysis | SQL

Analyzed content types, geographic distribution, ratings, genres, and content addition trends.

**SQL Script:** `04_exploratory_analysis.sql`

### 5. Business Insights | SQL

Developed analytical queries to summarize content distribution and identify meaningful patterns.

**SQL Script:** `05_business_insights.sql`

### 6. Interactive Visualization | Tableau

Developed a Tableau dashboard containing five visualizations to communicate key findings.

---

## Key Findings

### 1. Movies Dominate Netflix's Catalog

| Content Type | Number of Titles | Percentage |
|---|---:|---:|
| Movies | 6,113 | 69.6% |
| TV Shows | 2,671 | 30.4% |
| **Total** | **8,784** | **100%** |

**Insight:** Approximately 7 out of every 10 titles in the dataset are movies.

### 2. Content Additions Peaked in 2019

Netflix content additions increased substantially between 2015 and 2019.

The dataset shows approximately **2,000 titles added in 2019**, followed by a decline through 2021.

**Insight:** The analyzed catalog experienced its highest annual addition count in 2019.

### 3. United States Leads in Primary-Listed Country

| Country | Number of Titles |
|---|---:|
| United States | 3,197 |
| India | 1,008 |
| United Kingdom | 628 |
| Canada | 271 |
| Japan | 259 |

**Insight:** The United States has the largest number of titles when counting the first country listed for each record.

### 4. Mature Audience Ratings Are Common

| Rating | Number of Titles |
|---|---:|
| TV-MA | 3,192 |
| TV-14 | 2,157 |
| TV-PG | 863 |
| R | 796 |

**Insight:** TV-MA and TV-14 are the two most common content ratings.

### 5. Dramas and Comedies Lead Genre Distribution

| Primary Genre | Number of Titles |
|---|---:|
| Dramas | 1,594 |
| Comedies | 1,205 |
| Action & Adventure | 857 |
| Documentaries | 827 |
| International TV Shows | 772 |

**Insight:** Dramas and Comedies are the most frequently occurring primary genres.

---

## Repository Structure

| File | Description |
|---|---|
| `01_data_import.sql` | Data importing |
| `02_data_profiling.sql` | Data profiling and quality assessment |
| `03_data_cleaning.sql` | SQL data cleaning |
| `04_exploratory_analysis.sql` | Exploratory data analysis |
| `05_business_insights.sql` | Business insights and analytical queries |
| `netflix_titles_clean final.csv` | Cleaned Netflix dataset |
| `README.md` | Project documentation |

---

## Technical Skills Demonstrated

**SQL**
- Data importing and querying
- Data profiling and quality assessment
- Data cleaning
- Aggregations and exploratory analysis
- Business-focused analytical queries

**Excel**
- Dataset preparation
- Data organization
- Preparing data for visualization

**Tableau**
- Interactive dashboard development
- Calculated fields
- Data visualization
- Dashboard filtering
- Communicating analytical findings

**GitHub**
- Version control
- Project documentation
- Portfolio presentation

---

## Project Limitations

- This project analyzes a historical Netflix dataset, not Netflix's current catalog.
- Country analysis uses the first listed country for each title.
- Genre analysis uses the first listed genre for each title.
- Content addition dates represent when titles were added to Netflix, not their original release dates.
- Findings describe patterns within the available dataset and should not be interpreted as Netflix's current business performance.

---

## Conclusion

This project demonstrates a structured, end-to-end data analytics workflow, transforming Netflix content data into actionable insights using SQL, Excel, and Tableau.

The analysis highlights content distribution, geographic patterns, audience ratings, genre popularity, and historical content addition trends.

**[Explore the Interactive Tableau Dashboard](https://public.tableau.com/app/profile/chaisha.gallage/viz/NetflixContentAnalyticsPortfolioProject/Dashboard1)**
