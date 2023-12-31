#select
#from
#where
#having
#order by
#limit

SELECT DISTINCT DEPARTMENT AS DEPT
FROM EMPLOYEES.EMPLOYEES;

SELECT COUNT(DISTINCT DEPARTMENT) AS NUMBER_OF_DEPTS
FROM EMPLOYEES.EMPLOYEES; 

SELECT DEPARTMENT
FROM EMPLOYEES.EMPLOYEES
GROUP BY DEPARTMENT;

#AGGREGATE FUNCTION (SUM,AVG,MAX,MIN,COUNT)

SELECT COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEES.EMPLOYEES;

SELECT COUNT(*) AS COUNTNULLS
FROM MOVIES.FILM
WHERE BOXOFFICEDOLLARS IS NULL;

SELECT DEPARTMENT,
COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEES.EMPLOYEES
GROUP BY DEPARTMENT
ORDER BY 'NUMBER_OF_EMPLOYEES' DESC
;

SELECT DEPARTMENT,
STATUS,
COUNT(*) AS COUNT_OF_EMPLOYEES
FROM EMPLOYEES.EMPLOYEES
GROUP BY DEPARTMENT,STATUS
ORDER BY DEPARTMENT,STATUS;

SELECT DEPARTMENT,
STATUS,
COUNT(*) AS COUNT_OF_EMPLOYEES,
MAX(SALARY) AS MAX_SALARY,
MIN(SALARY) AS MIN_SALARY,
AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES.EMPLOYEES
GROUP BY DEPARTMENT,STATUS
ORDER BY DEPARTMENT,STATUS;

SELECT BUILDING,
DEPARTMENT,
COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEES.EMPLOYEES
GROUP BY DEPARTMENT, BUILDING;

SELECT DEPARTMENT,
STATUS,
COUNT(*) AS COUNT_OF_EMPLOYEES,
GROUP_CONCAT(CONCAT(FIRST,' ',LAST)) AS EMPLIST,
MAX(SALARY) AS MAX_SALARY,
MIN(SALARY) AS MIN_SALARY,
AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES.EMPLOYEES
WHERE JOBRATING = 1
GROUP BY DEPARTMENT,STATUS
ORDER BY DEPARTMENT,STATUS;

#COUNT NUMBER OF FILMS WHICH WON 0 OSCARS, 1 OSCARS, 2 OSCARS AND SO ON , SORT IT FROM HIGHEST TO LOWESTOSCARS
SELECT TITLE,
OSCARWINS,
COUNT(*) AS NUMBER_OF_MOVIES
FROM MOVIES.FILM
GROUP BY OSCARWINS
ORDER BY OSCARWINS DESC;

#FIND THE MOST COMMON FAMILY NAME AMONG ALL ACTORS

SELECT COUNT(*) AS NUMBER_OF_TIMES,
FAMILYNAME
FROM MOVIES.ACTOR
GROUP BY FAMILYNAME
ORDER BY NUMBER_OF_TIMES DESC;

#FIND THE COUNT OF EMPLOYEES GROUPING BY STATUS AND JOBRATING
SELECT COUNT(*) AS COUNT_OF_EMPLOYEES,
STATUS,
JOBRATING
FROM EMPLOYEES.EMPLOYEES
GROUP BY STATUS,JOBRATING;

#FIND THE NUMBER OF EMPLOYEES HIRED EACH YEAR
SELECT FIRST,
YEAR(HIREDATE) AS YR,
COUNT(*) AS 'NUMBER_OF_EMPLOYEES'
FROM EMPLOYEES.EMPLOYEES
GROUP BY YR;


SELECT 
CASE
WHEN BOXOFFICEDOLLARS > BUDGETDOLLARS THEN 'HIT_FILM'
ELSE 'FLOP_FILM' END AS MOVIE_STATUS,
COUNT(*) AS NUMBER_OF_FILMS
FROM MOVIES.FILM
GROUP BY MOVIE_STATUS;


SELECT GENREID,
CASE
WHEN BOXOFFICEDOLLARS > BUDGETDOLLARS THEN 'HIT_FILM'
ELSE 'FLOP_FILM' END AS MOVIE_STATUS,
COUNT(*) AS NUMBER_OF_FILMS
FROM MOVIES.FILM
GROUP BY GENREID, MOVIE_STATUS
ORDER BY GENREID;

SELECT GENREID,
COUNT(CASE WHEN BOXOFFICEDOLLARS > BUDGETDOLLARS THEN 'HIT_FILM' END) AS NUMBER_OF_HITFILMS ,
COUNT(CASE WHEN BOXOFFICEDOLLARS < BUDGETDOLLARS THEN 'FLOP_FILM' END) AS NUMBER_OF_FLOPFILMS
FROM MOVIES.FILM
GROUP BY GENREID
ORDER BY GENREID;


SELECT BUILDING,
COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEES.EMPLOYEES
GROUP BY BUILDING
HAVING NUMBER_OF_EMPLOYEES >70;


 
 













































