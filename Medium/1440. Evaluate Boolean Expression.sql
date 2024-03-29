-- Solution 1: (1105 ms, 0 B)

SELECT LEFT_OPERAND, OPERATOR, RIGHT_OPERAND, 
       CASE WHEN OPERATOR = '>' THEN
            (CASE WHEN LEFT_VAL > RIGHT_VAL THEN 'true' ELSE 'false' END)
            WHEN OPERATOR = '<' THEN
            (CASE WHEN LEFT_VAL < RIGHT_VAL THEN 'true' ELSE 'false' END)
            WHEN OPERATOR = '=' THEN
            (CASE WHEN LEFT_VAL = RIGHT_VAL THEN 'true' ELSE 'false' END) END AS VALUE
FROM
(
    SELECT A.*, B.VALUE AS LEFT_VAL, C.VALUE AS RIGHT_VAL
    FROM EXPRESSIONS A
    LEFT JOIN VARIABLES B
    ON A.LEFT_OPERAND = B.NAME
    LEFT JOIN VARIABLES C
    ON A.RIGHT_OPERAND = C.NAME
) A ;