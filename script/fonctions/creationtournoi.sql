-- Cette fonction vérifie si un nombre est une puissance de deux.

CREATE OR REPLACE FUNCTION EstPuissanceDeDeux(n INT) RETURNS BOOLEAN AS $$
BEGIN
    IF n <= 0 THEN
        RETURN FALSE;
    ELSEIF n = 1 THEN
        RETURN TRUE;
    ELSE
        RETURN (n % 2 = 0) AND EstPuissanceDeDeux(n / 2);
    END IF;
END;
$$ LANGUAGE plpgsql;



-- Cette procédure crée un tournoi anime avec un nombre spécifié d'étapes et de participants.

CREATE OR REPLACE PROCEDURE CreerTournoiAnime(
    etapes INT,
    fini BOOLEAN,
    nombre_participants INT
)
AS $$
DECLARE
    max_id INT;
    nombre_affrontements INT;
BEGIN
    IF EstPuissanceDeDeux(nombre_participants) AND nombre_participants > 1 THEN
        SELECT COALESCE(MAX(id_tournoianime), 0) + 1 INTO max_id FROM TournoiAnime;

        INSERT INTO TournoiAnime (id_tournoianime, etapes, fini)
        VALUES (max_id, etapes, fini);
        nombre_affrontements := nombre_participants / 2;

        FOR i IN 1..nombre_affrontements LOOP
            INSERT INTO AffrontementAnime (
                id_anime1, id_anime2, id_tournoianime, vote_anime1, vote_anime2, etapes
            )
            VALUES (0, 0, max_id, 0, 0, etapes);
        END LOOP;
    END IF;
END;
$$ LANGUAGE plpgsql;





-- Cette procédure crée un tournoi manga avec un nombre spécifié d'étapes et de participants.

CREATE OR REPLACE PROCEDURE CreerTournoiManga(
    etapes INT,
    fini BOOLEAN,
    nombre_participants INT
)
AS $$
DECLARE
    max_id INT;
    nombre_affrontements INT;
BEGIN
    IF EstPuissanceDeDeux(nombre_participants) AND nombre_participants > 1 THEN
        SELECT COALESCE(MAX(id_tournoimanga), 0) + 1 INTO max_id FROM TournoiManga;

        INSERT INTO TournoiManga (id_tournoimanga, etapes, fini)
        VALUES (max_id, etapes, fini);
        nombre_affrontements := nombre_participants / 2;

        FOR i IN 1..nombre_affrontements LOOP
            INSERT INTO AffrontementManga (
                id_manga1, id_manga2, id_tournoimanga, vote_manga1, vote_manga2, etapes
            )
            VALUES (0, 0, max_id, 0, 0, etapes);
        END LOOP;
    END IF;
END;
$$ LANGUAGE plpgsql;




-- Cette procédure crée un tournoi personnage avec un nombre spécifié d'étapes et de participants.

CREATE OR REPLACE PROCEDURE CreerTournoiPersonnage(
    etapes INT,
    fini BOOLEAN,
    nombre_participants INT
)
AS $$
DECLARE
    max_id INT;
    nombre_affrontements INT;
BEGIN
    IF EstPuissanceDeDeux(nombre_participants) AND nombre_participants > 1 THEN
        SELECT COALESCE(MAX(id_tournoipersonnage), 0) + 1 INTO max_id FROM TournoiPersonnage;

        INSERT INTO TournoiPersonnage (id_tournoipersonnage, etapes, fini)
        VALUES (max_id, etapes, fini);
        nombre_affrontements := nombre_participants / 2;

        FOR i IN 1..nombre_affrontements LOOP
            INSERT INTO AffrontementPersonnage (
                id_personnage1, id_personnage2, id_tournoipersonnage, vote_personnage1, vote_personnage2, etapes
            )
            VALUES (0, 0, max_id, 0, 0, etapes);
        END LOOP;
    END IF;
END;
$$ LANGUAGE plpgsql;




CALL CreerTournoiAnime(0, false, 4);
CALL CreerTournoiPersonnage(0, false,4);
CALL CreerTournoiManga(0, false,4);
