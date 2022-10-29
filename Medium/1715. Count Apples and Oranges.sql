-- Solution 1: (884 ms, 0 B)

SELECT APP1 + APP2 AS APPLE_COUNT, ORG1 + ORG2 AS ORANGE_COUNT
FROM
(
    SELECT COALESCE(SUM(APPLE_COUNT),0) AS APP1, COALESCE(SUM(APP),0) AS APP2, 
           COALESCE(SUM(ORANGE_COUNT),0) AS ORG1, COALESCE(SUM(ORG),0) AS ORG2
    FROM
    (
        SELECT A.*, B.APPLE_COUNT AS APP, B.ORANGE_COUNT AS ORG
        FROM BOXES A
        LEFT JOIN CHESTS B
        ON A.CHEST_ID = B.CHEST_ID
    ) A
) A ;