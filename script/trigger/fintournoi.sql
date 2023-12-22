-- Déclencheur qui met à jour le statut "fini" du tournoi anime si le nouvel affrontement a une place égale à 1.

CREATE OR REPLACE FUNCTION MettreAJourStatutFiniAnime()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifie si le nouvel affrontement a une place égale à 1 (gagnant du tournoi)
    IF NEW.place = 1 THEN
        -- Met à jour le statut "fini" du tournoi anime
        UPDATE TournoiAnime
        SET fini = TRUE
        WHERE id_tournoianime = NEW.id_tournoianime;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourStatutFiniAnime
AFTER UPDATE OF place ON ClassementAnime
FOR EACH ROW
EXECUTE FUNCTION MettreAJourStatutFiniAnime();


-- Déclencheur qui met à jour le statut "fini" du tournoi manga si le nouvel affrontement a une place égale à 1.

CREATE OR REPLACE FUNCTION MettreAJourStatutFiniManga()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifie si le nouvel affrontement a une place égale à 1 (gagnant du tournoi)
    IF NEW.place = 1 THEN
        -- Met à jour le statut "fini" du tournoi manga
        UPDATE TournoiManga
        SET fini = TRUE
        WHERE id_tournoimanga = NEW.id_tournoimanga;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourStatutFiniManga
AFTER UPDATE OF place ON ClassementManga
FOR EACH ROW
EXECUTE FUNCTION MettreAJourStatutFiniManga();



-- Déclencheur qui met à jour le statut "fini" du tournoi personnage si le nouvel affrontement a une place égale à 1.

CREATE OR REPLACE FUNCTION MettreAJourStatutFiniPersonnage()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifie si le nouvel affrontement a une place égale à 1 (gagnant du tournoi)
    IF NEW.place = 1 THEN
        -- Met à jour le statut "fini" du tournoi personnage
        UPDATE TournoiPersonnage
        SET fini = TRUE
        WHERE id_tournoipersonnage = NEW.id_tournoipersonnage;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourStatutFiniPersonnage
AFTER UPDATE OF place ON ClassementPersonnage
FOR EACH ROW
EXECUTE FUNCTION MettreAJourStatutFiniPersonnage();
