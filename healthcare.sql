CREATE DATABASE IF NOT EXISTS evilcorp;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`(
	id_user BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(32) NOT NULL,
	name VARCHAR(64) NOT NULL,
	surname VARCHAR(64), birthday DATE NOT NULL, 
	email VARCHAR(32) NOT NULL, 
	country VARCHAR(64) NOT NULL,
	password VARCHAR(32), 
	date DATETIME NOT NULL DEFAULT now());


DROP TABLE IF EXISTS medicines;

CREATE TABLE medicines(
	id_medicine UINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	medicine VARCHAR(192) NOT NULL,
	cost DECIMAL(9, 2) NOT NULL,
	secondary_effects TEXT,
	description TEXT);

DROP TABLE IF EXSISTS diseases;

CREATE TABLE diseases(
	id_disease UINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	disease VARCHAR(64) NOT NULL,
	medical_area VARCHAR(64) NOT NULL,
	risk_of_the_disease INT NOT NULL,
	common_sympthoms TEXT,
	description TEXT);

DROP TABLE IF EXISTS doctors;

CREATE TABLE IF EXISTS doctors(
	id_doctor UINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	doctor VARCHAR(32) NOT NULL);

DROP TABLE IF EXISTS diagnoses;

CREATE TABLE diagnoses(
	id_diagnosis BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	diagnosis TEXT,
	datetime DATETIME NOT NULL DEFAULT now(),
	id_doctor UINT NOT NULL,
	id_user BIGINT UNSIGNED NOT NULL,
	id_disease UINT NOT NULL,
	FOREIGN KEY (id_doctor) REFERENCES doctors(id_doctor),
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_disease) REFERENCES diseases(id_disease));

DROP TABLE IF EXISTS treatments;

CREATE TABLE treatments(
	id_treatment BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_diagnosis BIGINT UNSIGNED NOT NULL,
	id_medicine UINT NOT NULL,
	FOREIGN KEY (id_diagnosis) REFERENCES diagnoses(id_diagnosis),
	FOREIGN KEY (id_medicine) REFERENCES medicines(id_medicine)
);

INSERT INTO `users`(username, name, surname, email, country, password)
VALUES ("root", "Hilon", "Musgo", "hilonmusgo@yahoo.com", "Madagascar", "9af794ed74d814f4baba3f7a5d5e0ac6");

INSERT INTO `users`(username, name, surname, email, country, password)
VALUES ("tomatito", "Wan", "Pan", "wanpan@bing.com", "Andorra", "gijbh94yh9y594yivb9gh379t78937456957695667");

INSERT INTO `users`(username, name, surname, email, country, password)
VALUES ("naranjito", "Tan", "Kan", "tankan@bing.com", "Francia", "kjgbjkgbjkbBKJBKJB34481209unFDlkfnlfkn");

INSERT INTO doctors(doctor)
VALUES (Alfonso);

INSERT INTO doctors(doctor)
VALUES (Bonifacio);

INSERT INTO medicines(medicine, price, secondary_effects, description)
VALUES ("ibuprofeno", 15, "no tiene", "ya no te duele la panxa");

INSERT INTO medicines(medicine, price, secondary_effects, description)
VALUES ("paracetamol", 10, "tampoco tiebe", "ya no te duele la cabesa");

INSERT INTO medicines(medicine, price, secondary_effects, description)
VALUES ("dalsy", 15, "imposible que tenga efectos secundarios", "ta mu bueno");

INSERT INTO medicines(medicine, price, secondary_effects, description)
VALUES ("ebastel", 20, "nerviosismo", "te quita la alergia de un golpe");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("vih","anti","anticuerpos","fiebre","usar siempre proteccion");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("lepra","derma","piel","caida de piel","cuidao");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("pneumonia","pulmonar","pulmones","no respiras","hay que hacer mas cardio");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("cancer","oncologia","te mata","fiebre","mu malo");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("gripe","si","no es pa tanto","fiebre","un buen resfriao");

INSERT INTO diseases(disease, medical_area, risk_of_the_disease, common_sympthoms, description)
VALUES ("covid","china","pneumonia tocha","tos mucha tos","el confinamiento fue real");

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













