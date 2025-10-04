--Задание 2

-- 1. Название и продолжительность самого длительного трека

SELECT track_title, duration_in_second
FROM tracks
WHERE duration_in_second = (
   SELECT MAX(duration_in_second) FROM tracks
);

-- 2. Название треков, продолжительность которых не менее 3,5 минут.
select track_title from tracks
where duration_in_second > 209

ALTER TABLE albums ADD COLUMN year INT;

UPDATE albums
SET year =
CASE 
   WHEN id = 1 THEN 2019
   WHEN id = 2 THEN 2018
   WHEN id = 3 THEN 2020
   WHEN id = 4 THEN 2023
   WHEN id = 5 THEN 2018
   WHEN id = 6 THEN 2019
   WHEN id = 7 THEN 2015
   WHEN id = 8 THEN 2014
   when id = 9 THEN 2018
   WHEN id = 10 THEN 2019
   WHEN id = 11 THEN 2019
   WHEN id = 12 THEN 2018
   WHEN id = 13 THEN 2020
   WHEN id = 14 THEN 2023
   WHEN id = 15 THEN 2018
   WHEN id = 16 THEN 2019
   WHEN id = 17 THEN 2015
   WHEN id = 18 THEN 2014
   WHEN id = 19 THEN 2018
   WHEN id = 20 THEN 2018
   WHEN id = 21 THEN 2021
   WHEN id = 22 THEN 2022
   WHEN id = 23 THEN 2020
   WHEN id = 24 THEN 2018
   WHEN id = 25 THEN 2018
   WHEN id = 26 THEN 2017
   WHEN id = 27 THEN 2019
END;
 
UPDATE collections SET year_of_release = '2018-01-01' WHERE id = 1;
UPDATE collections SET year_of_release = '2019-01-01' WHERE id = 2;
UPDATE collections SET year_of_release = '2020-01-01' WHERE id = 3;
UPDATE collections SET year_of_release = '2021-01-01' WHERE id = 4;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
select collection_title from collections
where year_of_release between '2018-01-01' and '2020-12-31'

-- 4. Исполнители, чьё имя состоит из одного слова
select name from artists
where name not like '% %'

-- 5. Название треков, которые содержат слово «мой» или «my»
select track_title from tracks
where track_title LIKE '%мой%' or track_title like '%my%'

--Задание 3

-- 6. Количество исполнителей в каждом жанре
select g.name, count(distinct a.artist_id) from genres g 
join artistsgenres a on g.id = a.genre_id 
group by g."name" 

-- 7. Количество треков, вошедших в альбомы 2019–2020 годов
	select count(*) as track_count from tracks t
	join albums a on t.id = a.id
	where a.year between 2019 and 2020
	
	
-- 8. Средняя продолжительность треков по каждому альбому
SELECT 
    a.id AS album_id,
    ROUND(SUM(t.duration_in_second) / COUNT(t.id)) AS avg_duration_per_track
FROM 
    albums a
JOIN 
    tracks t ON a.id = t.album_id
GROUP BY 
    a.id
ORDER BY 
    a.id; 

 -- 9. Все исполнители, которые не выпустили альбомы в 2020 году
select distinct art.name  from artists art 
left join artistsalbums aa on art.id = aa.artist_id
left join albums a on aa.album_id = a.id and a.year != 2020
where a.id is null 

-- 10. Названия сборников, в которых присутствует конкретный исполнитель

	select distinct cs.collection_title as name_collection from artists a   
 	left join artistsalbums aa on a.id = aa.artist_id
 	left join albums al on aa.album_id = al.id
 	left join tracks t on al.id = t.id 
 	left join trackcollection tr on t.id = tr.track_id
 	left join collections cs on tr.collection_id = cs.id 
 	where a.name = 'Scorpions' and cs.collection_title is not null

--Задание 4

-- 11. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT al.album_title AS name_album
FROM albums al
JOIN artistsalbums aa ON al.id = aa.album_id
JOIN artists a ON aa.artist_id = a.id
JOIN artistsgenres ag ON a.id = ag.artist_id
JOIN genres g ON ag.genre_id = g.id
GROUP BY al.album_title
HAVING COUNT(DISTINCT g.id) > 1;

-- 12. Наименования треков, которые не входят в сборники


select track_title as name_track from tracks t 
left join trackcollection tc on t.id = tc.track_id
where tc.collection_id is null
group by t.track_title, tc.collection_id


-- 13. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.

SELECT ar.name AS name_artist
FROM tracks t
JOIN albums a ON t.album_id = a.id
JOIN artistsalbums aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
WHERE t.duration_in_second = (
    SELECT MIN(duration_in_second)
    FROM tracks
)
GROUP BY ar.name;


-- 14. Названия альбомов, содержащих наименьшее количество треков

SELECT al.album_title  AS album_title, COUNT(*) AS number_of_tracks
FROM tracks t
JOIN albums al ON t.album_id = al.id
GROUP BY al.album_title 
having COUNT(*) >= (
    SELECT COUNT(*)
    FROM tracks t
    JOIN albums al ON t.album_id  = al.id
    GROUP BY al.id
    ORDER BY COUNT(*) ASC
    LIMIT 1
);

