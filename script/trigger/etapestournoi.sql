-- Fonction qui vérifie si tous les affrontements d'une étape dans un tournoi anime sont terminés. Cette fonction est nécessaire
-- pour le trigger juste après

CREATE OR REPLACE FUNCTION VerifierAffrontementsTerminesAnimes(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    etape INT := 0;
    temporaire BOOLEAN := false;
    etape_affrontement RECORD;
    test INT := 0;
BEGIN
    LOOP
        temporaire := false;

        -- Parcours des affrontements de l'étape
        FOR etape_affrontement IN (
            SELECT vote_anime1, vote_anime2
            FROM AffrontementAnime AS ea
            WHERE ea.id_tournoianime = id_tournoi and ea.etapes = etape
        ) LOOP
            SELECT COUNT(Af.*) INTO test FROM AffrontementAnime Af WHERE Af.etapes = etape AND id_tournoianime = id_tournoi;
            --RAISE NOTICE 'test %', test; 
            -- Vérification si tous les votes sont nuls
            IF (SELECT COUNT(*) FROM AffrontementAnime WHERE vote_anime1 = 0 AND vote_anime2 = 0 and etapes = etape AND id_tournoianime = id_tournoi) > 0 THEN
                temporaire := true;
            ELSIF (SELECT COUNT(*) FROM AffrontementAnime WHERE etapes = etape AND id_tournoianime = id_tournoi) < 2 THEN 
                temporaire := true;
                etape := etape + 1;
            END IF;

            -- Retourne l'étape si tous les affrontements sont terminés
            IF temporaire THEN
                RETURN etape;
            END IF;
        END LOOP;

        EXIT WHEN temporaire;
        etape := etape + 1;
    END LOOP;

    RETURN 0;
END;
$$ LANGUAGE plpgsql;


-- Déclencheur qui met à jour l'étape du tournoi anime si tous les affrontements de l'étape sont terminés.

CREATE OR REPLACE FUNCTION MettreAJourEtapeTournoiAnime()
RETURNS TRIGGER AS $$
DECLARE
    tournoi_id INT;
    nouvelle_etape INT;
BEGIN
    tournoi_id := NEW.id_tournoianime;

    -- Appel de la fonction de vérification des affrontements terminés
    nouvelle_etape := VerifierAffrontementsTerminesAnimes(tournoi_id);

    -- Mise à jour de l'étape si nécessaire
    IF nouvelle_etape > 0 THEN
        UPDATE TournoiAnime
        SET etapes = nouvelle_etape
        WHERE id_tournoianime = tournoi_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourEtapeTournoiTriggerAnime
AFTER UPDATE OF vote_anime1, vote_anime2 ON AffrontementAnime
FOR EACH ROW
EXECUTE FUNCTION MettreAJourEtapeTournoiAnime();




-- Fonction qui vérifie si tous les affrontements d'une étape dans un tournoi manga sont terminés. Cette fonction est nécessaire
-- pour le trigger juste après

CREATE OR REPLACE FUNCTION VerifierAffrontementsTerminesMangas(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    etape INT := 0;
    temporaire BOOLEAN := false;
    etape_affrontement RECORD;
BEGIN
    LOOP
        temporaire := false;

        -- Parcours des affrontements de l'étape
        FOR etape_affrontement IN (
            SELECT vote_manga1, vote_manga2
            FROM AffrontementManga AS ea
            WHERE ea.id_tournoimanga = id_tournoi AND ea.etapes = etape
        ) LOOP
            -- Vérification si tous les votes sont nuls
            IF (SELECT COUNT(*) FROM AffrontementManga WHERE vote_manga1 = 0 AND vote_manga2 = 0 and etapes = etape AND id_tournoimanga = id_tournoi) > 0 THEN
                temporaire := true;
            ELSIF (SELECT COUNT(*) FROM AffrontementManga WHERE etapes = etape AND id_tournoimanga = id_tournoi) < 2 THEN 
                temporaire := true;
                etape := etape + 1;
            END IF;

            -- Retourne l'étape si tous les affrontements sont terminés
            IF temporaire THEN
                RETURN etape;
            END IF;
        END LOOP;

        EXIT WHEN temporaire;
        etape := etape + 1;
    END LOOP;

    RETURN 0;
END;
$$ LANGUAGE plpgsql;


-- Déclencheur qui met à jour l'étape du tournoi manga si tous les affrontements de l'étape sont terminés. Cette fonction est nécessaire
-- pour le trigger juste après

CREATE OR REPLACE FUNCTION MettreAJourEtapeTournoiManga()
RETURNS TRIGGER AS $$
DECLARE
    tournoi_id INT;
    nouvelle_etape INT;
BEGIN
    tournoi_id := NEW.id_tournoimanga;

    -- Appel de la fonction de vérification des affrontements terminés
    nouvelle_etape := VerifierAffrontementsTerminesMangas(tournoi_id);

    -- Mise à jour de l'étape si nécessaire
    IF nouvelle_etape > 0 THEN
        UPDATE TournoiManga
        SET etapes = nouvelle_etape
        WHERE id_tournoimanga = tournoi_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourEtapeTournoiMangaTrigger
AFTER UPDATE OF vote_manga1, vote_manga2 ON AffrontementManga
FOR EACH ROW
EXECUTE FUNCTION MettreAJourEtapeTournoiManga();



-- Fonction qui vérifie si tous les affrontements d'une étape dans un tournoi personnage sont terminés.

CREATE OR REPLACE FUNCTION VerifierAffrontementsTerminesPersonnages(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    etape INT := 0;
    temporaire BOOLEAN := false;
    etape_affrontement RECORD;
BEGIN
    LOOP
        temporaire := false;

        -- Parcours des affrontements de l'étape
        FOR etape_affrontement IN (
            SELECT vote_personnage1, vote_personnage2
            FROM AffrontementPersonnage AS ea
            WHERE ea.id_tournoipersonnage = id_tournoi AND ea.etapes = etape
        ) LOOP
            -- Vérification si tous les votes sont nuls
            IF (SELECT COUNT(*) FROM AffrontementPersonnage WHERE vote_personnage1 = 0 AND vote_personnage2 = 0 and etapes = etape AND id_tournoipersonnage = id_tournoi) > 0 THEN
                temporaire := true;
            ELSIF (SELECT COUNT(*) FROM AffrontementPersonnage WHERE etapes = etape AND id_tournoipersonnage = id_tournoi) < 2 THEN 
                temporaire := true;
                etape := etape + 1;
            END IF;


            -- Retourne l'étape si tous les affrontements sont terminés
            IF temporaire THEN
                RETURN etape;
            END IF;
        END LOOP;

        EXIT WHEN temporaire;
        etape := etape + 1;
    END LOOP;

    RETURN 0;
END;
$$ LANGUAGE plpgsql;


-- Déclencheur qui met à jour l'étape du tournoi personnage si tous les affrontements de l'étape sont terminés.

CREATE OR REPLACE FUNCTION MettreAJourEtapeTournoiPersonnage()
RETURNS TRIGGER AS $$
DECLARE
    tournoi_id INT;
    nouvelle_etape INT;
BEGIN
    tournoi_id := NEW.id_tournoipersonnage;

    -- Appel de la fonction de vérification des affrontements terminés
    nouvelle_etape := VerifierAffrontementsTerminesPersonnages(tournoi_id);

    -- Mise à jour de l'étape si nécessaire
    IF nouvelle_etape > 0 THEN
        UPDATE TournoiPersonnage
        SET etapes = nouvelle_etape
        WHERE id_tournoipersonnage = tournoi_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER MiseAJourEtapeTournoiPersonnageTrigger
AFTER UPDATE OF vote_personnage1, vote_personnage2 ON AffrontementPersonnage
FOR EACH ROW
EXECUTE FUNCTION MettreAJourEtapeTournoiPersonnage();
