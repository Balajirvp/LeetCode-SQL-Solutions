-- Solution 1: (460 ms, 0 B)

SELECT ACTOR_ID, DIRECTOR_ID
FROM ACTORDIRECTOR A
GROUP BY 1,2
HAVING COUNT(DISTINCT TIMESTAMP) > 2;