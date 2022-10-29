-- Solution 1: (352 ms, 0 B)

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN

RETURN 
(
      
    SELECT IFNULL ((
    SELECT DISTINCT SALARY 
    FROM
    (
        SELECT ID, SALARY, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS ROW_NUM
        FROM EMPLOYEE
    ) A
    WHERE ROW_NUM = N
    ), NULL) AS NthHighestSalary 
      
);
END