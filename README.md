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
### Sales and Profit Analysis
  
The total sales and profit figures provide insights into the overall financial performance of the business.

| Metric        | Value       |
|--------------|------------|
| **Total Sales**  | $8,697,976.17 |
| **Total Profit** | $1,250,195.99 |

### Interpretation  
- The total revenue generated is **$8.69M**, with a net profit of **$1.25M**.
- The profit margin is approximately **14.38%** (**Total Profit / Total Sales**).
- While the business is profitable, further investigation is required to identify top-performing customer segments, products, and regions contributing to revenue and profitability.

### Top 10 Customers by Total Sales   
Identifying top customers helps understand key revenue contributors and informs customer retention strategies.  

### Top 10 Customers  

| Customer Name           | Total Sales ($) |
|-------------------------|----------------|
| **Gordon Brandt**       | 123,745.62      |
| **Glen Caldwell**       | 89,269.70       |
| **Rosemary O'Brien**    | 86,540.75       |
| **Leigh Burnette Hurley** | 83,651.70    |
| **Kristine Connolly**   | 81,296.39       |
| **Nina Horne Kelly**    | 78,243.60       |
| **Neal Wolfe**          | 69,118.00       |
| **Priscilla Kane**      | 61,610.60       |
| **Dana Teague**         | 61,298.98       |
| **Amanda Kay**          | 55,793.40       |

### Interpretation  
- **Gordon Brandt** leads with the highest total sales of **$123.7K**.  

### 🏢 Region-wise Sales Analysis  
  
Analyzing total sales by region helps identify high-performing areas and potential opportunities for growth.  

### Sales by Region  

| Region   | Total Sales ($) |
|----------|----------------|
| **Central** | 2,462,501.96 |
| **West**    | 2,344,459.07 |
| **East**    | 2,342,683.39 |
| **South**   | 1,548,331.75 |

### Interpretation  
- **Central region** leads in total sales with **$2.46M**, followed closely by **West** and **East**.  
- **South region** lags behind, indicating possible opportunities to improve marketing efforts or address operational challenges.  
- Further investigation into customer behavior and product performance by region could provide valuable insights.

### 📦 Most Frequently Ordered Products  
  
Identifying the most frequently ordered products helps in inventory management and demand forecasting. Below is a list of the top 10 most ordered products.  

### Top 10 Frequently Ordered Products  

| Product Name | Order Count |
|-------------|-------------|
| **Global High-Back Leather Tilter, Burgundy** | 27 |
| **Bevis 36 x 72 Conference Tables** | 26 |
| **Master Giant Foot® Doorstop, Safety Yellow** | 24 |
| **BoxOffice By Design Rectangular and Half-Moon Table** | 24 |
| **Wilson Jones Hanging View Binder, White, 1"** | 23 |
| **80 Minute CD-R Spindle, 100/Pack - Staples** | 22 |
| **Peel & Seel® Recycled Catalog Envelopes, Brown** | 22 |
| **Office Star - Mid Back Dual Function Ergonomic Chair** | 22 |
| **Fiskars® Softgrip Scissors** | 22 |
| **StarTAC 7760** | 22 |

### Interpretation  
- **Office furniture and accessories dominate** the list, indicating strong demand in this category.  
- **Small office supplies (binders, scissors, envelopes)** are also frequently ordered, highlighting their necessity in workplaces.  
- **Further analysis** can help in stock optimization and pricing strategies to maximize profitability.  







