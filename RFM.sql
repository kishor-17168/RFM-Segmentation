create database RFM;
USE RFM;
select Order_date, Ship_date from salesdata limit 5;


-- Data preprocessing ------------
-- Rename all columns name 
ALTER TABLE salesdata RENAME COLUMN `Row ID` TO Row_ID;
ALTER TABLE salesdata RENAME COLUMN `Order Priority` TO Order_Priority;
ALTER TABLE salesdata RENAME COLUMN `Unit Price` TO Unit_Price;
ALTER TABLE salesdata RENAME COLUMN `Shipping Cost` TO Shipping_Cost;
ALTER TABLE salesdata RENAME COLUMN `Customer ID` TO Customer_ID;
ALTER TABLE salesdata RENAME COLUMN `Customer Name` TO Customer_Name;
ALTER TABLE salesdata RENAME COLUMN `Ship Mode` TO Ship_Mode;
ALTER TABLE salesdata RENAME COLUMN `Customer Segment` TO Customer_Segment;
ALTER TABLE salesdata RENAME COLUMN `Product Category` TO Product_Category;
ALTER TABLE salesdata RENAME COLUMN `Product Sub-Category` TO Product_Sub_Category;
ALTER TABLE salesdata RENAME COLUMN `Product Container` TO Product_Container;
ALTER TABLE salesdata RENAME COLUMN `Product Name` TO Product_Name;
ALTER TABLE salesdata RENAME COLUMN `Product Base Margin` TO Product_Base_Margin;
ALTER TABLE salesdata RENAME COLUMN `State or Province` TO State_or_Province;
ALTER TABLE salesdata RENAME COLUMN `Postal Code` TO Postal_Code;
ALTER TABLE salesdata RENAME COLUMN `Order Date` TO Order_Date;
ALTER TABLE salesdata RENAME COLUMN `Ship Date` TO Ship_Date;
ALTER TABLE salesdata RENAME COLUMN `Quantity ordered new` TO Quantity_ordered_new;
ALTER TABLE salesdata RENAME COLUMN `Order ID` TO Order_ID;
ALTER TABLE salesdata RENAME COLUMN `Return Status` TO Return_Status;


-- Explore and Clean the Data ---------
-- Check for missing/null values in any column
SELECT 
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_OrderID,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_CustomerID,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS Missing_OrderDate,
    SUM(CASE WHEN Ship_Date IS NULL THEN 1 ELSE 0 END) AS Missing_ShipDate,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Missing_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Missing_Profit,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Missing_Discount,
    SUM(CASE WHEN Product_Name IS NULL THEN 1 ELSE 0 END) AS Missing_ProductName,
    SUM(CASE WHEN Product_Category IS NULL THEN 1 ELSE 0 END) AS Missing_ProductCategory,
    SUM(CASE WHEN Product_Sub_Category IS NULL THEN 1 ELSE 0 END) AS Missing_ProductSubCategory,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS Missing_Region,
    SUM(CASE WHEN State_or_Province IS NULL THEN 1 ELSE 0 END) AS Missing_StateOrProvince,
    SUM(CASE WHEN Postal_Code IS NULL THEN 1 ELSE 0 END) AS Missing_PostalCode,
    SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS Missing_CustomerName,
    SUM(CASE WHEN Order_Priority IS NULL THEN 1 ELSE 0 END) AS Missing_OrderPriority,
    SUM(CASE WHEN Return_Status IS NULL THEN 1 ELSE 0 END) AS Missing_ReturnStatus
FROM salesdata; -- there are no null values 


-- Check for duplicate rows
SELECT Row_ID, COUNT(*) 
FROM SalesData 
GROUP BY Row_ID
HAVING COUNT(*) > 1;-- there are no dublicate rows


-- UPDATE DATE FORMAT
set SQL_SAFE_UPDATES = 0;
UPDATE salesdata 
SET Order_Date = STR_TO_DATE(Order_Date, '%m/%d/%Y');

select Order_Date 
	from salesdata limit 3;
 
 
-------- EXPLORATORY DATA ANALYSIS--------------
-- Total sales and profit
SELECT ROUND(SUM(Sales),2) AS Total_Sales, ROUND(SUM(Profit),2) AS Total_Profit
FROM SalesData;

