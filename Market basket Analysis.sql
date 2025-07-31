 -- 1. What are all the transactions made during a specific period? --

SELECT InvoiceNo, InvoiceDate, CustomerID, Country
FROM market_data
WHERE InvoiceDate BETWEEN '2024-01-01' AND '2024-06-30';

-- 2. What products were purchased in each transaction? --

SELECT InvoiceNo, Description
FROM market_data
WHERE Quantity > 0 AND UnitPrice > 0;

 -- 3. Which are the most frequently purchased products? --

SELECT Description, COUNT(*) AS purchase_count
FROM market_data
WHERE Quantity > 0
GROUP BY Description
ORDER BY purchase_count DESC
LIMIT 10;

-- 4. How many products are bought per transaction? --

SELECT InvoiceNo, COUNT(DISTINCT Description) AS item_count
FROM market_data
WHERE Quantity > 0
GROUP BY InvoiceNo
ORDER BY item_count DESC;

-- 5. What product combinations appear most frequently together? --

SELECT InvoiceNo, Description
FROM market_data
WHERE Quantity > 0 AND Description IS NOT NULL
ORDER BY InvoiceNo;

-- 6. Which country or region are the transactions from?--

SELECT Country, COUNT(*) AS num_transactions
FROM market_data
GROUP BY Country
ORDER BY num_transactions DESC;

-- 7. Who are the top customers by transaction count? --

SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS total_orders
FROM market_data
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_orders DESC
LIMIT 10;

