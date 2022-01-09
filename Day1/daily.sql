CREATE TABLE actors(
actor_id SERIAL PRIMARY KEY,
first_name VARCHAR (20) NOT NULL,
last_name VARCHAR (25) NOT NULL,
date_birth DATE NOT NULL,
number_oscars SMALLINT NOT NULL
)


INSERT INTO actors (first_name, last_name, date_birth, number_oscars)
VALUES('Matt','Damon','1970-10-08',5);

INSERT INTO actors (first_name, last_name, date_birth, number_oscars)
VALUES
('George','Clooney','1961-05-06',2),
('Julia','Robberts','1971-06-08',4),
('Jim','Kerry','1974-08-10',2);

SELECT * FROM actors ORDER BY actor_id DESC LIMIT 1

INSERT INTO actors (first_name, last_name)  /// CANT ADD NULL
VALUES('Tom','Holland');
