-- Customer segmentation into quartiles based on total spending in 2025
WITH customer_spend AS (
  SELECT c.customer_id, c.name, COALESCE(SUM(p.amount),0) AS total_spent
  FROM Customer c
  LEFT JOIN Payments p ON c.customer_id = p.customer_id AND p.payment_date BETWEEN DATE '2025-01-01' AND DATE '2025-12-31'
  GROUP BY c.customer_id, c.name
)
SELECT
  customer_id,
  name,
  total_spent,
  NTILE(4) OVER (ORDER BY total_spent DESC) AS quartile_desc,
  CUME_DIST() OVER (ORDER BY total_spent DESC) AS cume_dist
FROM customer_spend
ORDER BY total_spent DESC;
