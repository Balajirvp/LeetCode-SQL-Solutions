-- Solution 1: (197 ms, 0 B)

WITH RECURSIVE CTE AS
(
   SELECT NUM, 1 AS N FROM NUMBERS
   UNION ALL
   SELECT NUM, N+1 FROM CTE
   WHERE N < (SELECT MAX(FREQUENCY) FROM NUMBERS)
)

SELECT ROUND(MEDIAN,1) AS MEDIAN
FROM
(
    SELECT CASE WHEN FREQ % 2 = 0 THEN SUM(CASE WHEN R_N = FREQ / 2 OR R_N = (FREQ / 2) + 1 THEN NUM END)/2 
                WHEN FREQ % 2 != 0 THEN SUM(CASE WHEN R_N = CEIL(FREQ/2) THEN NUM END) END AS MEDIAN
    FROM
    (
        SELECT A.NUM, ROW_NUMBER() OVER (ORDER BY A.NUM) AS R_N, C.FREQ 
        FROM CTE A
        LEFT JOIN NUMBERS B
        ON A.NUM = B.NUM
        CROSS JOIN (SELECT SUM(FREQUENCY) AS FREQ FROM NUMBERS) C
        WHERE A.N <= B.FREQUENCY
    ) A
) A;