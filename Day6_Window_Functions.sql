/*
========================================
DAY 6 - Window Functions & Advanced Queries
========================================

Problems Solved:
1. 1729 - Find Followers Count
2. 180  - Consecutive Numbers
3. 2356 - Number of Unique Subjects Taught by Each Teacher

Topics Covered:
- GROUP BY
- COUNT()
- DISTINCT
- LAG()
- Window Functions
========================================
*/

--------------------------------------------------
-- 1️⃣ 1729 - Find Followers Count
--------------------------------------------------

SELECT 
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;


--------------------------------------------------
-- 2️⃣ 180 - Consecutive Numbers (Window Function)
--------------------------------------------------

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LAG(num, 1) OVER(ORDER BY id) AS prev1,
        LAG(num, 2) OVER(ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1
AND num = prev2;


--------------------------------------------------
-- 3️⃣ 2356 - Number of Unique Subjects Taught by Each Teacher
--------------------------------------------------

SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
