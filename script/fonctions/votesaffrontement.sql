CREATE OR REPLACE PROCEDURE MettreAJourAffrontementAnime(
    id_tournoi INT,
    id_1 INT,
    id_2 INT,
    vote_1 INT,
    vote_2 INT
)
AS $$
BEGIN
    UPDATE AffrontementAnime
    SET vote_anime1 = vote_1,
        vote_anime2 = vote_2
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
BEGIN
    UPDATE AffrontementManga
    SET vote_manga1 = vote_1,
        vote_manga2 = vote_2
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
BEGIN
    UPDATE AffrontementPersonnage
    SET vote_personnage1 = vote_1,
        vote_personnage2 = vote_2
    WHERE id_tournoipersonnage = id_tournoi
      AND ((id_personnage1 = id_1 AND id_personnage2 = id_2) OR (id_personnage1 = id_2 AND id_personnage2 = id_1));
END;
$$ LANGUAGE plpgsql;



CALL MettreAJourAffrontementAnime(1,5114,11061,15,3);
CALL MettreAJourAffrontementManga(1,2,13,1,5);
CALL MettreAJourAffrontementPersonnage(1,417, 45627, 4555, 2);