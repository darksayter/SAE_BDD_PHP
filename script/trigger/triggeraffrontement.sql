CREATE OR REPLACE FUNCTION MettreAJourClassementAnime()
RETURNS TRIGGER AS $$
DECLARE
    participants INT[];
    total_participants INT;
    new_etapes_winner INT;
    new_etapes_loser INT;
    new_place_winner FLOAT;
    new_place_loser FLOAT;
BEGIN
    IF NEW.vote_anime1 > 0 OR NEW.vote_anime2 > 0 THEN
        -- Mettre à jour l'étape du perdant et du gagnant
        new_etapes_winner := NEW.etapes + 1;
        new_etapes_loser := NEW.etapes;

        UPDATE ClassementAnime
        SET etapes = CASE WHEN id_anime = NEW.id_anime1 THEN new_etapes_winner ELSE new_etapes_loser END
        WHERE id_anime IN (NEW.id_anime1, NEW.id_anime2) AND id_tournoianime = NEW.id_tournoianime;

        -- Calcul du classement du participant
        SELECT COUNT(*) * 2 INTO total_participants
        FROM AffrontementAnime
        WHERE etapes = 0 AND id_tournoianime = NEW.id_tournoianime;

        new_place_winner := total_participants / (2 ^ new_etapes_winner);
        new_place_loser := total_participants / (2 ^ new_etapes_loser);

        UPDATE ClassementAnime
        SET place = CASE WHEN id_anime = NEW.id_anime1 THEN new_place_winner ELSE new_place_loser END
        WHERE id_anime IN (NEW.id_anime1, NEW.id_anime2) AND id_tournoianime = NEW.id_tournoianime;

        -- Recherche des participants sans affrontement à cette étape

    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourClassementAnime
AFTER UPDATE OF vote_anime1, vote_anime2 ON AffrontementAnime
FOR EACH ROW
EXECUTE FUNCTION MettreAJourClassementAnime();