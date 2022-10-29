-- Solution 1: (867 ms, 0 B)

SELECT ID, MAX(JAN_REVENUE) AS JAN_REVENUE,
           MAX(FEB_REVENUE) AS FEB_REVENUE,
           MAX(MAR_REVENUE) AS MAR_REVENUE,
           MAX(APR_REVENUE) AS APR_REVENUE,
           MAX(MAY_REVENUE) AS MAY_REVENUE,
           MAX(JUN_REVENUE) AS JUN_REVENUE,
           MAX(JUL_REVENUE) AS JUL_REVENUE,
           MAX(AUG_REVENUE) AS AUG_REVENUE,
           MAX(SEP_REVENUE) AS SEP_REVENUE,
           MAX(OCT_REVENUE) AS OCT_REVENUE,
           MAX(NOV_REVENUE) AS NOV_REVENUE,
           MAX(DEC_REVENUE) AS DEC_REVENUE
FROM
(
    SELECT DISTINCT ID, CASE WHEN MONTH = 'Jan' THEN REVENUE ELSE null END AS JAN_REVENUE, 
                        CASE WHEN MONTH = 'Feb' THEN REVENUE ELSE null END AS FEB_REVENUE,
                        CASE WHEN MONTH = 'Mar' THEN REVENUE ELSE null END AS MAR_REVENUE,
                        CASE WHEN MONTH = 'Apr' THEN REVENUE ELSE null END AS APR_REVENUE,
                        CASE WHEN MONTH = 'May' THEN REVENUE ELSE null END AS MAY_REVENUE,
                        CASE WHEN MONTH = 'Jun' THEN REVENUE ELSE null END AS JUN_REVENUE,
                        CASE WHEN MONTH = 'Jul' THEN REVENUE ELSE null END AS JUL_REVENUE,
                        CASE WHEN MONTH = 'Aug' THEN REVENUE ELSE null END AS AUG_REVENUE,
                        CASE WHEN MONTH = 'Sep' THEN REVENUE ELSE null END AS SEP_REVENUE,
                        CASE WHEN MONTH = 'Oct' THEN REVENUE ELSE null END AS OCT_REVENUE,
                        CASE WHEN MONTH = 'Nov' THEN REVENUE ELSE null END AS NOV_REVENUE,
                        CASE WHEN MONTH = 'Dec' THEN REVENUE ELSE null END AS DEC_REVENUE
    FROM DEPARTMENT
) A
GROUP BY 1;    
                    