-- Solution 1: (244 ms, 0 B)

UPDATE SALARY 
SET SEX = CASE WHEN SEX = 'f' THEN 'm' 
               WHEN SEX = 'm' THEN 'f' END ;
