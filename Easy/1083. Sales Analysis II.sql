-- Solution 1: (894 ms, 0 B)

SELECT BUYER_ID FROM
(
    SELECT BUYER_ID, MAX(S8) AS S8, MAX(IP) AS IP
    FROM
    (
        SELECT BUYER_ID, CASE WHEN PRODUCT_NAME = 'S8' THEN 1 ELSE 0 END AS S8,
            CASE WHEN PRODUCT_NAME = 'iPhone' THEN 1 ELSE 0 END AS IP

        FROM
        (
            SELECT A.*, B.PRODUCT_NAME
            FROM SALES A
            LEFT JOIN PRODUCT B
            ON A.PRODUCT_ID = B.PRODUCT_ID
        ) A
    ) A    
    GROUP BY 1
) A 
WHERE S8 = 1 AND IP = 0;