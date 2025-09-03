create table if not exists Artists(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);
create table if not exists Genres(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);
create table if not exists ArtistsGenres(
	artist_id INTEGER references Artists(id),
	genre_id INTEGER references Genres(id)
);
create table if not exists Albums(
	id SERIAL PRIMARY key,
	album_title VARCHAR(40) NOT null,
	duration_in_second numeric not null
);
create table if not exists ArtistsAlbums(
	artist_id INTEGER references Artists(id),
	album_id INTEGER references Albums(id)
);

create table if not exists Tracks(
	id SERIAL PRIMARY key references Albums(id),
	track_title VARCHAR(40) NOT null,
	duration_in_second numeric not null
);
create table if not exists TrackCollection(
	track_id INTEGER references Tracks(id),
	collection_id INTEGER references Collections(id)
);
create table if not exists Collections(
	id SERIAL PRIMARY key,
	collection_title VARCHAR(40) NOT null,
	year_of_release date not null
);

insert into artistsgenres (artist_id, genre_id)
values (2, 17),
	   (2, 20),
	   (3, 18),
	   (4, 18),
	   (5, 17),
	   (5, 19);
insert into albums (album_title, duration_in_second)
values ('Past Masters', 2700),
	   ('Let It Be', 2100),
	   ('Help!', 1920),
	   ('Abbey Road', 2760),
	   ('Meet the Beatles!', 1560),
	   ('Revolver', 2100);

insert into albums (album_title, duration_in_second)
values ('Thriller', 2520),
	   ('Bad', 2760),
	   ('Dangerous', 4260),
	   ('Past, Present and Future, Book I', 4140),
	   ('Bad', 2760),
	   ('Like a Virgin', 2340),
	   ('Confessions on a Dance Floor', 3420),
	   ('I am Breathless', 2700),
	   ('Music', 3120),
	   ('You are My Best Friend', 2160),
	   ('A Night at the Opera', 2340),
	   ('News of the World', 2280),
	   ('The Game', 2280),
	   ('Jazz', 2400),
	   ('A Day at the Races', 2220),
	   ('Hot Space', 2340),
	   ('Love at First Sting', 2340),
	   ('Lovedrive', 2340),
	   ('Crazy World', 2760),
	   ('Blackout', 2280),
	   ('Savage Amusement', 2460);
	   
insert into artistsalbums (artist_id, album_id)
values (2,1),
	   (2,2),
	   (2,3),
	   (2,4),
	   (2,5),
	   (2,6),   
	   (3,7),
	   (3,7),
	   (3,8),
	   (3,9),
	   (3,10),
	   (3,11),
	   (4,12),
	   (4,12),
	   (4,13),
	   (4,14),
	   (4,15),
	   (4,16);
	  
insert into artists (name)
values ('Scorpions')

insert into artistsalbums (artist_id, album_id)
values (5,17),
	   (5,18),
	   (5,19),
	   (5,20),
	   (5,21),
	   (5,22),   
	   (6,23),
	   (6,24),
	   (6,25),
	   (6,26),
	   (6,27),
	   (6,27);

insert into tracks (track_title, duration_in_second, album_id)
	values ('Hey Jude', 431, 1),
		   ('Let It Be', 241, 2),
		   ('Yesterday', 124, 3),
		   ('Come Together', 259, 4),
		   ('I Want to Hold Your Hand', 143, 5),
		   ('Eleanor Rigby', 128, 6),
		   ('Billie Jean', 294, 7),
		   ('Beat It', 258, 7),
		   ('Smooth Criminal', 248, 8),
		   ('Black or White', 254, 9),
		   ('Earth Song', 423, 10),
		   ('Man in the Mirror', 303, 8),
		   ('Like a Virgin', 230, 12),
		   ('Material Girl', 211, 12),
		   ('Hung Up', 226, 13),
		   ('Vogue', 276, 14),
		   ('Music', 235, 15),
		   ('Into the Groove', 228, 16),
		   ('Bohemian Rhapsody', 355, 17),
		   ('We Will Rock You', 178, 18),
		   ('Another One Bites the Dust', 246, 19),
		   ('Do not Stop Me Now', 208, 20),
		   ('Somebody to Love', 208, 21),
		   ('Radio Ga Ga', 258, 22),
		   ('Rock You Like a Hurricane', 238, 23),
		   ('Still Loving You', 365, 24),
		   ('Wind of Change', 333, 25),
		   ('No One Like You', 244, 26),
		   ('Send Me an Angel', 270, 27),
		   ('Big City Nights', 294,27);

DELETE FROM albums
WHERE id BETWEEN 28 AND 54;

insert into collections (collection_title, year_of_release)
	values	('Лучшие Хиты Прошлого Века', '2003-01-01'),
			('Эмоциональные Баллады', '2004-01-01'),
			('Дискотека Восьмидесятых', '2005-01-01'),
			('Голоса Эпохи', '2006-01-01');

insert into trackcollection (track_id, collection_id)
 values (1, 1),
 		(7, 1),
 		(13, 1),
 		(19, 1),
 		(25, 1),
		(3, 2),
 		(11, 2),
 		(14, 2),
 		(23, 2),
 		(26, 2),
 		(5, 3),
 		(8, 3),
 		(15, 3),
 		(21, 3),
 		(30, 3),
	   	(4, 4),
 		(10, 4),
 		(17, 4),
 		(22, 4),
 		(27, 4);