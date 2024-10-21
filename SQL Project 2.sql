Select * from [dbo].[LITA Capstone Dataset - CustomerData]

SELECT Region, COUNT(*) AS total_customers FROM  [dbo].[LITA Capstone Dataset - CustomerData] GROUP BY Region

SELECT SubscriptionType, COUNT(*) AS customer_count FROM [dbo].[LITA Capstone Dataset - CustomerData] GROUP BY SubscriptionType ORDER BY customer_count
DESC

SELECT customername
FROM [dbo].[LITA Capstone Dataset - CustomerData]
WHERE canceled = 1
  AND subscriptionend <= DATEADD(MONTH, 6, subscriptionstart);

SELECT AVG(DATEDIFF(DAY, subscriptionstart, subscriptionend)) AS avg_subscription_duration
FROM [dbo].[LITA Capstone Dataset - CustomerData]
WHERE subscriptionend IS NOT NULL;

SELECT customername
FROM [dbo].[LITA Capstone Dataset - CustomerData]
WHERE DATEDIFF(MONTH, subscriptionstart, subscriptionend) > 12;

SELECT subscriptiontype, SUM(CAST(revenue AS DECIMAL(18, 2))) AS total_revenue
FROM [dbo].[LITA Capstone Dataset - CustomerData]
GROUP BY subscriptiontype;

SELECT region, COUNT(*) AS cancellation_count
FROM [dbo].[LITA Capstone Dataset - CustomerData]
WHERE canceled = 1 -- Assuming '1' indicates a canceled subscription
GROUP BY region
ORDER BY cancellation_count DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY; -- To get the top 3 regions

SELECT subscriptiontype, COUNT(*) AS total_subscriptions
FROM [dbo].[LITA Capstone Dataset - CustomerData]
GROUP BY subscriptiontype;









