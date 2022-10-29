-- Solution 1: (289 ms, 0 B)

SELECT ID AS P1, B_ID AS P2, ABS(DIFF1*DIFF2) AS AREA
FROM
(
   SELECT ID, B_ID, X_VALUE - B_X AS DIFF1, A.Y_VALUE - B_Y AS DIFF2
   FROM
   (
       SELECT A.*, B.ID AS B_ID, B.X_VALUE AS B_X, B.Y_VALUE AS B_Y
       FROM POINTS A
       LEFT JOIN POINTS B
       ON A.ID != B.ID
   ) A    
   WHERE ID <= B_ID
) A
HAVING AREA > 0
ORDER BY 3 DESC, 1,2;