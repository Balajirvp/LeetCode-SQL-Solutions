-- Solution 1: (593 ms,	0 B)

SELECT * FROM USERS 
WHERE MAIL REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$';