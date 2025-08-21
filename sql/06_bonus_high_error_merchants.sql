-- Bonus Insight 6: High-error merchants (volume guarded)
-- Why it matters: outliers drive failed transactions; fix root causes.
-- Action: audit processes, implement targeted rules/support, monitor.
SELECT
  merchant_id,
  merchant_state,
  COUNT(*) AS txn_count,
  ROUND(100 * SUM(CASE WHEN errors IS NOT NULL AND errors <> '' THEN 1 ELSE 0 END) / COUNT(*), 2) AS error_rate_pct
FROM devdb.clean_transactions
GROUP BY merchant_id, merchant_state
HAVING COUNT(*) >= 500
ORDER BY error_rate_pct DESC, txn_count DESC
LIMIT 25;
