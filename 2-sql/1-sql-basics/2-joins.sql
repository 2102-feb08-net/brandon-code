SELECT * FROM Album;

-- every album by "Various Artists", without joins
SELECT ArtistId
FROM Artist
WHERE Name = 'Various Artists';
-- ...now that i know it's 21
SELECT *
FROM Album
WHERE ArtistId = 21;
-- data is spread across two tables, so, two queries

-- we have joins to allow a query that accesses several tables at once.

-- refer to image "cross-join.png"

-- pair every employee with every other employee
-- maybe for 360 degree performance reviews
SELECT *
FROM Employee AS e1 CROSS JOIN Employee AS e2
WHERE e1.EmployeeId != e2.EmployeeId;
-- cross join not sure common
--   maybe... a table of all possible sandwiches
--    bread cross join meat cross join cheese cross join topping cross join topping

-- refer to image "inner-left-right-full-join.png"

-- every album by artist with joins
SELECT al.Title, ar.Name
FROM Artist AS ar
	INNER JOIN Album AS al ON ar.ArtistId = al.ArtistId;
-- match each artist with each album, IF the artist IDs are the same.
-- (if any artist has no albums, he won't appear in the results)

-- every artist and the albums they have in the database, if any.
SELECT al.Title, ar.Name
FROM Artist AS ar LEFT JOIN Album AS al
	ON ar.ArtistId = al.ArtistId;
-- more results in this version, because all the artists with no albums are paired up with NULL.

-- all rock songs, showing the name in the format 'ArtistName - SongName'

SELECT COALESCE(ar.Name, 'n/a') + ' - ' + t.Name AS Song
FROM Track AS t
	INNER JOIN Genre ON Genre.GenreId = t.GenreId
	LEFT JOIN Album AS al ON t.AlbumId = al.AlbumId
	LEFT JOIN Artist AS ar ON al.ArtistId = ar.ArtistId
WHERE Genre.Name = 'Rock';
-- it turns out every track does have an album & artist...
-- but if one didn't, we'd still want to have it in the results. thus, left joins.

-- if there might be a null, we have a few ways to deal with that.
-- '= NULL' is always false, even NULL = NULL is false.
-- we use "IS NULL" and "IS NOT NULL" to check.
-- COALESCE(thing-that-might-be-null, replacement-if-it-is-null) lets you handle the null case


-- join exercises (Chinook database)

-- 1. show all invoices of customers from brazil (mailing address not billing)
SELECT inv.*
FROM Invoice AS inv INNER JOIN Customer AS cu ON inv.CustomerId = cu.CustomerId
WHERE cu.Country = 'Brazil'

-- 2. show all invoices together with the name of the sales agent of each one
SELECT inv.*, emp.FirstName + ' ' + emp.LastName AS [Sales Agent]
FROM Invoice AS inv
	INNER JOIN Customer AS cu ON cu.CustomerId = inv.CustomerId
	INNER JOIN Employee AS emp ON emp.EmployeeId = cu.SupportRepId

-- 3. show all playlists ordered by the total number of tracks they have
SELECT 
FROM PlaylistTrack INNER JOIN Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
GROUP BY Playlist.PlaylistId, PlaylistTrack.PlaylistId

-- 4. which sales agent made the most in sales in 2009?

-- 5. how many customers are assigned to each sales agent?

-- 6. which track was purchased the most since 2010?

-- 7. show the top three best-selling artists.

-- 8. which customers have the same initials as at least one other customer?
