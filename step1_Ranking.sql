// Query: total revenue per apartment for 2025 YTD, with different ranking columns
SELECT
  apartment_id,
  unit_number,
  total_revenue,
  ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS rn_row_number,
  RANK()       OVER (ORDER BY total_revenue DESC) AS rn_rank,
  DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS rn_dense_rank,
  PERCENT_RANK() OVER (ORDER BY total_revenue) AS pct_rank
FROM (
  SELECT a.apartment_id, a.unit_number, COALESCE(SUM(p.amount),0) AS total_revenue
  FROM Apartment a
  LEFT JOIN Payments p ON a.apartment_id = p.apartment_id
    AND p.payment_date BETWEEN DATE '2025-01-01' AND DATE '2025-12-31'
  GROUP BY a.apartment_id, a.unit_number
) t
ORDER BY total_revenue DESC;
