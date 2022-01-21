/*1-How many tracks does each album have? 
    Your solution should include Album id and its number of tracks sorted from highest to lowest.*/
	
  SELECT AlbumId,count(AlbumId) AS count_tracs
  FROM tracks
  GROUP BY AlbumId
  ORDER BY count_tracs DESC;
  
/*2-Find the album title of the tracks. Your solution should include track name and its album title.*/

  SELECT tracks.name, albums.Title
  FROM tracks
  LEFT JOIN albums
  ON albums.AlbumId = tracks.AlbumId;
  
/*3-Find the minimum duration of the track in each album. 
  Your solution should include album id, album title and duration of the track sorted from highest to lowest.*/
  
  SELECT albums.AlbumId, albums.Title, MIN(tracks.Milliseconds)
  FROM albums
  INNER JOIN tracks
  ON albums.AlbumId = tracks.AlbumId
  GROUP BY albums.AlbumId
  ORDER BY MIN(tracks.Milliseconds) DESC;
  
/*4-Find the total duration of each album.
  Your solution should include album id, album title and its total duration sorted from highest to lowest.*/
4-SELECT
    albums.AlbumId,
    albums.Title,
    sum(tracks.Milliseconds)
   FROM albums
   INNER JOIN tracks
   ON albums.AlbumId = tracks.AlbumId
   GROUP BY albums.AlbumId
   ORDER BY sum(tracks.Milliseconds) DESC;

/*5- Based on the previous question, find the albums whose total duration is higher than 70 minutes. 
  Your solution should include album title and total duration.*/
    
	SELECT albums.Title, SUM(tracks.Milliseconds) AS total_duration
	FROM tracks
	JOIN albums ON tracks.AlbumId = albums.AlbumId
	GROUP BY tracks.AlbumId
	HAVING total_duration > 4200000
	ORDER BY total_duration DESC;