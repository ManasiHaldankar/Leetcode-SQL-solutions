/* Question:
Consecutive Numbers

Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 
Find all numbers that appear at least three times consecutively.

Return the result table in any order.


#Solution:
with cte as(
            select num, lead(num,1) over() as num1, lead(num,2) over() as num2 from logs
)
select distinct num ConsecutiveNums from cte where (num=num1) and (num=num2);