USE sporkify_db;


SELECT artist FROM sporkify WHERE song = 'Ntag';


SELECT song,SEC_TO_TIME(duration) FROM sporkify ORDER BY duration DESC LIMIT 3;


SELECT count(song) FROM sporkify;


SELECT artist, count(*) FROM sporkify
GROUP BY artist
ORDER BY count(artist) DESC LIMIT 1;


