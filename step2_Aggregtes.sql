-- Monthly totals and running total (calendar-month granularity)
WITH monthly_sales AS (
  SELECT TRUNC(payment_date, 'MM') AS month_start, SUM(amount) AS month_total
  FROM Payments
  WHERE payment_date BETWEEN DATE '2024-01-01' AND DATE '2025-12-31'
  GROUP BY TRUNC(payment_date, 'MM')
)
SELECT
  month_start,
  month_total,
  SUM(month_total) OVER (ORDER BY month_start
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_rows,
  SUM(month_total) OVER (ORDER BY month_start
                         RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_range
FROM monthly_sales
ORDER BY month_start;
