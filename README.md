# Superstore Sale
# RFM (Recency, Frequency, Monetary) Analysis for Customer Segmentation

## Overview
The objective of this project is to implement **RFM (Recency, Frequency, Monetary)** analysis for customer segmentation. This analysis helps businesses classify customers based on their purchase behavior to tailor marketing strategies and improve customer retention.

### RFM Breakdown
- **Recency (R)**: How recently a customer made a purchase.
- **Frequency (F)**: How often the customer makes a purchase.
- **Monetary (M)**: How much the customer spends.

## Goals
- To segment customers based on their RFM values.
- To help businesses identify valuable customers for targeted marketing.
- To improve customer retention by understanding purchasing patterns.

## Files:

## Methodology:
1. Renaming Columns: The original dataset columns were renamed to more meaningful and consistent names using ALTER TABLE commands.
2. Handling Missing Values: The dataset was checked for any missing (NULL) values in key columns such as Order_ID, Customer_ID, Order_Date, etc. Since no missing values were found, no further action was necessary.
3. Handling Duplicate Rows: The dataset was examined for duplicate rows using GROUP BY to ensure data quality.
4. Date Formatting: The Order_Date was converted to a standardized date format using STR_TO_DATE() to ensure consistency.

## EDA Analysis
## Sales and Profit Analysis

### Overview  
The total sales and profit figures provide insights into the overall financial performance of the business.

| Metric        | Value       |
|--------------|------------|
| **Total Sales**  | $8,697,976.17 |
| **Total Profit** | $1,250,195.99 |

### Interpretation  
- The total revenue generated is **$8.69M**, with a net profit of **$1.25M**.
- The profit margin is approximately **14.38%** (**Total Profit / Total Sales**).
- While the business is profitable, further investigation is required to identify top-performing customer segments, products, and regions contributing to revenue and profitability.




