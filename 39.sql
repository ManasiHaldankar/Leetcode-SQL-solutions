/* Question:
Movie Rating

Table: Movies
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 
Table: Users
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.

Table: MovieRating
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.


#Solution:
(select u.name as results from MovieRating m right join Users u
on m.user_id = u.user_id
group by m.user_id
order by count(m.user_id) desc, u.name limit 1)

union all

(select m.title as results from MovieRating mr right join Movies m
on mr.movie_id = m.movie_id
where mr.created_at between '2020-02-01' and '2020-02-29'
group by mr.movie_id
order by avg(mr.rating) desc, m.title limit 1);