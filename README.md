# Project Overview
  This project analyzes customer behavior and revenue drivers in an e-commerce dataset. The goal is to identify key factors that influence purchasing decisions, conversion efficiency, and overall revenue performance. The analysis combines SQL for data processing with Excel for interactive dashboard visualization.

# Project Structure
  dataset.csv - raw dataset used for analysis
  
  analysis.sql - SQL scripts for data cleaning, transformation, and analysis
  
  dashboard.xlsx - final dashboard and pivot tables
  
  README.md - project description and insights

# Tools Used
  SQL - data cleaning, feature engineering, aggregation
  
  Microsoft Excel - dashboard creation, pivot tables, slicers

# Data Preparation (SQL)
  - The dataset was cleaned and transformed using SQL:  
  - Fixed errors in column names  
  - Checked for duplicate records  
  - Validated data for incorrect or inconsistent values  
  - Handled division by zero using NULLIF()  
  - Created new analytical features:  
      * Revenue = product_price × purchases  
      * Conversion Rate = purchases / clicks  
      * Price Brackets (Low / Medium / High)

# Dashboard Description
The Excel dashboard includes interactive filters:
  - Gender  
  - Season  
  - Terrain  
  - Holiday

Key metrics visualized:  
  - Revenue by Season  
  - Products Purchased by Season  
  - Avg Median Price by Gender  
  - Conversion Rate by Price Range  
  - Top Brands by Revenue  
  - Probability of Recommendation by Price Range

# Key Insights
1.	Winter season generates the highest revenue, driven by strong demand in mountainous regions.
2.	Product demand peaks in summer and winter, with different terrains (plains and mountains) dominating each season.
3.	Low-priced products have the highest conversion rate, indicating strong purchase likelihood.
4.	Higher-priced products receive better ratings, suggesting perceived quality increases with price.
5.	Revenue is concentrated among a small number of top brands, indicating strong brand influence.
6.	Conversion rate decreases as price increases, showing clear customer price sensitivity.
7.	Recommendation probability correlates with higher revenue, suggesting customer satisfaction impacts sales performance.

# Business Recommendations
1.	Focus marketing efforts on high-performing seasons (winter and summer)
2.	Promote mid-range products to balance conversion and revenue
3.	Invest in top-performing brands to maximize returns
4.	Improve quality of low-priced products to increase recommendation rates
  Extract actionable insights from data


    
