-- Déclencheur qui met à jour le classement anime après un affrontement.

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
    -- Vérifie si l'affrontement a reçu des votes
    IF NEW.vote_anime1 > 0 OR NEW.vote_anime2 > 0 THEN
        -- Met à jour l'étape du perdant et du gagnant
        new_etapes_winner := NEW.etapes + 1;
        new_etapes_loser := NEW.etapes;

        -- Met à jour l'étape du classement anime
        UPDATE ClassementAnime
        SET etapes = CASE WHEN id_anime = NEW.id_anime1 THEN new_etapes_winner ELSE new_etapes_loser END
        WHERE id_anime IN (NEW.id_anime1, NEW.id_anime2) AND id_tournoianime = NEW.id_tournoianime;

        -- Calcul du classement du participant
        SELECT COUNT(*) * 2 INTO total_participants
        FROM AffrontementAnime
        WHERE etapes = 0 AND id_tournoianime = NEW.id_tournoianime;

        new_place_winner := total_participants / (2 ^ new_etapes_winner);
        new_place_loser := total_participants / (2 ^ new_etapes_loser);

        -- Met à jour le classement anime avec la nouvelle place
        UPDATE ClassementAnime
        SET place = CASE WHEN id_anime = NEW.id_anime1 THEN new_place_winner ELSE new_place_loser END
        WHERE id_anime IN (NEW.id_anime1, NEW.id_anime2) AND id_tournoianime = NEW.id_tournoianime;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE TRIGGER MiseAJourClassementAnime
AFTER UPDATE OF vote_anime1, vote_anime2 ON AffrontementAnime
FOR EACH ROW
EXECUTE FUNCTION MettreAJourClassementAnime();






-- Déclencheur qui met à jour le classement personnage après un affrontement.

CREATE OR REPLACE FUNCTION MettreAJourClassementPersonnage()
RETURNS TRIGGER AS $$
DECLARE
    participants INT[];
    total_participants INT;
    new_etapes_winner INT;
    new_etapes_loser INT;
    new_place_winner FLOAT;
    new_place_loser FLOAT;
BEGIN
    -- Vérifie si l'affrontement a reçu des votes
    IF NEW.vote_personnage1 > 0 OR NEW.vote_personnage2 > 0 THEN
        -- Met à jour l'étape du perdant et du gagnant
        new_etapes_winner := NEW.etapes + 1;
        new_etapes_loser := NEW.etapes;

        -- Met à jour l'étape du classement personnage
        UPDATE ClassementPersonnage
        SET etapes = CASE WHEN id_personnage = NEW.id_personnage1 THEN new_etapes_winner ELSE new_etapes_loser END
        WHERE id_personnage IN (NEW.id_personnage1, NEW.id_personnage2) AND id_tournoipersonnage = NEW.id_tournoipersonnage;

        -- Calcul du classement du participant
        SELECT COUNT(*) * 2 INTO total_participants
        FROM AffrontementPersonnage
        WHERE etapes = 0 AND id_tournoipersonnage = NEW.id_tournoipersonnage;

        new_place_winner := total_participants / (2 ^ new_etapes_winner);
        new_place_loser := total_participants / (2 ^ new_etapes_loser);

        -- Met à jour le classement personnage avec la nouvelle place
        UPDATE ClassementPersonnage
        SET place = CASE WHEN id_personnage = NEW.id_personnage1 THEN new_place_winner ELSE new_place_loser END
        WHERE id_personnage IN (NEW.id_personnage1, NEW.id_personnage2) AND id_tournoipersonnage = NEW.id_tournoipersonnage;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourClassementPersonnage
AFTER UPDATE OF vote_personnage1, vote_personnage2 ON AffrontementPersonnage
FOR EACH ROW
EXECUTE FUNCTION MettreAJourClassementPersonnage();




-- Déclencheur qui met à jour le classement manga après un affrontement.

CREATE OR REPLACE FUNCTION MettreAJourClassementManga()
RETURNS TRIGGER AS $$
DECLARE
    participants INT[];
    total_participants INT;
    new_etapes_winner INT;
    new_etapes_loser INT;
    new_place_winner FLOAT;
    new_place_loser FLOAT;
BEGIN
    -- Vérifie si l'affrontement a reçu des votes
    IF NEW.vote_manga1 > 0 OR NEW.vote_manga2 > 0 THEN
        -- Met à jour l'étape du perdant et du gagnant
        new_etapes_winner := NEW.etapes + 1;
        new_etapes_loser := NEW.etapes;

        -- Met à jour l'étape du classement manga
        UPDATE ClassementManga
        SET etapes = CASE WHEN id_manga = NEW.id_manga1 THEN new_etapes_winner ELSE new_etapes_loser END
        WHERE id_manga IN (NEW.id_manga1, NEW.id_manga2) AND id_tournoimanga = NEW.id_tournoimanga;

        -- Calcul du classement du participant
        SELECT COUNT(*) * 2 INTO total_participants
        FROM AffrontementManga
        WHERE etapes = 0 AND id_tournoimanga = NEW.id_tournoimanga;

        new_place_winner := total_participants / (2 ^ new_etapes_winner);
        new_place_loser := total_participants / (2 ^ new_etapes_loser);

        -- Met à jour le classement manga avec la nouvelle place
        UPDATE ClassementManga
        SET place = CASE WHEN id_manga = NEW.id_manga1 THEN new_place_winner ELSE new_place_loser END
        WHERE id_manga IN (NEW.id_manga1, NEW.id_manga2) AND id_tournoimanga = NEW.id_tournoimanga;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourClassementManga
AFTER UPDATE OF vote_manga1, vote_manga2 ON AffrontementManga
FOR EACH ROW
EXECUTE FUNCTION MettreAJourClassementManga();
