CREATE DATABASE IF NOT EXISTS evilcorp;


DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS iluminatis;
DROP TABLE IF EXISTS users_conspirations;
DROP TABLE IF EXISTS users_addresses;
DROP TABLE IF EXISTS users_planets;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS diseases;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS conspirations;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS streets_num;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS zipcodes;
DROP TABLE IF EXISTS planets;


CREATE TABLE users(id_user BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					username VARCHAR(32) NOT NULL,
					name VARCHAR(64) NOT NULL);
					


CREATE TABLE diseases(
	id_disease INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	disease VARCHAR(64) NOT NULL,
	medical_area VARCHAR(64) NOT NULL,
	risk_of_the_disease INT NOT NULL,
	common_sympthoms TEXT,
	description TEXT);


CREATE TABLE medicines(
	id_medicine INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	medicine VARCHAR(192) NOT NULL,
	cost_production DECIMAL(9, 2) UNSIGNED NOT NULL,
	cost_sell DECIMAL(9, 2) UNSIGNED NOT NULL);




CREATE TABLE doctors(
	id_doctor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	doctor VARCHAR(32) NOT NULL);


CREATE TABLE diagnoses(
	id_diagnosis BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	diagnosis TEXT,
	datetime DATETIME NOT NULL DEFAULT now(),
	id_doctor INT UNSIGNED NOT NULL,
	id_user BIGINT UNSIGNED NOT NULL,
	id_disease INT UNSIGNED NOT NULL,
	FOREIGN KEY(id_doctor) REFERENCES doctors(id_doctor),
	FOREIGN KEY(id_user) REFERENCES users(id_user),
	FOREIGN KEY(id_disease) REFERENCES diseases(id_disease));


CREATE TABLE treatments(
	id_treatment BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_diagnosis BIGINT UNSIGNED NOT NULL,
	id_medicine INT UNSIGNED NOT NULL,
	FOREIGN KEY(id_diagnosis) REFERENCES diagnoses(id_diagnosis),
	FOREIGN KEY(id_medicine) REFERENCES medicines(id_medicine)
);

CREATE TABLE conspirations (id_conspiration INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
			 conspiration VARCHAR(32) NOT NULL,
			 description TEXT NOT NULL);

CREATE TABLE iluminatis (id_iluminati INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
			 id_user BIGINT UNSIGNED NOT NULL,
			 FOREIGN KEY(id_user) REFERENCES users(id_user));

CREATE TABLE users_conspirations (id_user_conspiration BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
				 id_user BIGINT UNSIGNED NOT NULL,
				 id_conspiration INT UNSIGNED NOT NULL,
				 FOREIGN KEY(id_user) REFERENCES users (id_user),
				 FOREIGN KEY(id_conspiration) REFERENCES conspirations(id_conspiration));

CREATE TABLE planets(id_planet INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					planet VARCHAR(64) NOT NULL);
					

CREATE TABLE countries(id_country INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
						country VARCHAR(64) NOT NULL,
						id_planet INT UNSIGNED NOT NULL,
						FOREIGN KEY (id_planet) REFERENCES planets(id_planet));

CREATE TABLE cities(id_city INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
					city VARCHAR(64) NOT NULL,
					id_country INT UNSIGNED NOT NULL,
					FOREIGN KEY(id_country) REFERENCES countries(id_country));

