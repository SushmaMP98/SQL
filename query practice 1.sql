#retrive unique data without using distinct
select columnname
from table1
group by columnname ;

#concatenate
select concat('first_name',' ','last_name') as full_name
from table1;

# to copy a table without changing data and structure
create table new_table as select * from old_table;

#to convert data type of a column
alter table table_name1
modify column_name1 new_datatype;

#retrieve the total count of rows, but only count each distinct 
#value in a column once
select count(distinct(column_name1))
from table1;

#How would you find the three most frequent values in a column along with 
#their counts?
select column_name1, count(column_name1) as counts
from table1
group by column_name1
order by (counts) desc
limit 3;

#Write a query to get the monthly sales amount for the last 12 months
select month(sales_date) as months, year(sales_date) as years, sum(amounts) as monthly_sales
from sales_table
where sales_date between date_sub(now(), interval 12 month) and now() 
group by years, months
order by (years) desc, (months) desc;

#Write a query to find employees who have managers with a salary greater 
#than $100,000.
select e1.*
from employee_table e1
inner join employee_table e2 on e1.manager_id= e2.id
where e2.salary > 100000;








