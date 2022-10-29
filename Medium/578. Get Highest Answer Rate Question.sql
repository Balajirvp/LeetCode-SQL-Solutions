-- Solution 1: (267 ms, 0 B)

SELECT DISTINCT QUESTION_ID AS SURVEY_LOG
FROM
(
    SELECT A.*, ROW_NUMBER() OVER (ORDER BY RATE DESC, QUESTION_ID) AS ROW_NUM
    FROM
    (
        SELECT QUESTION_ID, ANS_CNT/SHOW_CNT AS RATE
        FROM
        (
                SELECT QUESTION_ID, COUNT(CASE WHEN ACTION = 'answer' THEN ID END) AS ANS_CNT,
                                    COUNT(CASE WHEN ACTION = 'show' THEN ID END) AS SHOW_CNT                    
                FROM SURVEYLOG
                GROUP BY 1
        ) A    
    ) A    
) A
WHERE ROW_NUM = 1;