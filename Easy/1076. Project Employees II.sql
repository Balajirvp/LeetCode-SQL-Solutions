-- Solution 1: (689 ms, 0 B)

SELECT DISTINCT PROJECT_ID
FROM
(
    SELECT A.*, DENSE_RANK() OVER (ORDER BY NO_EMP DESC) AS ROW_NUM
    FROM
    (
        SELECT PROJECT_ID, COUNT(DISTINCT EMPLOYEE_ID) AS NO_EMP
        FROM PROJECT
        GROUP BY 1
    ) A    
) A
WHERE ROW_NUM = 1;