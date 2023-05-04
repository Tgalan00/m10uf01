CREATE DATABASE IF NOT EXISTS healthcare;

DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS diseases;
DROP TABLE IF EXISTS doctors;

CREATE TABLE `users`(
	id_user BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(32) NOT NULL,
	name VARCHAR(64) NOT NULL,
	surname VARCHAR(64), 
	birthday DATETIME DEFAULT now(), 
	email VARCHAR(32) NOT NULL, 
	country VARCHAR(64) NOT NULL,
	password VARCHAR(32), 
	date DATETIME NOT NULL DEFAULT now());


CREATE TABLE medicines(
	id_medicine INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	medicine VARCHAR(192) NOT NULL,
	cost DECIMAL(9, 2) NOT NULL,
	secondary_effects TEXT,
	description TEXT);


CREATE TABLE diseases(
	id_disease INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	disease VARCHAR(64) NOT NULL,
	medical_area VARCHAR(64) NOT NULL,
	risk_of_the_disease INT NOT NULL,
	common_sympthoms TEXT,
	description TEXT);


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

INSERT INTO `users`(username, name, surname, email, country, password)
VALUES ("root", "Hilon", "Musgo", "hilonmusgo@yahoo.com", "Madagascar", "9af794ed74d814f4baba3f7a5d5e0ac6");

INSERT INTO `users`(username, name, surname, email, country, password)
VALUES ("tomatito", "Wan", "Pan", "wanpan@bing.com", "Andorra", "548rj9fj49fk40fn2020vfj23949");

INSERT INTO `users`(username, name, surname, email, country, password)
VALUES ("naranjito", "Tan", "Kan", "tankan@bing.com", "Francia", "gknaklnaognjoi3990390");

INSERT INTO doctors(doctor)
VALUES ("Alfonso");

INSERT INTO doctors(doctor)
VALUES ("Bonifacio");

INSERT INTO medicines(medicine, cost, secondary_effects, description)
VALUES ("ibuprofeno", 15, "no tiene", "ya no te duele la panxa");

INSERT INTO medicines(medicine, cost, secondary_effects, description)
VALUES ("paracetamol", 10, "tampoco tiebe", "ya no te duele la cabesa");

INSERT INTO medicines(medicine, cost, secondary_effects, description)
VALUES ("dalsy", 15, "imposible que tenga efectos secundarios", "ta mu bueno");

INSERT INTO medicines(medicine, cost, secondary_effects, description)
VALUES ("ebastel", 20, "nerviosismo", "te quita la alergia de un golpe");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("vih","anti",7,"fiebre","usar siempre proteccion");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("lepra","derma",6,"caida de piel","cuidao");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("pneumonia","pulmonar",1,"no respiras","hay que hacer mas cardio");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("cancer","oncologia",8,"fiebre","mu malo");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("gripe","si",1,"fiebre","un buen resfriao");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("covid","china",10,"tos mucha tos","el confinamiento fue real");

INSERT INTO diagnoses(diagnosis, id_doctor, id_user, id_disease)
VALUES ("ibuprofeno y pa casa", 1, 1, 5);

INSERT INTO diagnoses(diagnosis, id_doctor, id_user, id_disease)
VALUES ("hechate cremita", 2, 2, 2);

INSERT INTO diagnoses(diagnosis, id_doctor, id_user, id_disease)
VALUES ("ponte mascarilla", 1, 3, 6);

INSERT INTO diagnoses(diagnosis, id_doctor, id_user, id_disease)
VALUES ("a operar", 2, 4, 4);

INSERT INTO treatments(id_diagnosis, id_medicine)
VALUES (1, 1);

INSERT INTO treatments(id_diagnosis, id_medicine)
VALUES (2, 3);

INSERT INTO treatments(id_diagnosis, id_medicine)
VALUES (3, 2);

INSERT INTO treatments(id_diagnosis, id_medicine)
VALUES (4, 1);

INSERT INTO treatments(id_diagnosis, id_medicine)
VALUES (4, 2);













