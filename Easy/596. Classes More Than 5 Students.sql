-- Solution 1: (345 ms, 0 B)

SELECT DISTINCT CLASS
FROM
(
    SELECT CLASS, COUNT(DISTINCT STUDENT) AS NO_STUDENTS
    FROM COURSES
    GROUP BY 1
) A
WHERE NO_STUDENTS > 4;