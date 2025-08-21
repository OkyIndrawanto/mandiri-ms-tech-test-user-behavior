-- Insight 5: Risk by state (Error %)
-- Why it matters: fraud/ops hotspots hurt conversion and trust.
-- Action: strengthen controls in high-risk states; review merchants.
SELECT
  merchant_state,
  COUNT(*) AS txn_count,
  ROUND(100 * SUM(CASE WHEN errors IS NOT NULL AND errors <> '' THEN 1 ELSE 0 END) / COUNT(*), 2) AS error_rate_pct
FROM devdb.clean_transactions
WHERE merchant_state IS NOT NULL
GROUP BY merchant_state
HAVING txn_count >= 1000
ORDER BY error_rate_pct DESC
LIMIT 20;
