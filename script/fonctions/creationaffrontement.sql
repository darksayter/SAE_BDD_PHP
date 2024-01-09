-- Cette procédure initialise les affrontements pour un tournoi Anime.

CREATE OR REPLACE PROCEDURE InitialiserAffrontementsAnime(
    id_tournoi INT,
    participants INT[]
)
AS $$
DECLARE
    total_participants INT;
BEGIN
    SELECT COUNT(*) * 2 INTO total_participants
    FROM AffrontementAnime
    WHERE id_tournoianime = id_tournoi;

    IF total_participants = ARRAY_LENGTH(participants, 1) THEN
        DELETE FROM AffrontementAnime WHERE id_tournoianime = id_tournoi;

        FOR i IN 1..ARRAY_LENGTH(participants, 1) BY 2 LOOP
            INSERT INTO ClassementAnime(id_anime, id_tournoianime, place, etapes) VALUES(participants[i],id_tournoi,total_participants,0);
            INSERT INTO ClassementAnime(id_anime, id_tournoianime, place, etapes) VALUES(participants[i + 1],id_tournoi,total_participants,0);
            INSERT INTO AffrontementAnime (
                id_anime1, id_anime2, id_tournoianime, vote_anime1, vote_anime2, etapes
            )
            VALUES (
                participants[i], participants[i + 1],
                id_tournoi, 0, 0, 0
            );
        END LOOP;
    ELSE
        RAISE EXCEPTION 'Le nombre d identifiants ne correspond pas au nombre total de participants pour ce tournoi Anime.';
    END IF;
END;
$$ LANGUAGE plpgsql;




-- Cette procédure initialise les affrontements pour un tournoi Manga.

CREATE OR REPLACE PROCEDURE InitialiserAffrontementsManga(
    id_tournoi INT,
    participants INT[]
)
AS $$
DECLARE
    total_participants INT;
BEGIN
    SELECT COUNT(*) * 2 INTO total_participants
    FROM AffrontementManga
    WHERE id_tournoimanga = id_tournoi;

    IF total_participants = ARRAY_LENGTH(participants, 1) THEN
        DELETE FROM AffrontementManga WHERE id_tournoimanga = id_tournoi;

        FOR i IN 1..ARRAY_LENGTH(participants, 1) BY 2 LOOP
            INSERT INTO ClassementManga(id_manga, id_tournoimanga, place, etapes) VALUES(participants[i],id_tournoi,total_participants,0);
            INSERT INTO ClassementManga(id_manga, id_tournoimanga, place, etapes) VALUES(participants[i + 1],id_tournoi,total_participants,0);
            INSERT INTO AffrontementManga (
                id_manga1, id_manga2, id_tournoimanga, vote_manga1, vote_manga2, etapes
            )
            VALUES (
                participants[i], participants[i + 1],
                id_tournoi, 0, 0, 0
            );
        END LOOP;
    ELSE
        RAISE EXCEPTION 'Le nombre d identifiants ne correspond pas au nombre total de participants pour ce tournoi Manga.';
    END IF;
END;
$$ LANGUAGE plpgsql;


-- Cette procédure initialise les affrontements pour un tournoi Personnage.

CREATE OR REPLACE PROCEDURE InitialiserAffrontementsPersonnage(
    id_tournoi INT,
    participants INT[]
)
AS $$
DECLARE
    total_participants INT;
BEGIN
    SELECT COUNT(*) * 2 INTO total_participants
    FROM AffrontementPersonnage
    WHERE id_tournoipersonnage = id_tournoi;

    IF total_participants = ARRAY_LENGTH(participants, 1) THEN
        DELETE FROM AffrontementPersonnage WHERE id_tournoipersonnage = id_tournoi;

        FOR i IN 1..ARRAY_LENGTH(participants, 1) BY 2 LOOP
            INSERT INTO ClassementPersonnage(id_personnage, id_tournoipersonnage, place, etapes) VALUES(participants[i],id_tournoi,total_participants,0);
            INSERT INTO ClassementPersonnage(id_personnage, id_tournoipersonnage, place, etapes) VALUES(participants[i + 1],id_tournoi,total_participants,0);
            INSERT INTO AffrontementPersonnage (
                id_personnage1, id_personnage2, id_tournoipersonnage, vote_personnage1, vote_personnage2, etapes
            )
            VALUES (
                participants[i], participants[i + 1],
                id_tournoi, 0, 0, 0
            );
        END LOOP;
    ELSE
        RAISE EXCEPTION 'Le nombre d identifiants ne correspond pas au nombre total de participants pour ce tournoi Personnage.';
    END IF;
END;
$$ LANGUAGE plpgsql;



CALL InitialiserAffrontementsAnime(1, ARRAY[5114,11061,38524,9253]);
CALL InitialiserAffrontementsManga(1,ARRAY[2,13,25,1706]);
CALL InitialiserAffrontementsPersonnage(1,ARRAY[417, 45627, 71, 40]);