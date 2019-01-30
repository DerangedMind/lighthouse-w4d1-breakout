# W4D1 Breakout - More SQL

- Talk about ERD, primary key and foreign keys
- What is DB normalization

[DB Normalization](http://www.studytonight.com/dbms/database-normalization.php)

## Objectives

- IN clause and Subqueries
- Aggregation with Group By

### Query: Get all tags

```
SELECT name FROM tags;
```

### Query: Get all tags with name 'electronic'

```
SELECT * FROM tags
  WHERE name = 'electronic';
```

### Query: Get all tags with name 'electronic' OR 'dance'

```
SELECT name FROM tags
  WHERE name = 'electronic' OR name = 'dance';
```

### Query: Get all artists and their tags

```
SELECT *
  FROM artists
  INNER JOIN artists_tags
    ON artists.id = artists_tags.artist_id
  INNER JOIN tags
    ON artists_tags.tag_id = tags.id;
```

### Query: Get all artist names with tag 'electronic' or 'dance'

```
SELECT artists.name as artist_name, tags.name as tags_name
  FROM artists
  INNER JOIN artists_tags
    ON artists.id = artists_tags.artist_id
  INNER JOIN tags
    ON artists_tags.tag_id = tags.id
  WHERE tags.name = 'electronic' OR tags.name = 'dance';
```

### Query: Get the number of tags according to each artist

```
SELECT artists.name as artist_name, tags.name as tags_name
  FROM artists
  INNER JOIN
  INNER JOIN artists_tags
    ON artists.id = artists_tags.artist_id
  INNER JOIN tags
    ON artists_tags.tag_id = tags.id
  WHERE tags.name = 'electronic' OR tags.name = 'dance';
```

### Query: Get all the albums that have a tag of 'electronic' or 'Dance'

```SQL Query
  SELECT DISTINCT albums.title
  FROM albums
  INNER JOIN artists
  ON albums.artist_id = artists.id
  INNER JOIN artists_tags
  ON artists.id = artists_tags.artist_id
  INNER JOIN tags
  ON artists_tags.tag_id = tags.id
  WHERE tags.name IN ('electronic','dance','instrumental');
```

- OR
- IN

```SQL Query
SELECT
```

### Query: Get the number of tags according to each artist

```SQL Query
SELECT artists.name, artists.id, count(artists_tags.tag_id)
FROM artists
INNER JOIN artists_tags
ON artists.id = artists_tags.artist_id
GROUP BY artists.id, artists.name;
```

- group by
- having

### Query: Count the number of artists per albums released after 2000 where the count of album is greater than 1

```SQL Query
SELECT artists.name,  count(albums.id)
  FROM albums
  INNER JOIN artists
  ON albums.artist_id = artists.id
  GROUP BY artists.name
  HAVING count(albums.id) > 1;
```

### Using a Subquery, find all albums where the artist has more than two tags

```SQL Query
  SELECT DISTINCT albums.title
  FROM albums
  INNER JOIN artists
  ON albums.artist_id = artists.id
  INNER JOIN artists_tags
  ON artists.id = artists_tags.artist_id
  WHERE artists_tags.tag_id IN (

    SELECT id from tags where id > 2

  );
```

- Subquery with IN
- filter the subquery with where
