SELECT
submission_date,
COUNT(DISTINCT hacker_id),
(
SELECT hacker_id
FROM Submissions s2
WHERE s2.submission_date = s1.submission_date
GROUP BY hacker_id
ORDER BY COUNT(submission_id) DESC, hacker_id
FETCH FIRST 1 ROW ONLY
)
FROM Submissions s1
GROUP BY submission_date
ORDER BY submission_date;
