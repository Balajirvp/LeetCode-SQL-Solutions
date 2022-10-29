-- Solution 1: (1678 ms, 0 B)

WITH TEMP AS
(
   SELECT DISTINCT REPORTS_TO
   FROM EMPLOYEES
   WHERE REPORTS_TO IS NOT NULL
), TEMP1 AS
(
   SELECT REPORTS_TO, COUNT(DISTINCT EMPLOYEE_ID) AS REPORTS_COUNT, ROUND(AVG(AGE)) AS AVERAGE_AGE
   FROM EMPLOYEES
   WHERE REPORTS_TO IN (SELECT * FROM TEMP)
   GROUP BY 1
)

SELECT DISTINCT A.EMPLOYEE_ID, NAME, REPORTS_COUNT, AVERAGE_AGE
FROM EMPLOYEES A
LEFT JOIN TEMP1 B
ON A.EMPLOYEE_ID = B.REPORTS_TO
WHERE A.EMPLOYEE_ID IN (SELECT * FROM TEMP)
ORDER BY 1;