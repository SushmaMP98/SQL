DROP DATABASE JOINSDATA;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
SELECT *
FROM CUSTOMERS;
SELECT *
FROM ORDERS;

SELECT ID
FROM CUSTOMERS
WHERE LAST_NAME = 'MICHAEL';

SELECT *
FROM ORDERS
WHERE ID = 2;

SELECT *
FROM CUSTOMERS, ORDERS;
 
 SELECT *
 FROM CUSTOMERS
 JOIN ORDERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.ID;
 
 SELECT FIRST_NAME, LAST_NAME,ORDER_DATE
 FROM CUSTOMERS
 JOIN ORDERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.ID;
 
 SELECT *
 FROM ORDERS
 JOIN CUSTOMERS ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;
 
 Create table Students (
 ID int primary key auto_increment ,
 first_name varchar(100) );
 
 Create table Papers (
 title varchar(100),
 grade char(2), 
 student_id int,
 foreign key (student_id) references students(ID));
 
 Drop table papers;
 
 INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

Select *
From papers;

select *
From Students;

select first_name,
		title,
        grade
from students
join papers on papers.student_id = students.id;

select first_name,
		ifnull(title,'null'),
	grade
from students
left join papers on students.id = papers.student_id;

select first_name ,
		ifnull(title,'null'),
        ifnull(grade,0)
from students
left join papers on papers.student_id = students.id;

select first_name,
		avg(grade)
from students
left join papers on papers.student_id = students.id
group by first_name;

select first_name,
		avg(grade),
        case when avg(grade) > 85 then 'passing' else 'failing' end as status
from students
left join papers on papers.student_id = students.id
group by first_name
order by avg(grade) desc;

CREATE TABLE REVIEWERS(
ID INT PRIMARY KEY AUTO_INCREMENT, 
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50));

CREATE TABLE SERIES(
ID INT PRIMARY KEY AUTO_INCREMENT,
TITLE VARCHAR(50),
RELEASED_YEAR DATETIME,
GENRE VARCHAR(50));

ALTER TABLE SERIES
ADD RELEASED_YEAR YEAR;

CREATE TABLE REVIEWS(
ID INT PRIMARY KEY AUTO_INCREMENT,
RATING INT ,
SERIES_ID INT,
REVIEWER_ID INT,
FOREIGN KEY (SERIES_ID) REFERENCES SERIES(ID),
FOREIGN KEY (REVIEWER_ID) REFERENCES REVIEWERS(ID));
 
 ALTER TABLE REVIEWS 
 MODIFY RATING DECIMAL (2,1);
 
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
    
    INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
    INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    SELECT TITLE,
    RATING
	FROM SERIES
    JOIN REVIEWS ON REVIEWS.SERIES_ID = SERIES.ID
    ORDER BY TITLE ASC LIMIT 15;
    
    SELECT *
    FROM REVIEWS;
    
    SELECT TITLE,
    AVG(RATING)
    FROM SERIES
    JOIN REVIEWS ON SERIES.ID = REVIEWS.SERIES_ID
    GROUP BY TITLE
    ORDER BY AVG(RATING) ASC LIMIT 12;
    
    SELECT FIRST_NAME,
    LAST_NAME,
    RATING
    FROM REVIEWERS
    JOIN REVIEWS ON REVIEWERS.ID = REVIEWS. REVIEWER_ID
    ;
    
    SELECT TITLE,
			RATING
    FROM SERIES
    LEFT JOIN REVIEWS ON SERIES.ID = REVIEWS.REVIEWER_ID
    WHERE RATING IS NULL;
    
    SELECT GENRE,
			AVG(RATING)
    FROM SERIES
    JOIN REVIEWS ON SERIES.ID = REVIEWS.SERIES_ID
    GROUP BY GENRE;
    
    SELECT FIRST_NAME,
    LAST_NAME,
    COUNT(RATING) AS COUNT,
    IFNULL(MIN(RATING),0) AS MIN,
    IFNULL(MAX(RATING),0) AS MAX,
    IFNULL(AVG(RATING),0) AS AVERAGE,
    CASE WHEN RATING IS NULL THEN 'INACTIVE' ELSE 'ACTIVE' END AS 'STATUS'
    FROM REVIEWERS
    LEFT JOIN REVIEWS ON REVIEWERS.ID = REVIEWS.REVIEWER_ID 
    GROUP BY FIRST_NAME,LAST_NAME;
    
    SELECT *
FROM SERIES, REVIEWERS, REVIEWS;

SELECT TITLE,
RATING,
CONCAT_WS(FIRST_NAME,LAST_NAME) AS REVIEWRS_1
FROM REVIEWERS
JOIN REVIEWS ON REVIEWERS.ID = REVIEWS.REVIEWER_ID
JOIN SERIES ON SERIES.ID = REVIEWS.SERIES_ID;

SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviewers
        INNER JOIN
    reviews ON reviews.reviewer_id = reviewers.id
        INNER JOIN
    series ON reviews.series_id = series.id;
    


