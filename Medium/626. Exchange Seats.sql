-- Solution 1: (239 ms,	0 B)

SELECT ID, CASE WHEN ID % 2 != 0 AND ID = (SELECT MAX(ID) FROM SEAT) THEN STUDENT 
                WHEN ID % 2 != 0 THEN NEXT_STUDENT
                WHEN ID % 2 = 0 THEN PREV_STUDENT END AS STUDENT
FROM
(
    SELECT A.*, LAG(STUDENT) OVER (ORDER BY ID) AS PREV_STUDENT,
                LEAD(STUDENT) OVER (ORDER BY ID) AS NEXT_STUDENT
    FROM SEAT A
) A;

-- Solution 2: (248 ms,	0 B)

WITH TEMP AS
(
   SELECT DISTINCT STUDENT FROM SEAT
   WHERE ID = (SELECT MAX(ID) FROM SEAT)
),
TEMP1 AS
(
    SELECT A.ID, CASE WHEN B.STUDENT IS NOT NULL THEN B.STUDENT ELSE (SELECT STUDENT FROM TEMP) END AS STUDENT
    FROM SEAT A
    LEFT JOIN SEAT B
    ON A.ID = B.ID - 1
    WHERE A.ID % 2 != 0
), TEMP2 AS
(
    SELECT A.ID, B.STUDENT
    FROM SEAT A
    LEFT JOIN SEAT B
    ON A.ID - 1= B.ID 
    WHERE A.ID % 2 = 0
)

SELECT * FROM
(
    SELECT * FROM TEMP1
    UNION
    SELECT * FROM TEMP2
) A
ORDER BY 1;