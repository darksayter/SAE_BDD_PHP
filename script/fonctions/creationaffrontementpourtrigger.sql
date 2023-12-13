CREATE OR REPLACE PROCEDURE InitialiserAffrontementsAnimeTrigger(
    id_tournoi INT,
    participants INT,
    participants2 INT,
    etape INT
)
AS $$
BEGIN
    INSERT INTO AffrontementAnime (
        id_anime1, id_anime2, id_tournoianime, vote_anime1, vote_anime2, etapes
    )
    VALUES (
        participants, participants2,
        id_tournoi, 0, 0, etape
    );
END;
$$ LANGUAGE plpgsql;