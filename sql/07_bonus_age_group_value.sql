-- Bonus Insight 7: Age groups driving value
-- Why it matters: targeting & messaging by life stage.
-- Action: prioritize highest-value cohorts with tailored offers.
SELECT
  CASE
    WHEN u.current_age IS NULL THEN 'unknown'
    WHEN u.current_age < 30 THEN '18-29'
    WHEN u.current_age BETWEEN 30 AND 44 THEN '30-44'
    WHEN u.current_age BETWEEN 45 AND 59 THEN '45-59'
    ELSE '60+'
  END AS age_group,
  COUNT(*)               AS txn_count,
  ROUND(SUM(t.amount),2) AS total_amount,
  ROUND(AVG(t.amount),2) AS avg_ticket
FROM devdb.clean_transactions t
JOIN devdb.clean_users u ON t.client_id = u.id
GROUP BY age_group
ORDER BY total_amount DESC;
