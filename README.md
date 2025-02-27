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

#### Interpretation  
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


## RFM Analysis Results and Interpretation

### 1. **Customer Segments and Key Metrics**

| **Customer Segment**               | **Number of Customers** | **Average Frequency** | **Average Monetary Value** |
|------------------------------------|-------------------------|-----------------------|----------------------------|
| **CHURNED CUSTOMER**               | 632                     | 1                     | 404                        |
| **CANNOT BE DEFINED**              | 617                     | 3                     | 3140                       |
| **ACTIVE**                         | 409                     | 3                     | 1000                       |
| **NEW CUSTOMERS**                  | 21                      | 3                     | 140                        |
| **POTENTIAL CHURNERS**             | 263                     | 3                     | 1171                       |
| **LOYAL**                          | 406                     | 6                     | 8647                       |
| **SLIPPING AWAY, CANNOT LOSE**     | 320                     | 6                     | 7108                       |

### 2. **Interpretation of Results**

#### **Loyal Customers (RFM Score '444')**
- **Number of Customers:** 406
- **Average Frequency:** 6
- **Average Monetary Value:** 8647
- **Insight:** This group has the highest frequency and monetary value, meaning they are the most valuable customers for the business. They regularly purchase and spend large amounts. Retaining these customers is crucial for business profitability.

#### **Slipping Away, Cannot Lose (RFM Score '434')**
- **Number of Customers:** 320
- **Average Frequency:** 6
- **Average Monetary Value:** 7108
- **Insight:** These customers are similar to loyal customers in frequency and spend, but they have shown some decline in recency. They are high-value customers who may be at risk of churn, and targeted campaigns should be used to keep them engaged.

#### **Active Customers (RFM Score '323' or '333')**
- **Number of Customers:** 409
- **Average Frequency:** 3
- **Average Monetary Value:** 1000
- **Insight:** These customers are engaged and make frequent purchases, but they spend less on average compared to loyal customers. Retaining these customers and increasing their purchase value through promotions or loyalty programs is a key opportunity.

#### **Potential Churners (RFM Score '232' or '233')**
- **Number of Customers:** 263
- **Average Frequency:** 3
- **Average Monetary Value:** 1171
- **Insight:** These customers make purchases regularly but have not purchased recently. They are at risk of churning and require re-engagement efforts, such as special offers or reminders, to prevent them from leaving.

#### **New Customers (RFM Score '311')**
- **Number of Customers:** 21
- **Average Frequency:** 3
- **Average Monetary Value:** 140
- **Insight:** This group consists of customers who have just made their first purchase. While their average spend is low, increasing their purchase frequency and value should be a priority. Engaging them early with offers can drive long-term loyalty.

#### **Churned Customers (RFM Score '111')**
- **Number of Customers:** 632
- **Average Frequency:** 1
- **Average Monetary Value:** 404
- **Insight:** These customers have not made recent purchases, have low frequency, and their spend is significantly lower. They represent lost revenue potential, and strategies to win them back, such as targeted reactivation campaigns, could be effective.

#### **Cannot Be Defined (RFM Score 'undefined')**
- **Number of Customers:** 617
- **Average Frequency:** 3
- **Average Monetary Value:** 3140
- **Insight:** This group consists of customers whose RFM combination doesn't fit into the defined segments. Further analysis could help refine the segmentation for these customers to understand their behavior better.

### 3. **Overall Insights**
- **Loyal Customers:** The business’s most valuable customers are those who make frequent, high-value purchases. Retaining this group is crucial.
- **Slipping Away Customers:** While these customers are high spenders, their frequency and recency indicate they might be at risk. They require immediate re-engagement.
- **Active and Potential Churners:** Both groups make frequent purchases but at different spending levels. Strategies to increase the spend of active customers and retain potential churners are essential.
- **Churned Customers:** This segment is highly disengaged, and significant effort is needed to win them back.

These insights should guide marketing strategies, where businesses can focus on retaining loyal customers, re-engaging those at risk of churning, and nurturing new customers to build long-term value.








