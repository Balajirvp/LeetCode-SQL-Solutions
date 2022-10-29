-- Solution 1: (216 ms,	0 B)

WITH AMERICA AS
(
   SELECT DISTINCT NAME AS AMERICA, ROW_NUMBER () OVER (ORDER BY NAME) AS R_N
   FROM STUDENT
   WHERE CONTINENT = 'America'
), ASIA AS
(
   SELECT DISTINCT NAME AS ASIA, ROW_NUMBER () OVER (ORDER BY NAME) AS R_N
   FROM STUDENT
   WHERE CONTINENT = 'Asia'
), EUROPE AS
(
   SELECT DISTINCT NAME AS EUROPE, ROW_NUMBER () OVER (ORDER BY NAME) AS R_N
   FROM STUDENT
   WHERE CONTINENT = 'Europe'
)

SELECT A.AMERICA, B.ASIA, C.EUROPE
FROM AMERICA A
LEFT JOIN ASIA B 
ON A.R_N = B.R_N
LEFT JOIN EUROPE C
ON A.R_N = C.R_N;
