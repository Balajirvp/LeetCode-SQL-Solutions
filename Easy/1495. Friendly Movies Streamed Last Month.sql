-- Solution 1: (890 ms, 0 B)

SELECT DISTINCT B.TITLE
FROM TVPROGRAM A
LEFT JOIN CONTENT B
ON A.CONTENT_ID = B.CONTENT_ID 
WHERE KIDS_CONTENT = 'Y' AND CONTENT_TYPE = 'Movies' AND PROGRAM_DATE >= '2020-06-01' AND PROGRAM_DATE <= '2020-06-30';