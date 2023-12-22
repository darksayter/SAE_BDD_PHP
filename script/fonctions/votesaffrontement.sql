CREATE OR REPLACE PROCEDURE MettreAJourAffrontementAnime(
    id_tournoi INT,
    id_1 INT,
    id_2 INT,
    vote_1 INT,
    vote_2 INT
)
AS $$
DECLARE 
    id_anime_winner INT;
    id_anime_not INT;
    vote_moins INT;
    vote_plus INT;
BEGIN
    -- Déterminer le gagnant et le nombre de votes
    IF vote_1 > vote_2 THEN
        id_anime_winner := id_1;
        id_anime_not := id_2;
        vote_plus := vote_1;
        vote_moins := vote_2;
    ELSE 
        id_anime_winner := id_2;
        id_anime_not := id_1;
        vote_moins := vote_1;
        vote_plus := vote_2;
    END IF;

    -- Mettre à jour l'affrontement
    UPDATE AffrontementAnime
    SET 
        id_anime1 = id_anime_winner,
        id_anime2 = id_anime_not,
        vote_anime1 = vote_plus,
        vote_anime2 = vote_moins
    WHERE id_tournoianime = id_tournoi
      AND ((id_anime1 = id_1 AND id_anime2 = id_2) OR (id_anime1 = id_2 AND id_anime2 = id_1));
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE MettreAJourAffrontementManga(
    id_tournoi INT,
    id_1 INT,
    id_2 INT,
    vote_1 INT,
    vote_2 INT
)
AS $$
DECLARE 
    id_manga_winner INT;
    id_manga_not INT;
    vote_plus INT;
    vote_moins INT;
BEGIN
    -- Déterminer le gagnant et le nombre de votes
    IF vote_1 > vote_2 THEN
        id_manga_winner := id_1;
        id_manga_not := id_2;
        vote_plus := vote_1;
        vote_moins := vote_2;
    ELSE 
        id_manga_winner := id_2;
        id_manga_not := id_1;
        vote_plus := vote_2;
        vote_moins := vote_1;
    END IF;

    -- Mettre à jour l'affrontement
    UPDATE AffrontementManga
    SET 
        id_manga1 = id_manga_winner,
        id_manga2 = id_manga_not,
        vote_manga1 = vote_plus,
        vote_manga2 = vote_moins
    WHERE id_tournoimanga = id_tournoi
      AND ((id_manga1 = id_1 AND id_manga2 = id_2) OR (id_manga1 = id_2 AND id_manga2 = id_1));
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE MettreAJourAffrontementPersonnage(
    id_tournoi INT,
    id_1 INT,
    id_2 INT,
    vote_1 INT,
    vote_2 INT
)
AS $$
DECLARE 
    id_personnage_winner INT;
    id_personnage_looser INT;
    vote_moins INT;
    vote_plus INT;
BEGIN
    -- Déterminer le gagnant et le nombre de votes
    IF vote_1 > vote_2 THEN
        id_personnage_winner := id_1;
        id_personnage_looser := id_2;
        vote_plus := vote_1;
        vote_moins := vote_2;
    ELSE 
        id_personnage_winner := id_2;
        id_personnage_looser := id_1;
        vote_plus := vote_2;
        vote_moins := vote_1;
    END IF;

    -- Mettre à jour l'affrontement
    UPDATE AffrontementPersonnage
    SET 
        id_personnage1 = id_personnage_winner,
        id_personnage2 = id_personnage_looser,
        vote_personnage1 = vote_plus,
        vote_personnage2 = vote_moins
    WHERE id_tournoipersonnage = id_tournoi
      AND ((id_personnage1 = id_1 AND id_personnage2 = id_2) OR (id_personnage1 = id_2 AND id_personnage2 = id_1));
END;
$$ LANGUAGE plpgsql;


CALL MettreAJourAffrontementAnime(1,5114,11061,15,3);
CALL MettreAJourAffrontementManga(1,2,13,1,5);
CALL MettreAJourAffrontementPersonnage(1,417, 45627, 4555, 2);