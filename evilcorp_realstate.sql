DROP DATABASE IF EXISTS realstate;

CREATE DATABASE realstate;

DROP TABLE IF EXISTS users_addresses;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS planets;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS streets_num;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS zipcodes;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS users_addresses;


CREATE TABLE planets(id_planet INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					planet VARCHAR(64) NOT NULL);
					

CREATE TABLE countries(id_country INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
						country VARCHAR(64) NOT NULL,
						id_planet INT UNSIGNED NOT NULL,
						FOREIGN KEY (id_planet) REFERENCES planets(id_planet);

CREATE TABLE cities(id_city INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					city VARCHAR(64) NOT NULL,
					id_country INT UNSIGNED NOT NULL,
					FOREIGN KEY(id_country) REFERENCES countries(id_country));

CREATE TABLE streets(id_street BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					street VARCHAR(32) NOT NULL,
					id_city INT UNSIGNED NOT NULL,
					FOREIGN KEY(id_city) REFERENCES cities(id_city));

CREATE TABLE streets_num(id_street_num INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
						street_num VARCHAR(16));

CREATE TABLE staircases(id_staircase INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
						staircase VARCHAR(8));

CREATE TABLE floors(id_floor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					`floor` VARCHAR(8));

CREATE TABLE doors(id_door INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					door VARCHAR(8));

CREATE TABLE zipcodes(id_zipcode INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
						zipcode VARCHAR(16) NOT NULL);

CREATE TABLE addresses(id_address BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
						id_street INT UNSIGNED NOT NULL,
						id_street_num INT UNSIGNED NOT NULL,
						id_staircase INT UNSIGNED NOT NULL,
						id_floor INT UNSIGNED NOT NULL,
						id_door INT UNSIGNED NOT NULL,
						id_zipcode INT UNSIGNED NOT NULL,
						FOREIGN KEY(id_street) REFERENCES streets(id_street),
						FOREIGN KEY(id_street_num) REFERENCES streets_num(id_street_num),
						FOREIGN KEY(id_staircase) REFERENCES staircases(id_staircase),
						FOREIGN KEY(id_floor) REFERENCES floors(id_floor),
						FOREIGN KEY(id_door) REFERENCES doors(id_door),
						FOREIGN KEY(id_zipcode) REFERENCES zipcodes(id_zipcode));

CREATE TABLE users(id_user BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					username VARCHAR(32) NOT NULL,
					name VARCHAR(64) NOT NULL,
					surname VARCHAR(64));

CREATE TABLE users_addresses(id_user_address BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
							id_user BIGINT UNSIGNED NOT NULL,
							id_address BIGINT UNSIGNED NOT NULL,
							FOREIGN KEY(id_user) REFERENCES users(id_user),
							FOREIGN KEY (id_address) REFERENCES addresses(id_address));





INSERT INTO planets(planet)
VALUES ("Tierra"),
		("Venus"),
		("Marte"),
		("Jupiter");

INSERT INTO countries(country, id_planet)
VALUES ("USA", 1),
		("España", 1),
		("Argentina", 1),
		("Uwewew",2),
		("Labubu", 3),
		("Waluala", 4),
		("Enyetuewe",3);
		
INSERT INTO cities(city, id_country)
VALUES ("New York City", 1),
		("Albacete", 2),
		("Murcia", 2),
		("Bilbao", 2),
		("Miami", 1),
		("Rosario", 3),
		("Buenos aires", 3),
		("Lalalala", 4),
		("Tapu Koko", 5),
		("Tapu Lele", 6),
		("Tapu Bulu", 7);

INSERT INTO streets(street, id_city)
VALUES ("Plaza España", 2),
		("Calle Europa", 2),
		("Calle del guante", 3),
		("Calle del buho", 3),
		("Paseo maritimo", 3),
		("Plaza España", 4),
		("Main Street", 1),
		("English Street", 5),
		("Calle del mate",6),
		("Calle de messi", 7),
		("Lawawa",8),
		("Elwewe",9),
		("Wawota",10),
		("Achuchu",11);
		
INSERT INTO streets_num(street_num)
VALUES (123),
		(456),
		(789),
		(10),
		(22);
		
INSERT INTO staircases(staircase)
VALUES ("A"),
		("B"),
		("C"),
		("D"),
		("E");
		
INSERT INTO floors(`floor`)
VALUES (1),
		(2),
		(3),
		(4),
		(5);
		
INSERT INTO doors(door)
VALUES (1),
		(2),
		(3),
		(4),
		(5);	


INSERT INTO zipcodes(zipcode)
VALUES (12345),
		(67890),
		(54321),
		(98765),
		(13579);		
		

							
INSERT INTO addresses(id_street, id_street_num, id_staircase, id_floor, id_door, id_zipcode)
VALUES (1, 4, 2, 5, 3, 1),
		(1, 2, 4, 3, 5, 4),
		(2, 1, 1, 4, 2, 3),
		(3, 3, 3, 1, 4, 5),
		(4, 2, 5, 2, 1, 4),
		(5, 5, 3, 4, 3, 2),
		(6, 1, 2, 3, 5, 1),
		(7, 3, 1, 5, 4, 3),
		(8, 4, 4, 2, 2, 5),
		(9, 1, 5, 3, 1, 2),
		(10, 2, 3, 1, 4, 1),
		(11, 5, 2, 4, 2, 4),
		(12, 3, 1, 2, 5, 3),
		(13, 4, 4, 5, 1, 5),
		(14, 2, 5, 3, 3, 2);
		
		
CREATE VIEW cuenta_direcciones AS SELECT planets.id_planet, COUNT(adresses.id_address) FROM planets GROUP BY planets.id_planet;
		