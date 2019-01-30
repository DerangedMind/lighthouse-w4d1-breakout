# W4D1 Breakout - More SQL

- Talk about ERD, primary key and foreign keys
- What is DB normalization

[DB Normalization](http://www.studytonight.com/dbms/database-normalization.php)

## Objectives

- IN clause and Subqueries
- Aggregation with Group By

### Query 1: Get all the album names that have a tag of 'electronic' or 'Dance'

Our main goal here is to find all of the album names where the artist is associated with the tag (or genre) 'electronic' or 'dance'.

To do this, we need to breakdown the problem a bit further. This is my approach to solving this, but that doesn't mean it will be the same for everyone.

#### Breakdown: Get all tags



#### Breakdown: Get all tags with name 'electronic'



#### Breakdown: Get all tags with name 'electronic' or 'dance'



#### Breakdown: Get all artists and their tags



#### Breakdown: Get all artists with tag 'electronic' or 'dance'



#### Breakdown: Get all the album names that have a tag of 'electronic' or 'Dance'



#### Breakdown: Get the number of tags according to each artist



### Query 2: Count the number of artists per albums released after 2000 where the count of album is greater than 1



### Bonus: Using a Subquery, find all albums where the artist has more than two tags
