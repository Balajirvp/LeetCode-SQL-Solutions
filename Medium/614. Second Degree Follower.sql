-- Solution 1: (367 ms, 0 B)

WITH FOLLOWERS AS
(
    SELECT FOLLOWEE, COUNT(FOLLOWER) AS FOLLOWERS
    FROM FOLLOW
    GROUP BY 1
),
FOLLOWEES AS
(  
    SELECT FOLLOWER, COUNT(FOLLOWEE) AS FOLLOWEES
    FROM FOLLOW
    GROUP BY 1
),
NAMES AS
(
  SELECT DISTINCT FOLLOWEE FROM FOLLOW
  UNION
  SELECT DISTINCT FOLLOWER FROM FOLLOW

)

SELECT DISTINCT FOLLOWEE AS FOLLOWER, FOLLOWERS AS NUM
FROM
(
    SELECT A.FOLLOWEE, FOLLOWERS, FOLLOWEES
    FROM NAMES A
    LEFT JOIN FOLLOWERS B
    ON A.FOLLOWEE = B.FOLLOWEE
    LEFT JOIN FOLLOWEES C
    ON A.FOLLOWEE = C.FOLLOWER
) A
WHERE FOLLOWERS >= 1 AND FOLLOWEES >= 1
ORDER BY 1;