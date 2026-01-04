-- 1. Total Revenue and Total Profit
SELECT
    SUM(Sales) AS total_revenue,
    SUM(Profit) AS total_profit
FROM data.train;

-- 2. Overall Profit Margin
SELECT
    (SUM(Profit) / SUM(Sales)) * 100 AS profit_margin_percentage
FROM data.train;

-- 3. Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', "Order Date") AS order_month,
    SUM(Sales) AS monthly_revenue
FROM data.train
GROUP BY order_month
ORDER BY order_month;

-- 4. Region-wise Sales and Profit
SELECT
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM data.train
GROUP BY Region
ORDER BY total_profit DESC;

-- 5. Top 10 Products by Profit
SELECT
    "Product Name",
    SUM(Profit) AS total_profit
FROM data.train
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 10;

-- 6. Loss-Making Products
SELECT
    "Product Name",
    SUM(Profit) AS total_profit
FROM data.train
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY total_profit;

-- 7. Top Customers by Revenue
SELECT
    "Customer Name",
    SUM(Sales) AS total_sales
FROM data.train
GROUP BY "Customer Name"
ORDER BY total_sales DESC
LIMIT 10;

