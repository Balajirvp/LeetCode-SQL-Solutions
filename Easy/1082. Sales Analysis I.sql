-- Solution 1: (949 ms, 0 B)

SELECT DISTINCT SELLER_ID FROM
(
    SELECT A.*, DENSE_RANK() OVER (ORDER BY SP DESC) AS RN
    FROM
    (
        SELECT SELLER_ID, SUM(PRICE) AS SP
        FROM SALES 
        GROUP BY 1
    ) A    
) A
WHERE RN = 1;