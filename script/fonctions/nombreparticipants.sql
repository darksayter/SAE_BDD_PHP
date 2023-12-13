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


SELECT * FROM VerifierAffrontementsTermines(1);