-- Solution 1: (1108 ms, 0 B)

SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM SALES
GROUP BY 1;