-- Solution 1: (435 ms, 0 B)

SELECT MAX(NUM) AS NUM
FROM
(
    SELECT NUM, COUNT(*) AS CNT
    FROM MYNUMBERS
    GROUP BY 1
    HAVING CNT = 1

) A;