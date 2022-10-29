-- Solution 1: (891 ms, 0 B)

SELECT NAME, CASE WHEN TRAVELLED_DISTANCE IS NULL THEN 0 ELSE TRAVELLED_DISTANCE END AS TRAVELLED_DISTANCE
FROM USERS A
LEFT JOIN 
(
    SELECT USER_ID, SUM(DISTANCE) AS TRAVELLED_DISTANCE
    FROM RIDES A
    GROUP BY 1
) B
ON A.ID = B.USER_ID
ORDER BY 2 DESC, 1;

