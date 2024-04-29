/* Question:
Fix Names in a Table

Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 
Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.


#Solution:
select user_id, concat((left(upper(name),1)),(right(lower(name), length(name)-1))) as name from Users
order by user_id;