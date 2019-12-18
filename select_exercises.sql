USE codeup_test_db;

-- The name of all albums by Pink Floyd.
SELECT * FROM albums WHERE artist = 'pink floyd';

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

-- The genre for Nevermind
SELECT genre FROM albums WHERE name = 'nevermind';

-- Which albums were released in the 1990s
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;

-- Which albums had less than 20 million certified sales
SELECT * from albums where sales <= 20;

-- All the albums with a genre of "Rock".
SELECT name from albums where genre = 'rock';

