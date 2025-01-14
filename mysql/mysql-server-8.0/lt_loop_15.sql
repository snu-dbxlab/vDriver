USE sbtest;
DROP PROCEDURE IF EXISTS LT_15;

DELIMITER $$
CREATE PROCEDURE LT_15()
BEGIN
	DECLARE y INT;
	DECLARE time INT;
	DECLARE rand INT;
	SET time = UNIX_TIMESTAMP(NOW());
	label1: LOOP
		SET rand = FLOOR(RAND() * 99999 + 1);
    SELECT * from sbtest1 where id=rand;
		SET y = UNIX_TIMESTAMP(NOW());
		IF y-time < 45 THEN
			ITERATE label1;
		END IF;
		LEAVE label1;
	END LOOP label1;
END$$
DELIMITER ;
