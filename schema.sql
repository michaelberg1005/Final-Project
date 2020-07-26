--CREATE TABLES

CREATE TABLE reelected_2018 (
	district TEXT ,
	winner TEXT PRIMARY KEY NOT NULL,
	winner_spent TEXT,
	second_place TEXT,
	second_spent TEXT,
	ratio TEXT
);

CREATE TABLE defeated_2018 (
	district TEXT,
	winner TEXT PRIMARY KEY NOT NULL,
	winner_spent TEXT,
	second_place TEXT,
	second_spent TEXT,
	ratio TEXT
);

CREATE TABLE open_seat_2018 (
	district TEXT,
	winner TEXT PRIMARY KEY NOT NULL,
	winner_spent TEXT,
	second_place TEXT,
	second_spent TEXT,
	ratio TEXT
);

-- DROP ratio COLUMN

ALTER TABLE reelected_2018
	DROP COLUMN ratio
;

ALTER TABLE defeated_2018
	DROP COLUMN ratio
;

ALTER TABLE open_seat_2018
	DROP COLUMN ratio
;

-- SPLIT TABLES

SELECT DISTINCT
	district,
	winner,
	winner_spent
INTO incumbent_won
FROM reelected_2018
;

SELECT DISTINCT
	district,
	second_place,
	second_spent
INTO challenger_lost
FROM reelected_2018
;
	
SELECT DISTINCT
	district,
	winner,
	winner_spent
INTO challenger_won
FROM defeated_2018
;

SELECT DISTINCT
	district,
	second_place,
	second_spent
INTO incumbent_lost
FROM defeated_2018
;

SELECT DISTINCT
	district,
	winner,
	winner_spent
INTO open_won
FROM open_seat_2018
;

SELECT DISTINCT
	district,
	second_place,
	second_spent
INTO open_lost
FROM open_seat_2018
;


--ALTER TABLES

ALTER TABLE incumbent_won
	ADD won INT DEFAULT '1',
	ADD lost INT DEFAULT '0',
	ADD incumbent INT DEFAULT '1',
	ADD challenger INT DEFAULT '0',
	ADD open_seat INT DEFAULT '0'
;
ALTER TABLE incumbent_won
	RENAME COLUMN winner TO candidate_name
;
ALTER TABLE incumbent_won
	RENAME COLUMN winner_spent TO spent
;

ALTER TABLE challenger_lost
	ADD won INT DEFAULT '0',
	ADD lost INT DEFAULT '1',
	ADD incumbent INT DEFAULT '0',
	ADD challenger INT DEFAULT '1',
	ADD open_seat INT DEFAULT '0'
;
ALTER TABLE challenger_lost
	RENAME COLUMN second_place TO candidate_name
;
ALTER TABLE challenger_lost
	RENAME COLUMN second_spent TO spent
;

ALTER TABLE challenger_won
	ADD won INT DEFAULT '1',
	ADD lost INT DEFAULT '0',
	ADD incumbent INT DEFAULT '0',
	ADD challenger INT DEFAULT '1',
	ADD open_seat INT DEFAULT '0'
;
ALTER TABLE challenger_won
	RENAME COLUMN winner TO candidate_name
;
ALTER TABLE challenger_won
	RENAME COLUMN winner_spent TO spent
;

ALTER TABLE incumbent_lost
	ADD won INT DEFAULT '0',
	ADD lost INT DEFAULT '1',
	ADD incumbent INT DEFAULT '1',
	ADD challenger INT DEFAULT '0',
	ADD open_seat INT DEFAULT '0'
;
ALTER TABLE incumbent_lost
	RENAME COLUMN second_place TO candidate_name
;
ALTER TABLE incumbent_lost
	RENAME COLUMN second_spent TO spent
;

ALTER TABLE open_won
	ADD won INT DEFAULT '1',
	ADD lost INT DEFAULT '0',
	ADD incumbent INT DEFAULT '0',
	ADD challenger INT DEFAULT '0',
	ADD open_seat INT DEFAULT '1'
;
ALTER TABLE open_won
	RENAME COLUMN winner TO candidate_name
;
ALTER TABLE open_won
	RENAME COLUMN winner_spent TO spent
;

ALTER TABLE open_lost
	ADD won INT DEFAULT '0',
	ADD lost INT DEFAULT '1',
	ADD incumbent INT DEFAULT '0',
	ADD challenger INT DEFAULT '0',
	ADD open_seat INT DEFAULT '1'
;
ALTER TABLE open_lost
	RENAME COLUMN second_place TO candidate_name
;
ALTER TABLE open_lost
	RENAME COLUMN second_spent TO spent
;

-------------------------------------------

-- JOIN INTO NEW TABLE

SELECT *
INTO final_table
FROM (
	SELECT *
	FROM incumbent_won
	UNION ALL
	SELECT *
	FROM challenger_lost
	UNION ALL
	SELECT *
	FROM challenger_won
	UNION ALL
	SELECT *
	FROM incumbent_lost
	UNION ALL
	SELECT *
	FROM open_won
	UNION ALL
	SELECT *
	FROM open_lost
	) a
;
