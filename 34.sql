/* Question:
Product Price at a Given Date

Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.


#Solution:
with cte as(
    select *, rank() over(partition by product_id order by change_date desc) as a
    from Products
    where change_date<= '2019-08-16'
)

select product_id, new_price as price
from cte
where a = 1
union
select product_id, 10 as price
from Products
where product_id not in (select product_id from cte);