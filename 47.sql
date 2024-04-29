/* Question:
Second Highest Salary

Table: Employee
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.

Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).


#Solution:
with cte as
 (select salary , dense_rank() over(order by salary desc) as srank
 from Employee) 
select max(salary) as SecondHighestSalary from cte
where srank = 2;