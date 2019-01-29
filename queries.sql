SELECT *                   
FROM tags, artists, artists_tags
WHERE artists_tags.artist_id = artists.id
  AND artists_tags.tag_id = tags.id
  AND tags.name = 'electronic';

SELECT albums.title, artists.name
FROM albums
INNER JOIN artists
ON artists.id = albums.artist_id
INNER JOIN artists_tags
ON artists_tags.artist_id = artists.id
INNER JOIN tags
ON artists_tags.tag_id = tags.id
WHERE tags.name = 'electronic' or tags.name = 'dance';

SELECT artists.name, count(*) as nb_of_tags
FROM artists
INNER JOIN artists_tags
ON artists_tags.artist_id = artists.id
INNER JOIN tags
ON artists_tags.tag_id = tags.id
WHERE tags.name IN ('electronic', 'instrumental')
GROUP BY artists.name
HAVING count(*) >= 2;

SELECT artists.name, count(*) as nb_of_tags
FROM artists
INNER JOIN artists_tags
ON artists_tags.artist_id = artists.id
INNER JOIN tags
ON artists_tags.tag_id = tags.id
WHERE tags.name IN (SELECT name from tags where id > 2)
GROUP BY artists.name;


### Query: Count the number of artists per albums released after 2000 where the count of album is greater than 1

SELECT artists.name, count(albums.id)
FROM albums
INNER JOIN artists
ON artists.id = albums.artist_id
WHERE albums.year > 2000
GROUP BY artists.name
HAVING count(albums.id) > 2;

### Query: Get all the tracks for each album by artist was released after 2000,
### and the total number of albums per artists of greather than 1.

```Query
SELECT tracks.number, tracks.title, albums.title
FROM tracks
INNER JOIN albums
ON tracks.album_id = albums.id
WHERE albums.artist_id IN (
  SELECT artists.id
  from artists
  inner join albums
  on artists.id = albums.artist_id
  WHERE albums.year > 2000
  GROUP by artists.id
  HAVING count(albums.id) > 1
);

```