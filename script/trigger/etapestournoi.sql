CREATE OR REPLACE FUNCTION VerifierAffrontementsTermines(id_tournoi INT)
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

CREATE OR REPLACE FUNCTION MettreAJourEtapeTournoi()
RETURNS TRIGGER AS $$
DECLARE
    tournoi_id INT;
    nouvelle_etape INT;
BEGIN
    tournoi_id := NEW.id_tournoianime;

    nouvelle_etape := VerifierAffrontementsTermines(tournoi_id);

    IF nouvelle_etape > 0 THEN
        UPDATE TournoiAnime
        SET etapes = nouvelle_etape
        WHERE id_tournoianime = tournoi_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER MiseAJourEtapeTournoiTrigger
AFTER UPDATE OF vote_anime1, vote_anime2 ON AffrontementAnime
FOR EACH ROW
EXECUTE FUNCTION MettreAJourEtapeTournoi();
