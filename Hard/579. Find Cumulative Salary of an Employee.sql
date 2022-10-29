-- Solution 1: (299 ms, 0 B)

WITH TEMP AS
(
    SELECT * FROM
    (
        SELECT A.*, ROW_NUMBER() OVER (PARTITION BY ID ORDER BY MONTH DESC) AS R_N
        FROM EMPLOYEE A
    ) A
    WHERE R_N > 1
    ORDER BY 1,2 DESC
)   

SELECT A.ID, A.MONTH, SUM(CASE WHEN (A.MONTH - B.MONTH <= 2) AND (A.MONTH - B.MONTH >= 0) THEN B.SALARY END) AS SALARY
FROM TEMP A
LEFT JOIN TEMP B
ON A.ID = B.ID
GROUP BY 1,2
ORDER BY 1,2 DESC;