-- Solution 1: (454 ms, 0 B)

WITH FINAL_CALLS AS
(
   SELECT * FROM CALLS
   UNION
   SELECT RECIPIENT_ID, CALLER_ID, CALL_TIME FROM CALLS
   ORDER BY 1,2
)


SELECT DISTINCT CALLER_ID AS USER_ID
FROM
(
    SELECT CALLER_ID, RECIPIENT_ID, FIRST_VALUE(RECIPIENT_ID) OVER (PARTITION BY CALLER_ID, DATE(CALL_TIME) ORDER BY CALL_TIME, RECIPIENT_ID) AS FIRST_CALL,
                                    FIRST_VALUE(RECIPIENT_ID) OVER (PARTITION BY CALLER_ID, DATE(CALL_TIME) ORDER BY CALL_TIME DESC, RECIPIENT_ID) AS FINAL_CALL
    FROM FINAL_CALLS
) A
WHERE FIRST_CALL = FINAL_CALL
ORDER BY 1;

