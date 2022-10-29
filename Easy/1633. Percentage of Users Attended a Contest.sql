-- Solution 1: (1017 ms, 0 B)

SELECT CONTEST_ID, ROUND((NO_USERS*100)/USERS,2) AS PERCENTAGE
FROM
(
    SELECT CONTEST_ID, COUNT(DISTINCT USER_ID) AS NO_USERS
    FROM REGISTER A
    GROUP BY 1
) A
CROSS JOIN 
(  SELECT COUNT(DISTINCT USER_ID) AS USERS FROM USERS ) B
ORDER BY 2 DESC, 1;