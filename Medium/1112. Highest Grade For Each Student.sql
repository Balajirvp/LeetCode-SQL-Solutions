-- Solution 1: (435 ms, 0 B)

SELECT STUDENT_ID, COURSE_ID, GRADE
FROM
(
    SELECT A.*, ROW_NUMBER() OVER (PARTITION BY STUDENT_ID ORDER BY GRADE DESC, COURSE_ID) AS ROW_NUM
    FROM ENROLLMENTS A
) A
WHERE ROW_NUM = 1;