-- Solution 1: (357 ms,	0 B)

WITH FRIENDSHIP1 AS
(
   SELECT * FROM FRIENDSHIP
   UNION
   SELECT USER2_ID, USER1_ID FROM FRIENDSHIP
), TEMP AS
(
    SELECT A.*, B.USER1_ID AS USER1
    FROM FRIENDSHIP1 A
    LEFT JOIN FRIENDSHIP1 B 
    ON A.USER2_ID = B.USER2_ID AND A.USER1_ID != B.USER1_ID
    WHERE A.USER1_ID < B.USER1_ID AND (A.USER1_ID, B.USER1_ID) IN (SELECT * FROM FRIENDSHIP)
    ORDER BY 1,2
)

SELECT A.USER1_ID, USER1 AS USER2_ID, COUNT(*) AS COMMON_FRIEND
FROM TEMP A 
GROUP BY 1,2
HAVING COUNT(*) >= 3;

