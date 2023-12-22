-- Fonction qui renvoie le nombre total de participants au début d'un tournoi anime.

CREATE OR REPLACE FUNCTION NombreParticipantsTournoiAnime(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    nombre_participants INT;
BEGIN
    -- Compter le nombre d'affrontements à l'étape 0 pour le tournoi anime spécifié
    SELECT COUNT(*) * 2 INTO nombre_participants
    FROM AffrontementAnime
    WHERE etapes = 0 AND id_tournoianime = id_tournoi;

    RETURN nombre_participants;
END;
$$ LANGUAGE plpgsql;


-- Fonction qui renvoie le nombre total de participants au début d'un tournoi manga.

CREATE OR REPLACE FUNCTION NombreParticipantsTournoiManga(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    nombre_participants INT;
BEGIN
    -- Compter le nombre d'affrontements à l'étape 0 pour le tournoi manga spécifié
    SELECT COUNT(*) * 2 INTO nombre_participants
    FROM AffrontementManga
    WHERE etapes = 0 AND id_tournoimanga = id_tournoi;

    RETURN nombre_participants;
END;
$$ LANGUAGE plpgsql;



-- Fonction qui renvoie le nombre total de participants au début d'un tournoi personnage.

CREATE OR REPLACE FUNCTION NombreParticipantsTournoiPersonnage(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    nombre_participants INT;
BEGIN
    -- Compter le nombre d'affrontements à l'étape 0 pour le tournoi personnage spécifié
    SELECT COUNT(*) * 2 INTO nombre_participants
    FROM AffrontementPersonnage
    WHERE etapes = 0 AND id_tournoipersonnage = id_tournoi;

    RETURN nombre_participants;
END;
$$ LANGUAGE plpgsql;

