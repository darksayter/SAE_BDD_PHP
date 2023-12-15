CREATE OR REPLACE FUNCTION NombreParticipantsTournoiAnime(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    nombre_participants INT;
BEGIN
    SELECT COUNT(*) * 2 INTO nombre_participants
    FROM AffrontementAnime
    WHERE etapes = 0 AND id_tournoianime = id_tournoi;

    RETURN nombre_participants;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION NombreParticipantsTournoiManga(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    nombre_participants INT;
BEGIN
    SELECT COUNT(*) * 2 INTO nombre_participants
    FROM AffrontementManga
    WHERE etapes = 0 AND id_tournoimanga = id_tournoi;

    RETURN nombre_participants;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION NombreParticipantsTournoiPersonnage(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    nombre_participants INT;
BEGIN
    SELECT COUNT(*) * 2 INTO nombre_participants
    FROM AffrontementPersonnage
    WHERE etapes = 0 AND id_tournoipersonnage = id_tournoi;

    RETURN nombre_participants;
END;
$$ LANGUAGE plpgsql;
