-- Solution 1: (602 ms, 0 B)

WITH TEMP AS
(
   SELECT ID, EMAIL, ROW_NUMBER() OVER (PARTITION BY EMAIL ORDER BY ID) AS ROW_NUM
   FROM PERSON    
)

DELETE FROM PERSON
WHERE ID IN (SELECT DISTINCT ID FROM TEMP WHERE ROW_NUM >= 2);