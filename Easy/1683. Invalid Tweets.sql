-- Solution 1: (635 ms, 0 B)

SELECT DISTINCT TWEET_ID
FROM TWEETS
WHERE LENGTH(CONTENT) > 15;