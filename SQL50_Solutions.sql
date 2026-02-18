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



/* ====================================================
   DAY 2 – AGGREGATION (GROUP BY + HAVING + JOIN)
   ==================================================== */


/* 7. 586 - Customer Placing the Largest Number of Orders
   Concept: GROUP BY + COUNT + ORDER BY + LIMIT
*/

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;



/* 8. 596 - Classes More Than 5 Students
   Concept: GROUP BY + HAVING
*/

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;



/* 9. 1251 - Average Selling Price
   Concept: JOIN + GROUP BY + AVG
*/

SELECT p.product_id,
       ROUND(SUM(p.price * u.units) / SUM(u.units), 2) AS average_price
FROM Prices p
JOIN UnitsSold u
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;


/* ====================================================
   DAY 3 – JOINS PRACTICE
   ==================================================== */


/* ----------------------------------------------------
   175. Combine Two Tables
   Concept: LEFT JOIN
   ---------------------------------------------------- */

SELECT p.firstName, 
       p.lastName, 
       a.city, 
       a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;



/* ----------------------------------------------------
   181. Employees Earning More Than Their Managers
   Concept: SELF JOIN (INNER JOIN)
   ---------------------------------------------------- */

SELECT e.name
FROM Employee e
INNER JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;