-- Top 10 customers by total sales
SELECT Customer_Name, ROUND(SUM(Sales),2) AS Total_Sales 
FROM SalesData 
GROUP BY Customer_Name 
ORDER BY Total_Sales DESC 
LIMIT 10;

-- Sales distribution by region
SELECT Region, ROUND(SUM(Sales),2) AS Total_Sales 
FROM SalesData 
GROUP BY Region 
ORDER BY Total_Sales DESC;

-- Most frequently ordered products
SELECT Product_Name, COUNT(*) AS Order_Count 
FROM salesdata 
GROUP BY Product_Name
ORDER BY Order_Count DESC 
LIMIT 10;


-------------------- RFM SEGMENTATION ----------------------
CREATE OR REPLACE VIEW RFM_MAIN_TABLE AS
WITH RFM_DATA AS 
(SELECT 
	CUSTOMER_NAME,
    (SELECT MAX(ORDER_DATE) FROM salesdata) as LAST_ORDER_DATE,
    MAX(ORDER_DATE) AS EACH_PERSON_LAST_ORDER_DATE,
    DATEDIFF(
			(SELECT MAX(ORDER_DATE) FROM salesdata), MAX(ORDER_DATE)
            )
            AS RECENCY,
	COUNT(DISTINCT ROW_ID) AS FREQUENCY,
    ROUND(SUM(SALES),0) AS MONETARY_VALUE
FROM salesdata
GROUP BY CUSTOMER_NAME, (SELECT MAX(ORDER_DATE) FROM salesdata)),
RFM_SCORE AS
(SELECT 
    C.*,
    NTILE(4) OVER (ORDER BY RECENCY DESC) AS R_Score,  -- Lower Recency is better
    NTILE(4) OVER (ORDER BY FREQUENCY ASC) AS F_Score, -- Higher Frequency is better
    NTILE(4) OVER (ORDER BY MONETARY_VALUE ASC) AS M_Score  -- Higher Monetary is better
FROM RFM_DATA AS C)
SELECT R.CUSTOMER_NAME, R.RECENCY,R.FREQUENCY,R.MONETARY_VALUE,R.R_Score,R.F_Score,R.M_Score,
	(R_Score+F_Score+M_Score) AS TOTAL_RFM_SCORE,
    CONCAT_WS('',R_Score,F_Score,M_Score) AS RFM_SCORE_COMBINATION
FROM RFM_SCORE AS R;

CREATE OR REPLACE VIEW RFM_ANALYSIS AS
SELECT
    RFM_MAIN_TABLE.*,
    CASE
        WHEN RFM_SCORE_COMBINATION IN (111, 112, 121, 132, 211, 211, 212, 114, 141) THEN 'CHURNED CUSTOMER'
        WHEN RFM_SCORE_COMBINATION IN (133, 134, 143, 224, 334, 343, 344, 144) THEN 'SLIPPING AWAY, CANNOT LOSE'
        WHEN RFM_SCORE_COMBINATION IN (311, 411, 331) THEN 'NEW CUSTOMERS'
        WHEN RFM_SCORE_COMBINATION IN (222, 231, 221, 223, 233, 322) THEN 'POTENTIAL CHURNERS'
        WHEN RFM_SCORE_COMBINATION IN (323, 333, 321, 341, 422, 332, 432) THEN 'ACTIVE'
        WHEN RFM_SCORE_COMBINATION IN (433, 434, 443, 444) THEN 'LOYAL'
        ELSE 'CANNOT BE DEFINED'
        END AS CUSTOMER_SEGMENT
	FROM RFM_MAIN_TABLE;
    
   -- NUMBER OF DIFFERENT SEGMENT CUSTOMER AND THEIR AVERAGE MONETARY VALUE
    select CUSTOMER_SEGMENT, count(*) AS NUMBER_OF_CUSTOMER, ROUND(AVG(FREQUENCY),0) AS AVERAGE_FREQUENCY_VALUE,
    ROUND(AVG(MONETARY_VALUE),0) AS AVERAGE_MONETARY_VALUE
    FROM RFM_ANALYSIS 
    GROUP BY CUSTOMER_SEGMENT;
    

















