-- Solution 1: (587 ms, 0 B)

SELECT USER_ID, MAX(TIME_STAMP) AS LAST_STAMP
FROM LOGINS
WHERE YEAR(TIME_STAMP) = 2020
GROUP BY 1;