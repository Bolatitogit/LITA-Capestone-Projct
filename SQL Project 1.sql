Select * from [dbo].[LITA Capstone Dataset - SalesData (1)]

SELECT Product, SUM(Sales_per_Product_Quantity) AS total_sales
FROM [dbo].[LITA Capstone Dataset - SalesData (1)]
GROUP BY product;

SELECT region, COUNT(*) AS total_transactions
FROM [dbo].[LITA Capstone Dataset - SalesData (1)]
GROUP BY region;

SELECT TOP 1 product, SUM(Sales_per_Product_Quantity) AS total_sales
FROM [dbo].[LITA Capstone Dataset - SalesData (1)]
GROUP BY product
ORDER BY total_sales DESC;

SELECT product, SUM(Sales_per_Product_Quantity) AS total_revenue
FROM [dbo].[LITA Capstone Dataset - SalesData (1)]
GROUP BY product;

SELECT MONTH(orderdate) AS sales_month, SUM(Sales_per_Product_Quantity) AS total_sales
FROM [dbo].[LITA Capstone Dataset - SalesData (1)]
WHERE YEAR(orderdate) = YEAR(GETDATE())
GROUP BY MONTH(orderdate)
ORDER BY sales_month;

SELECT TOP 5 customer_id, SUM(Sales_per_Product_Quantity) AS total_purchase
FROM [dbo].[LITA Capstone Dataset - SalesData (1)]
GROUP BY customer_id
ORDER BY total_purchase DESC;

SELECT region, 
       SUM(Sales_per_Product_Quantity) * 100.0 / (SELECT SUM(Sales_per_Product_Quantity) FROM [dbo].[LITA Capstone Dataset - SalesData (1)]) AS percentage_of_total_sales
FROM [dbo].[LITA Capstone Dataset - SalesData (1)]
GROUP BY region;

SELECT product
FROM [dbo].[LITA Capstone Dataset - SalesData (1)]
GROUP BY product
HAVING SUM(CASE 
               WHEN orderdate >= DATEADD(QUARTER, -1, GETDATE()) THEN 1 
               ELSE 0 
           END) = 0;

