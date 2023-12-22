CREATE OR REPLACE FUNCTION VerifierAffrontementsTerminesAnimes(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    etape INT := 0;
    temporaire BOOLEAN := false;
    etape_affrontement RECORD;
BEGIN
    LOOP
        
        temporaire := false;

        FOR etape_affrontement IN (
            SELECT vote_anime1, vote_anime2
            FROM AffrontementAnime AS ea
            WHERE ea.id_tournoianime = id_tournoi and ea.etapes = etape
        ) LOOP
            IF (SELECT COUNT(*) FROM AffrontementAnime WHERE vote_anime1 = 0 AND vote_anime2 = 0 and etapes = etape) > 0 THEN
                temporaire := true;
            END IF;

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

CREATE OR REPLACE FUNCTION MettreAJourEtapeTournoiAnime()
RETURNS TRIGGER AS $$
DECLARE
    tournoi_id INT;
    nouvelle_etape INT;
BEGIN
    tournoi_id := NEW.id_tournoianime;

    nouvelle_etape := VerifierAffrontementsTerminesAnimes(tournoi_id);

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




CREATE OR REPLACE FUNCTION VerifierAffrontementsTerminesMangas(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    etape INT := 0;
    temporaire BOOLEAN := false;
    etape_affrontement RECORD;
BEGIN
    LOOP
        temporaire := false;

        FOR etape_affrontement IN (
            SELECT vote_manga1, vote_manga2
            FROM AffrontementManga AS ea
            WHERE ea.id_tournoimanga = id_tournoi AND ea.etapes = etape
        ) LOOP
            IF (SELECT COUNT(*) FROM AffrontementManga WHERE vote_manga1 = 0 AND vote_manga2 = 0 AND etapes = etape) > 0 THEN
                temporaire := true;
            END IF;

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

CREATE OR REPLACE FUNCTION MettreAJourEtapeTournoiManga()
RETURNS TRIGGER AS $$
DECLARE
    tournoi_id INT;
    nouvelle_etape INT;
BEGIN
    tournoi_id := NEW.id_tournoimanga;

    nouvelle_etape := VerifierAffrontementsTerminesMangas(tournoi_id);

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



CREATE OR REPLACE FUNCTION VerifierAffrontementsTerminesPersonnages(id_tournoi INT)
RETURNS INT AS $$
DECLARE
    etape INT := 0;
    temporaire BOOLEAN := false;
    etape_affrontement RECORD;
BEGIN
    LOOP
        temporaire := false;

        FOR etape_affrontement IN (
            SELECT vote_personnage1, vote_personnage2
            FROM AffrontementPersonnage AS ea
            WHERE ea.id_tournoipersonnage = id_tournoi AND ea.etapes = etape
        ) LOOP
            IF (SELECT COUNT(*) FROM AffrontementPersonnage WHERE vote_personnage1 = 0 AND vote_personnage2 = 0 AND etapes = etape) > 0 THEN
                temporaire := true;
            END IF;

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

CREATE OR REPLACE FUNCTION MettreAJourEtapeTournoiPersonnage()
RETURNS TRIGGER AS $$
DECLARE
    tournoi_id INT;
    nouvelle_etape INT;
BEGIN
    tournoi_id := NEW.id_tournoipersonnage;

    nouvelle_etape := VerifierAffrontementsTerminesPersonnages(tournoi_id);

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
