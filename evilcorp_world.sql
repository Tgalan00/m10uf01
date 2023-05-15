--Recreamos la tabla iluminatis haciendo que id_user sea unico

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  	id_user INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
);

DROP TABLE IF EXISTS users_conspiraciones;
CREATE TABLE users_cosp (
  	id_user_conspiracion INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_user INT UNSIGNED
);



DROP TABLE IF EXISTS conspiraciones;
CREATE TABLE cosp (
        id_conspiracion INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
        id_user_conspiracion INT UNSIGNED
);



DROP TABLE IF EXISTS iluminatis;
CREATE TABLE cosp (
        id_user_iluminatis INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
        id_user INT UNSIGNED
);


INSERT INTO iluminatis (id_user)
VALUES (1),
	(2);



CREATE VIEW cuantos_iluminatis AS

	SELECT user.id_user, user.username
	FROM users
	JOIN iluminatis ON users.id_user = iluminatis.id_user;

CREATE VIEW cuenta_iluminatis AS

	SELECT COUNT(*) AS users.id_user
	FROM cuantos_iluminatis;