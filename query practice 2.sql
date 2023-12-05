#How would you get the rank of students based on their scores in descending 
#order

select student_name, score,
dense_rank() over(order by score desc) as ranks
from report_table;

#Find the employees who earn more than the average salary in their 
#respective departments
select e1.id, e1.names, e1.salary, e1.department_id
from salary_table e1
join (select department_id, avg(salary) as average_salary
from salary_table
group by department_id) e2
on e1.department_id = e2.department_id
where e1.salary > e2. average_salary;

#Retrieve all pairs of students who have the same scores
select a.student_name, b.student_name, a.score
from students a, students b
where a.score = b.score
and a.student_name != b.student_name;

#Write a query to retrieve the last 7 days' records, excluding weekends
select *
from sales
where sale_date between date_sub(curdate(),interval 7 day) and curdate()
and dayofweek(sale_date) not in (1,7);

 #Find the employees who have the same job roles in different departments.
 select e1.employee_name, e1.job, e1.department, e2.department
 from employees e1
 where e1.job=e2.job
 and e2. department != e1.department;
 
#Retrieve the total sales amount, but replace null values with zeros
select sum(amount) as total,coalesce(total,0)
from sales

#How would you retrieve the name and salary of the top 3 earning 
#employees
select names, salary
from(
select name, salary, dense_rank() over(order by salary desc) as rnk from employees) as rank_table
where rnk <= 3;







