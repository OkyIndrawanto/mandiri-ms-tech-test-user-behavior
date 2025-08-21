-- Insight 2: Channel mix (online / chip / swipe)
-- Why it matters: guides UX, fraud controls, and ops.
-- Action: encourage lower-risk channels; design incentives.
SELECT
  LOWER(txn_type) AS txn_type,
  COUNT(*)        AS txn_count,
  SUM(amount)     AS total_amount
FROM devdb.clean_transactions
WHERE txn_type IS NOT NULL
GROUP BY LOWER(txn_type)
ORDER BY txn_count DESC;
