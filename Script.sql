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