-- Solution 1: (591 ms, 0 B)

SELECT EMPLOYEE_ID, CASE WHEN NAME NOT LIKE 'M%' AND (EMPLOYEE_ID % 2) != 0 THEN SALARY ELSE 0 END AS BONUS
FROM EMPLOYEES
ORDER BY 1;