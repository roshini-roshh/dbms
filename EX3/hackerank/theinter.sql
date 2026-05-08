SELECT
c.contest_id,
c.hacker_id,
c.name,
SUM(ts.total_submissions),
SUM(ts.total_accepted_submissions),
SUM(tv.total_views),
SUM(tv.total_unique_views)
FROM Contests c
JOIN Colleges co
ON c.contest_id = co.contest_id
JOIN Challenges ch
ON co.college_id = ch.college_id
LEFT JOIN View_Stats tv
ON ch.challenge_id = tv.challenge_id
LEFT JOIN Submission_Stats ts
ON ch.challenge_id = ts.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING
SUM(ts.total_submissions) > 0
OR
SUM(ts.total_accepted_submissions) > 0
OR
SUM(tv.total_views) > 0
OR
SUM(tv.total_unique_views) > 0
ORDER BY c.contest_id;
