-- Solution 1: (612 ms, 0 B)

SELECT NAME FROM CUSTOMER 
WHERE REFEREE_ID IS NULL OR REFEREE_ID != 2;