-- Solution 1: (542 ms, 0 B)

SELECT X, Y, Z, CASE WHEN T1 = 1 AND T2 = 1 AND T3 = 1 THEN 'Yes' ELSE 'No' END AS TRIANGLE
FROM
(
    SELECT A.*, CASE WHEN X + Y > Z THEN 1 ELSE 0 END AS T1,
                CASE WHEN Y + Z > X THEN 1 ELSE 0 END AS T2,
                CASE WHEN X + Z > Y THEN 1 ELSE 0 END AS T3
    FROM TRIANGLE A
) A;