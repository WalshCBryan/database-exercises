USE sporkify_db;
DROP TABLE IF EXISTS sporkify;
CREATE TABLE IF NOT EXISTS sporkify(
     id INT UNSIGNED AUTO_INCREMENT,
     artist VARCHAR(50),
     album VARCHAR(50),
     song VARCHAR(50),
     genre VARCHAR(50),
     duration int,
     release_date DATE,
     PRIMARY KEY (id)
);