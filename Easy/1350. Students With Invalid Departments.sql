-- Solution 1: (695 ms, 0 B)

SELECT DISTINCT ID, NAME 
FROM STUDENTS
WHERE DEPARTMENT_ID NOT IN (SELECT DISTINCT ID FROM DEPARTMENTS);