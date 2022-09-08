-- I want to know the list of our customers and their spending.
SELECT cu.name, t.cust_phone_n, SUM(c.price) as spending
FROM transactions t
INNER JOIN cars c ON t.car_serial_n = c.serial_n
INNER JOIN customers cu ON t.cust_phone_n = cu.phone_n
GROUP BY t.cust_phone_n, cu.name;

--I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.
SELECT c.manufacturer, count(t.transaction_n) as count
FROM transactions t 
INNER JOIN cars c ON t.car_serial_n = c.serial_n
WHERE DATE_TRUNC('month',t.timestamp) = DATE_TRUNC('month',CURRENT_TIMESTAMP)
GROUP BY  c.manufacturer
ORDER BY count(t.transaction_n) DESC
LIMIT 3;