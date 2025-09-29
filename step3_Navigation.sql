-- Month-over-month growth percentage using LAG
WITH monthly AS (
  SELECT TRUNC(payment_date,'MM') AS month_start,
         SUM(amount) AS month_total
  FROM Payments
  GROUP BY TRUNC(payment_date,'MM')
)
SELECT
  month_start,
  month_total,
  LAG(month_total) OVER (ORDER BY month_start) AS prev_month_total,
  CASE
    WHEN LAG(month_total) OVER (ORDER BY month_start) IS NULL THEN NULL
    WHEN LAG(month_total) OVER (ORDER BY month_start) = 0 THEN NULL
    ELSE ROUND( (month_total - LAG(month_total) OVER (ORDER BY month_start)) / LAG(month_total) OVER (ORDER BY month_start) * 100, 2)
  END AS mom_growth_pct
FROM monthly
ORDER BY month_start;
