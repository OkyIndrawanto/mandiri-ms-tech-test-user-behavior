-- Insight 3: Average ticket by card brand (volume guarded)
-- Why it matters: higher AOV brands yield more revenue per approval.
-- Action: co-market with high-AOV brands (ensure volume >= 100 txns).
SELECT
  c.card_brand,
  COUNT(*)                AS txn_count,
  ROUND(AVG(t.amount), 2) AS avg_ticket
FROM devdb.clean_transactions t
JOIN devdb.clean_cards c ON t.card_id = c.card_id
WHERE c.card_brand IS NOT NULL
GROUP BY c.card_brand
HAVING COUNT(*) >= 100
ORDER BY avg_ticket DESC;
