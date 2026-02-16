/*
====================================================
LEETCODE SQL 50 PRACTICE
Author: Swati Kumari
Goal: Data Analyst Interview Preparation
====================================================
*/


/* ============================
   DAY 1 – BASIC FILTERING
   ============================ */


/* 1. Recyclable and Low Fat Products
   Concept: WHERE + AND
*/

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';



/* 2. Find Customer Referee
   Concept: NULL handling + WHERE
*/

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;



/* 3. Big Countries
   Concept: OR condition
*/

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;



/* 4. Invalid Tweets
   Concept: LENGTH / CHAR_LENGTH
*/

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;



/* 5. Article Views I
   Concept: DISTINCT + WHERE
*/

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;



/* 6. Replace Employee ID With The Unique Identifier
   Concept: LEFT JOIN
*/

SELECT u.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI u
ON e.id = u.id;

