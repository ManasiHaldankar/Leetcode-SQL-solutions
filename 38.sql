/* Question:
Exchange Seats

Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 
Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.


#Solution:
select (case when id % 2 = 1 and id != (select max(id) from Seat)then (id+1) when id % 2 = 0 then id-1 else id end) as id, student from Seat
order by id;