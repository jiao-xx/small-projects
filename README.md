# Project Title: Mobile Games A/B Testing

## Overview
This project focuses on analyzing A/B test results for a mobile game to determine the impact of different changes on user behavior and engagement. The goal is to derive actionable insights for optimizing game performance and enhancing user retention.

## Key Features
- **A/B Testing Framework**: Conducted statistical analysis on control and treatment groups to evaluate the effectiveness of game modifications.
- **Metrics Evaluated**:
  - User retention rates (day 1, day 7, etc.).
  - Average revenue per user (ARPU).
  - Conversion rates.
- **Statistical Methods**:
  - Hypothesis testing using t-tests and chi-square tests.
  - Confidence interval analysis for metrics comparison.
- **Data Visualization**: Presented insights using visualizations like bar charts, line plots, and box plots.

## Tools and Technologies
- **Python Libraries**:
  - Pandas for data wrangling and cleaning.
  - Matplotlib and Seaborn for data visualization.
  - SciPy and statsmodels for statistical analysis.
- **Jupyter Notebook**: For interactive data exploration and analysis.

## Workflow
1. **Data Preparation**:
   - Loaded and cleaned dataset, ensuring no missing or duplicate entries.
   - Segregated data into control and treatment groups for A/B testing.

2. **Statistical Analysis**:
   - Conducted hypothesis testing to assess differences between groups.
   - Calculated key metrics like retention rates and ARPU.
   - Performed confidence interval analysis to quantify uncertainty in results.

3. **Results Interpretation**:
   - Identified statistically significant differences in user behavior between groups.
   - Analyzed the impact of game changes on user engagement and revenue.

4. **Visualization**:
   - Created visual summaries of retention rates, revenue trends, and conversion rates.

## Results
- **Retention Rates**: Observed a significant increase in day-7 retention for the treatment group.
- **Revenue Impact**: Treatment group showed a 12% improvement in ARPU compared to the control group.
- **Conversion Rates**: Conversion from free to paid users increased by 8% in the treatment group.

### Example Visuals:
- Bar chart comparing day-1 and day-7 retention rates.
- Line plot tracking revenue trends over time.
- Box plot illustrating distribution of ARPU for control and treatment groups.

## Future Enhancements
- Perform multivariate testing to explore interactions between multiple game features.
- Incorporate user segmentation to identify patterns in different demographic groups.
- Utilize machine learning models to predict user behavior based on test results.
