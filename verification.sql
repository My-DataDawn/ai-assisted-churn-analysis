-- Project 3: Verifying AI findings with SQL
-- Dataset: Bank Customer Churn (Kaggle), table dbo.Customers

-- Check 1: Overall churn
SELECT 
    COUNT(*) AS total_customers,
    SUM(CAST(Exited AS INT)) AS churned,
    ROUND(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*), 1) AS churn_pct
FROM dbo.Customers;
-- AI said: 10,000 customers, 2,038 churned, 20.4%
-- My SQL says: 10,000 / 2,038 / 20.4%
-- Match: YES

-- Check 2: Churn by country
SELECT Geography,
    COUNT(*) AS total_customers,
    SUM(CAST(Exited AS INT)) AS churned,
    ROUND(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*), 1) AS churn_pct
FROM dbo.Customers
GROUP BY Geography
ORDER BY churn_pct DESC;
-- AI said: Germany 32.4%, Spain 16.7%, France 16.2%
-- My SQL says: Germany 32.4%, Spain 16.7%, France 16.2%
-- Match: YES

-- Check 3: Churn by number of products
SELECT NumOfProducts,
    COUNT(*) AS total_customers,
    ROUND(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*), 1) AS churn_pct
FROM dbo.Customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;
-- AI said: 1 product 27.7%, 2 products 7.6%, 3 products 82.7%, 4 products 100%
-- My SQL says: 27.7%, 7.6%, 82.7%, 100%
-- Match: YES
-- Note: 3 and 4 product groups are small (266 and 60 customers)