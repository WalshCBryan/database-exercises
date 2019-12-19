-- ====================================
-- ============================== INDEX
-- ====================================

/*
  A data structure to enable faster table operations
  Multiple Index types (optimizes performance)...
    Primary Key
    Index / Key
    Unique Index
  - typically speeds up searching and slows insertion / updating records
  - the choice of whether or not to include an index on a column(s) should be based on weighing pros cons
  - for our use, it will be a best practice to include a primary key on every table
*/
-- ============= PRIMARY KEY

USE deimos_db;

DROP TABLE IF EXISTS pets;

CREATE TABLE pets
(
    id         INT UNSIGNED,
    pet_name   VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age        INT
);

DESCRIBE pets;


-- add primary key
ALTER TABLE pets
    MODIFY COLUMN id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;

-- drop primary key

ALTER TABLE pets -- must drop AUTO_INCREMENT first
    MODIFY id INT;

ALTER TABLE pets
    DROP PRIMARY KEY;

SHOW CREATE TABLE pets;


# Define Primary Key in create statement for single column

DROP TABLE pets;

CREATE TABLE pets
(
    id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pet_name   VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age        INT
);

DESCRIBE pets;

# Define Primary Key for multiple columns (we won't be doing this in classs)
CREATE TABLE pets
(
    id         INT UNSIGNED AUTO_INCREMENT,
    pet_name   VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age        INT,
    PRIMARY KEY (id, age)
);
-- ============= INDEX / KEY
-- add name index
ALTER TABLE pets
    ADD INDEX `pet_name_key` (pet_name);
-- drop name index
ALTER TABLE pets
    DROP INDEX pet_name_key;
-- show all indices / keys on a table
SHOW INDEX FROM pets;
-- ============= UNIQUE INDEX
-- create pets with unique name and owner
-- create using CREATE TABLE
DROP TABLE IF EXISTS pets;
CREATE TABLE pets
(
    id         INT UNSIGNED AUTO_INCREMENT,
    pet_name   VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age        INT,
    PRIMARY KEY (id),
    UNIQUE unique_pn_on (pet_name, owner_name)
);
# optionally add contraint name
SHOW CREATE TABLE pets;
describe pets;
show index from pets;
ALTER TAbLE pets
    DROP INDEX unique_pn_on;
-- using ALTER TABLE
ALTER TABLE xanadu_test_db.pets
    ADD UNIQUE `unique_pn_on` (pet_name, owner_name);
-- test unique constraint
INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Jack Smith', 3);
INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Fred', 2);
INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Snickers', 'Jack Smith', 2);
INSERT INTO pets (pet_name, owner_name, age) -- ERROR
VALUES ('Buddy', 'Jack Smith', 8);
SELECT *
FROM pets;
-- drop unique key
SHOW INDEX FROM pets;
ALTER TABLE pets
    DROP KEY pet_name;
ALTER TABLE pets
    DROP KEY unique_pn_on;
-- now can add duplicate pet name owner name combo
INSERT INTO pets (pet_name, owner_name, age) -- ERROR
VALUES ('Buddy', 'Jack Smith', 8);
-- ============================== CONSTRAINT
/*
  Multiple constraint types (maintains "referential integrity")...
  - Not Null
  - Unique
  - Primary Key (combo of UNIQUE and NOT NULL constraints)
  - Foreign Key
  - Default
*/
-- ============= FOREIGN KEYS
DROP TABLE IF EXISTS owners;
CREATE TABLE owners
(
    id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(30) NOT NULL,
    address VARCHAR(255) DEFAULT 'Undisclosed'
);
DROP TABLE IF EXISTS pets;
CREATE TABLE pets
(
    id       INT UNSIGNED AUTO_INCREMENT,
    pet_name VARCHAR(30) NOT NULL,
    owner_id INT UNSIGNED,
    age      INT,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES owners (id)
);


describe pets;
show index from pets;

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', null, 2);

SELECT * FROM pets;
SELECT * FROM owners;
INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Spot', 1, 2); -- error (referential integrity at work!)

INSERT INTO owners (name, address)
VALUES ('Darth Smith', '1138 Death Star Rd.');

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', 1, 2);
-- will run
# If dropping tables, must drop pets, then owners table