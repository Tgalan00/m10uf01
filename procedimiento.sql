DELIMITER $$

DROP PROCEDURE IF EXISTS procedimiento;

CREATE PROCEDURE procedimiento(
        IN id_usuario INT,
        IN id_conspiracion INT,
        IN opinion BOOLEAN
)
BEGIN

        START TRANSACTION;

	INSERT INTO user_conspiracion (id_user, id_conspiracion) VALUES (id_user, id_conspiracion);

	IF opinion THEN
                COMMIT;
        ELSE
                ROLLBACK;
        END IF;

END $$

DELIMITER ;