CREATE TABLE streets(id_street INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
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




CREATE TABLE users_addresses (id_user_address BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
				id_user BIGINT UNSIGNED NOT NULL,
				id_address BIGINT UNSIGNED NOT NULL, 
				FOREIGN KEY(id_user) REFERENCES users(id_user), 
				FOREIGN KEY (id_address) REFERENCES addresses(id_address)) ENGINE=InnoDB;

CREATE TABLE users_planets (id_user_planet BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
				id_user BIGINT UNSIGNED NOT NULL, 
				id_planet INT UNSIGNED NOT NULL, 
				FOREIGN KEY(id_user) REFERENCES users(id_user), 
				FOREIGN KEY(id_planet) REFERENCES planets(id_planet));



INSERT INTO `users`(username, name)
VALUES ("root", "Hilon"),("tomatito", "Wan"),("naranjito", "Tan"),("si","Pablo"),("tambien","Tonio"),("granja","Willermo"),("elpupas","Manolo");

INSERT INTO doctors(doctor)
VALUES ("Alfonso"),("Bonifacio"),("Alberto");

INSERT INTO medicines(medicine, cost_production, cost_sell) 
VALUES ("Ibuprofeno", 5000000, 8000000),
	("Ebastel", 123456, 987777),
	("Dalsy", 20000, 898888),
	("Paracetamol", 94444, 999999);

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("vih","anti",7,"fiebre","usar siempre proteccion"),
	("lepra","derma",6,"caida de piel","cuidao"),
	("pneumonia","pulmonar",1,"no respiras","hay que hacer mas cardio"),
	("cancer","oncologia",8,"fiebre","mu malo"),
	("gripe","si",1,"fiebre","un buen resfriao"),
	("covid","china",10,"tos mucha tos","el confinamiento fue real");

INSERT INTO diagnoses(diagnosis, id_doctor, id_user, id_disease)
VALUES ("ibuprofeno y pa casa", 1, 1, 5),
	("hechate cremita", 2, 2, 2),
	("ponte mascarilla", 1, 3, 6),
	("a operar", 2, 4, 4);

INSERT INTO treatments(id_diagnosis, id_medicine)
VALUES (1, 1),
	(2, 3),
	(3, 2),
	(4, 1),
	(4, 2);		

INSERT INTO conspirations (conspiration, description)
VALUES ("Tierra plana", "no es una esfera"), ("Microchips", "no quiero que me vacunen"), ("5G", "Nos controlan la mente");

INSERT INTO iluminatis (id_user) VALUES (1), (2);


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

INSERT INTO users_planets(id_user, id_planet) VALUES(1,1),(2,1),(3,1),(4,2),(5,2),(6,3),(7,4);

DROP FUNCTION IF EXISTS get_city;

DELIMITER $$
CREATE FUNCTION get_city(city_name VARCHAR(64), country_name VARCHAR(64), planet_name VARCHAR(64))
RETURNS INT UNSIGNED
BEGIN
DECLARE planet_id INT UNSIGNED;
DECLARE country_id INT UNSIGNED;
DECLARE city_id INT UNSIGNED;


SELECT id_planet INTO planet_id FROM planets WHERE name = planet_name;

IF planet_id IS NULL THEN
INSERT INTO planets (name) VALUES (planet_name);
SET planet_id = LAST_INSERT_ID();
END IF;


SELECT id_country INTO country_id FROM countries WHERE country = country_name AND id_planet = planet_id;

IF country_id IS NULL THEN
INSERT INTO countries (country, id_planet) VALUES (country_name, planet_id);
SET country_id = LAST_INSERT_ID();
END IF;


SELECT id_city INTO city_id FROM cities WHERE city = city_name AND id_country = country_id;

IF city_id IS NULL THEN
INSERT INTO cities (city, id_country) VALUES (city_name, country_id);
SET city_id = LAST_INSERT_ID();
ELSE
SET city_id = (SELECT id_city FROM cities WHERE city = city_name AND id_country = country_id LIMIT 1);
END IF;

RETURN city_id;
END$$
DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS add_conspiration;


CREATE PROCEDURE add_conspiration( IN id_users BIGINT , IN id_conspirations INT, IN opinion BOOLEAN)
BEGIN

START TRANSACTION;

INSERT INTO users_conspirations(id_user, id_conspiration) VALUES (id_users, id_conspirations);

IF opinion THEN
COMMIT;
ELSE
ROLLBACK;
END IF;

END $$

DELIMITER ;

	
DROP VIEW IF EXISTS cuenta_direcciones;	
		
CREATE VIEW cuenta_direcciones AS SELECT planets.id_planet, COUNT(addresses.id_address) FROM planets, addresses GROUP BY planets.id_planet;

DROP VIEW IF EXISTS ilumi_show;
		
CREATE VIEW ilumi_show AS SELECT users.id_user, users.name FROM users LEFT JOIN iluminatis ON users.id_user = iluminatis.id_user;

DROP VIEW IF EXISTS ilumi_count;

CREATE VIEW ilumi_count AS SELECT COUNT(users.id_user) users FROM users,ilumi_show;

DROP VIEW IF EXISTS usuariosenplaneta;

CREATE VIEW usuariosenplaneta AS SELECT
 planets.planet,
 COUNT(users_planets.id_user) AS count_user FROM users,
 planets, users_planets WHERE users.id_user=users_planets.id_user AND planets.id_planet = users_planets.id_planet
 GROUP BY planets.planet;

DROP VIEW IF EXISTS gananciasenplaneta;

CREATE VIEW gananciasenplaneta AS SELECT planets.planet, SUM(cost_sell) AS generated
 FROM users,
	 medicines,
	 diagnoses,
	 planets,
	 users_planets, 
	 treatments
 WHERE planets.id_planet=users_planets.id_planet
 AND diagnoses.id_user=users_planets.id_user
 AND diagnoses.id_diagnosis=treatments.id_diagnosis
 AND medicines.id_medicine=treatments.id_medicine
 GROUP BY planets.planet;

DELIMITER $$

DROP FUNCTION IF EXISTS mostrarusuariorandom;	

CREATE FUNCTION mostrarusuariorandom(planeta INT)
RETURNS VARCHAR(32)
BEGIN
DECLARE user INT;
DECLARE `index` INT;
DECLARE randuser INT;

SELECT COUNT(*) INTO `user` FROM users_planets WHERE users_planets.id_planet = planeta;

SET `index` = FLOOR(RAND() * `user`);

SELECT id_user INTO randuser FROM users_planets WHERE users_planets.id_planet = planeta
LIMIT `index`, 1;

RETURN randuser;

END $$

DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS matasion;

CREATE PROCEDURE matasion(IN nombre VARCHAR(64))
BEGIN
DECLARE muerto VARCHAR(64);
DECLARE vivo BOOLEAN;


SELECT dead INTO vivo
FROM users
WHERE name = nombre;
IF vivo THEN
	SELECT CONCAT('El usuario ', nombre, ' ya está muerto.') AS mensaje;
ELSE

UPDATE users
SET dead = TRUE
WHERE name = nombre;
SELECT CONCAT('Pum! hemos matado a ', nombre) AS mensaje;
END IF;
END $$

DELIMITER ;

