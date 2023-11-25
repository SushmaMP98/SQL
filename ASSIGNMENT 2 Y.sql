#select all employees in department 10 whose salary is greater than 3000. [table: employee]

SELECT CONCAT(FNAME,' ',LNAME) AS FULL_NAME,
DEPTNO,
SALARY
FROM EMPLOYEE
WHERE DEPTNO = 10 AND SALARY > 3000;

#2. The grading of students based on the marks they have obtained is done as follows:

#40 to 50 -> Second Class
#50 to 60 -> First Class
#60 to 80 -> First Class
#80 to 100 -> Distinctions

#a. How many students have graduated with first class?
#b. How many students have obtained distinction? [table: students]


SELECT *,
CASE WHEN MARKS BETWEEN 40 AND 50 THEN 'SECOND CLASS'
WHEN MARKS BETWEEN 50 AND 80 THEN 'FIRST CLASS'
WHEN MARKS > 80 THEN 'DISTINCTION'
ELSE 'FAIL' END AS 'RESULT'
FROM STUDENTS
ORDER BY  MARKS DESC ;

SELECT *,
CASE WHEN MARKS BETWEEN 40 AND 50 THEN 'SECOND CLASS'
WHEN MARKS BETWEEN 50 AND 80 THEN 'FIRST CLASS'
WHEN MARKS > 80 THEN 'DISTINCTION'
ELSE 'FAIL' END AS 'RESULT'
FROM STUDENTS
WHERE MARKS>80 
ORDER BY  MARKS DESC ;

SELECT *,
CASE WHEN MARKS BETWEEN 40 AND 50 THEN 'SECOND CLASS'
WHEN MARKS BETWEEN 50 AND 80 THEN 'FIRST CLASS'
WHEN MARKS > 80 THEN 'DISTINCTION'
ELSE 'FAIL' END AS 'RESULT'
FROM STUDENTS
WHERE MARKS BETWEEN 50 AND 80
ORDER BY  MARKS DESC ;

#3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station

SELECT CITY,
ID
FROM STATION
WHERE ID MOD 2 = 0
GROUP BY ID;

#4 . Find the difference between the total number of city entries in the table and the number of distinct city entries in the table.
 #In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, 
 #write a query to find the value of N-N1 from station.
#[table: station]

SELECT COUNT(CITY) 
FROM STATION;

SELECT COUNT(DISTINCT CITY)
FROM STATION;

SELECT COUNT(CITY) 
, (SELECT COUNT(DISTINCT CITY) AS DISTINCT_CITY),
COUNT(CITY) - (SELECT COUNT(DISTINCT CITY)) AS COUNTS
FROM STATION;

#35. Answer the following
#a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
 #Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]

SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) REGEXP '[A|E|I|O|U]';

#b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
 #Your result cannot contain duplicates.
SELECT DISTINCT CITY , 
STATE
FROM STATION
WHERE LEFT(CITY,1) REGEXP '[A|E|I|0|U]'
		AND RIGHT(CITY,1) REGEXP '[A|E|I|O|U]'; 
        
#c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT CITY,
STATE
FROM STATION
WHERE LEFT(CITY,1) NOT REGEXP '[A|E|I|O|U]';

#6. Write a query that prints a list of employee names having a salary greater than $2000 per month 
#who have been employed for less than 36 months.
 #Sort your result by descending order of salary. [table: emp]

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME,
HIRE_DATE,
SALARY
FROM EMP 
WHERE HIRE_DATE >= DATE_SUB(CURDATE(),INTERVAL 36 MONTH) AND SALARY > 2000 ;

#7. How much money does the company spend every month on salaries for each department? [table: employee]
SELECT DEPTNO,
SALARY
FROM EMPLOYEE
GROUP BY DEPTNO;

#8. How many cities in the CITY table have a Population larger than 100000. [table: city]
SELECT
COUNT(*)
FROM CITY 
WHERE POPULATION > 100000
;

#9. What is the total population of California? [table: city]
SELECT DISTRICT,
SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'CALIFORNIA'
GROUP BY DISTRICT;

#10. What is the average population of the districts in each country? [table: city]
SELECT DISTRICT,
AVG(POPULATION) AS AVERAGE_POPULATION
FROM ASSIGNMENT.CITY
GROUP BY DISTRICT;

#11. Find the ordernumber, status, customernumber, customername and comments for
# all orders that are ‘Disputed=  [table: orders, customers]
SELECT
O.ORDERNUMBER,
O.STATUS,
O.CUSTOMERNUMBER,
C.CUSTOMERNAME,
O.COMMENTS
FROM ASSIGNMENT.ORDERS O
JOIN ASSIGNMENT.CUSTOMERS C ON O.CUSTOMERNUMBER = C.CUSTOMERNUMBER
WHERE O.STATUS = 'DISPUTED';




