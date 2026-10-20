-- RESEARCH QUESTION 01: Which candy divisions generate the most revenue, and are they also the most profitable?
-- Division performance
SELECT
    Division,
    SUM(Sales) AS "Total Revenue",
    SUM(Gross_Profit) AS "Total Gross Profit",
    (SUM(Gross_Profit) * 100.0 / SUM(Sales)) AS "Gross Profit Margin (%)"
FROM Candy_Sales
GROUP BY Division
ORDER BY "Total Revenue" DESC;

-- RESEARCH QUESTION 02: Which products generate the most sales and gross profit, and how do their margins compare?
-- Product performance
SELECT
    Product_Name,
    SUM(Sales) AS "Total Revenue",
    SUM(Gross_Profit) AS "Total Gross Profit",
    SUM(Units) AS "Units Sold",
    (SUM(Gross_Profit) * 100.0 / SUM(Sales)) AS "Gross Profit Margin (%)"
FROM Candy_Sales
INNER JOIN Candy_Products
    ON Candy_Sales.Product_ID = Candy_Products.Product_ID
GROUP BY Product_Name
ORDER BY "Total Revenue" DESC;

-- RESEARCH QUESTION 03: Which customers contribute the most revenue, and how does observed order frequency compare?
-- Customer value
SELECT
    Customer_ID,
    COUNT(DISTINCT Order_ID) AS "Number of Orders",
    SUM(Sales) AS "Total Revenue",
    SUM(Gross_Profit) AS "Total Gross Profit"
FROM Candy_Sales
GROUP BY Customer_ID
ORDER BY "Total Revenue" DESC;

-- RESEARCH QUESTION 04: How does average observed customer revenue differ between single-order and multiple-order customers?
-- Customer spending patterns
-- Change the comparison to = 1 for single-order customers,
-- or > 1 for customers with multiple recorded orders.
SELECT
    AVG(Total_Revenue) AS "Average Customer Revenue"
FROM (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS Number_of_Orders,
        SUM(Sales) AS Total_Revenue
    FROM Candy_Sales
    GROUP BY Customer_ID
) AS Customer_Summary
WHERE Number_of_Orders > 1;

-- RESEARCH QUESTION 05: Which U.S. states generate the most revenue and gross profit?
-- Geographic performance
SELECT
    State,
    SUM(Sales) AS "Total Revenue",
    SUM(Gross_Profit) AS "Total Gross Profit"
FROM Candy_Sales
WHERE Country = 'United States'
GROUP BY State
ORDER BY "Total Revenue" DESC;
