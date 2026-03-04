-- 1) Basic select + filter
SELECT *
FROM customers
WHERE country = 'USA';

-- 2) Aggregation
SELECT country, COUNT(*) AS customers_count
FROM customers
GROUP BY country
ORDER BY customers_count DESC;

-- 3) Join example
SELECT o.order_id, c.customer_name, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- 4) Window function example
SELECT
  customer_id,
  order_id,
  order_date,
  total_amount,
  SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM orders;
