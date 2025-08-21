-- Insight 4: Top customers by spend
-- Why it matters: retention & cross-sell opportunities.
-- Action: create a VIP outreach program for top spenders.
SELECT
  client_id,
  COUNT(*)              AS txn_count,
  SUM(amount)           AS total_amount
FROM devdb.clean_transactions
GROUP BY client_id
ORDER BY total_amount DESC
LIMIT 20;  -- export headroom; show 10 in Looker
