-- Insight 1: Top states by spend
-- Why it matters: focus commercial efforts where spend concentrates.
-- Action: prioritize partnerships and capacity in the top 5–10 states.
SELECT
  merchant_state,
  SUM(amount) AS total_amount
FROM devdb.clean_transactions
WHERE merchant_state IS NOT NULL
GROUP BY merchant_state
ORDER BY total_amount DESC
LIMIT 20;  -- export headroom; cap to 10 in Looker
