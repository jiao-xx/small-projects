# Project Title: COVID-19 Dashboard using SQL

## Overview
This project focuses on building a COVID-19 analytics dashboard by leveraging SQL for data preparation and analysis. The dashboard visualizes key metrics related to COVID-19 cases, recoveries, and fatalities, providing actionable insights into pandemic trends and impacts.

## Key Features
- **Data Preparation**:
  - Preprocessed raw COVID-19 datasets using SQL scripts to clean and organize data for analysis.
  - Addressed missing values and standardized column formats.
- **Exploratory Data Analysis**:
  - Conducted in-depth analysis to identify trends in COVID-19 metrics such as daily cases, recoveries, and deaths.
  - Used SQL for statistical aggregations, trend analysis, and anomaly detection.
- **Dashboard Development**:
  - Designed an interactive dashboard to visualize key COVID-19 metrics.
  - Metrics included daily and cumulative cases, recovery rates, and region-wise comparisons.

## Tools and Technologies
- **SQL Scripts**:
  - `Covid_Prep.sql`: Handles data cleaning and preparation.
  - `Covid_DEA.sql`: Performs exploratory data analysis and statistical summarization.
- **Dashboard Tool**: Looker Studio for creating an interactive and visually appealing dashboard.
- **Data Sources**: Publicly available COVID-19 datasets.

## Workflow
1. **Data Cleaning and Preparation**:
   - Loaded raw data into a SQL database.
   - Used `Covid_Prep.sql` to clean, normalize, and structure the data.

2. **Exploratory Data Analysis**:
   - Executed queries from `Covid_DEA.sql` to extract meaningful insights.
   - Analyzed daily trends, regional patterns, and overall progression of the pandemic.

3. **Dashboard Creation**:
   - Imported cleaned and analyzed data into Looker Studio.
   - Built charts and graphs to visualize trends and comparisons, including:
     - Line graphs for daily and cumulative cases.
     - Bar charts for region-wise statistics.
     - Pie charts for recovery and fatality rates.
     - [Dashboard](https://public.tableau.com/app/profile/lora.jiao/viz/Covid_Analysis_16916118705070/Dashboard1)

## Results
- **Insights Gained**:
  - Visualized trends in daily COVID-19 cases and recoveries.
  - Identified regions with the highest and lowest recovery and fatality rates.
  - Provided clear metrics to understand pandemic progression over time.

### Example Visuals:
- Line graph showing daily cases and recoveries.
- Bar chart comparing regional statistics.
- Pie chart highlighting recovery vs. fatality rates.

## Future Enhancements
- Incorporate vaccination data to track progress against the pandemic.
- Add predictive modeling to forecast future trends.
- Enhance dashboard interactivity with drill-down features.
