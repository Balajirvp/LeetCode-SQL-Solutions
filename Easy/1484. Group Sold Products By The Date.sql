-- Solution 1: (454 ms, 0 B)

WITH TEMP AS
(
   SELECT SELL_DATE, COUNT(DISTINCT PRODUCT) AS NUM_SOLD
   FROM ACTIVITIES
   GROUP BY 1
), TEMP1 AS
(
   SELECT SELL_DATE, GROUP_CONCAT(DISTINCT PRODUCT ORDER BY PRODUCT ASC SEPARATOR ',') AS PRODUCTS
   FROM 
   ( 
      SELECT A.* FROM ACTIVITIES A
      GROUP BY 1,2
   ) A
   GROUP BY 1
)

SELECT A.*, B.PRODUCTS FROM TEMP A
LEFT JOIN TEMP1 B
ON A.SELL_DATE = B.SELL_DATE
ORDER BY 1;