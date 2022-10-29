-- Solution 1: (573 ms, 0 B)

SELECT ROUND(IMM*100/TOT,2) AS IMMEDIATE_PERCENTAGE
FROM
(
    SELECT SUM(FLAG) AS IMM, COUNT(DISTINCT DELIVERY_ID) AS TOT
    FROM
    (
        SELECT A.*, CASE WHEN ORDER_DATE = customer_pref_delivery_date THEN 1 ELSE 0 END AS FLAG
        FROM DELIVERY A
    ) A    
) A ;