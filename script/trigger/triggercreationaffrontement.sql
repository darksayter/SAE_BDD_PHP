-- Déclencheur qui crée un nouvel affrontement anime lorsqu'un participant termine un affrontement.

CREATE OR REPLACE FUNCTION CreerAffrontementAnime()
RETURNS TRIGGER AS $$
DECLARE
    id_anime2 INT;
    id_anime_winner INT;
BEGIN
    -- Recherche d'un autre participant du même tournoi et de la même étape sans affrontement et qui n'est pas lui-même
    SELECT ca.id_anime INTO id_anime2
    FROM ClassementAnime ca
    LEFT JOIN AffrontementAnime aa1 ON ca.id_anime = aa1.id_anime1 AND aa1.etapes = NEW.etapes
    LEFT JOIN AffrontementAnime aa2 ON ca.id_anime = aa2.id_anime2 AND aa2.etapes = NEW.etapes
    WHERE ca.id_tournoianime = NEW.id_tournoianime 
    AND (aa1.id_anime1 IS NULL AND aa2.id_anime2 IS NULL) -- Vérifie si le participant n'a pas d'affrontement
    AND ca.etapes = NEW.etapes AND ca.id_anime != NEW.id_anime
    ORDER BY ca.place ASC
    LIMIT 1;

    -- Récupération de l'id de l'anime gagnant au tour précédent s'il existe
    SELECT CASE
        WHEN AffrontementAnime.vote_anime1 > AffrontementAnime.vote_anime2 THEN AffrontementAnime.id_anime1
        WHEN AffrontementAnime.vote_anime2 > AffrontementAnime.vote_anime1 THEN AffrontementAnime.id_anime2
        ELSE NULL
    END INTO id_anime_winner
    FROM AffrontementAnime
    WHERE id_tournoianime = NEW.id_tournoianime
    AND etapes = NEW.etapes - 1;

    -- Utilise l'id de l'anime gagnant si disponible
    IF id_anime_winner IS NOT NULL THEN
        id_anime2 := id_anime_winner;
    END IF;

    -- Création de l'affrontement si un autre participant est trouvé
    IF id_anime2 IS NOT NULL THEN
        INSERT INTO AffrontementAnime (
            id_anime1, id_anime2, id_tournoianime, vote_anime1, vote_anime2, etapes
        )
        VALUES (
            id_anime_winner, id_anime2,
            NEW.id_tournoianime, 0, 0, NEW.etapes
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER VerifierEtCreerAffrontementAnime
AFTER UPDATE OF etapes ON ClassementAnime
FOR EACH ROW
EXECUTE FUNCTION CreerAffrontementAnime();


-- Déclencheur qui crée un nouvel affrontement personnage lorsqu'un participant termine un affrontement.

CREATE OR REPLACE FUNCTION CreerAffrontementPersonnage()
RETURNS TRIGGER AS $$
DECLARE
    id_personnage2 INT;
BEGIN
    -- Recherche d'un autre participant du même tournoi et de la même étape sans affrontement et qui n'est pas lui-même
    SELECT cp.id_personnage INTO id_personnage2
    FROM ClassementPersonnage cp
    LEFT JOIN AffrontementPersonnage ap1 ON cp.id_personnage = ap1.id_personnage1 AND ap1.etapes = NEW.etapes
    LEFT JOIN AffrontementPersonnage ap2 ON cp.id_personnage = ap2.id_personnage2 AND ap2.etapes = NEW.etapes
    WHERE cp.id_tournoipersonnage = NEW.id_tournoipersonnage 
    AND (ap1.id_personnage1 IS NULL AND ap2.id_personnage2 IS NULL) -- Vérifie si le participant n'a pas d'affrontement
    AND cp.etapes = NEW.etapes AND cp.id_personnage != NEW.id_personnage
    LIMIT 1;

    -- Création de l'affrontement si un autre participant est trouvé
    IF id_personnage2 IS NOT NULL THEN
        INSERT INTO AffrontementPersonnage (
            id_personnage1, id_personnage2, id_tournoipersonnage, vote_personnage1, vote_personnage2, etapes
        )
        VALUES (
            NEW.id_personnage, id_personnage2,
            NEW.id_tournoipersonnage, 0, 0, NEW.etapes
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER VerifierEtCreerAffrontementPersonnage
AFTER UPDATE OF etapes ON ClassementPersonnage
FOR EACH ROW
EXECUTE FUNCTION CreerAffrontementPersonnage();



-- Déclencheur qui crée un nouvel affrontement manga lorsqu'un participant termine un affrontement.

CREATE OR REPLACE FUNCTION CreerAffrontementManga()
RETURNS TRIGGER AS $$
DECLARE
    id_manga2 INT;
BEGIN
    -- Recherche d'un autre participant du même tournoi et de la même étape sans affrontement et qui n'est pas lui-même
    SELECT cm.id_manga INTO id_manga2
    FROM ClassementManga cm
    LEFT JOIN AffrontementManga am1 ON cm.id_manga = am1.id_manga1 AND am1.etapes = NEW.etapes
    LEFT JOIN AffrontementManga am2 ON cm.id_manga = am2.id_manga2 AND am2.etapes = NEW.etapes
    WHERE cm.id_tournoimanga = NEW.id_tournoimanga 
    AND (am1.id_manga1 IS NULL AND am2.id_manga2 IS NULL) -- Vérifie si le participant n'a pas d'affrontement
    AND cm.etapes = NEW.etapes AND cm.id_manga != NEW.id_manga
    LIMIT 1;

    -- Création de l'affrontement si un autre participant est trouvé
    IF id_manga2 IS NOT NULL THEN
        INSERT INTO AffrontementManga (
            id_manga1, id_manga2, id_tournoimanga, vote_manga1, vote_manga2, etapes
        )
        VALUES (
            NEW.id_manga, id_manga2,
            NEW.id_tournoimanga, 0, 0, NEW.etapes
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER VerifierEtCreerAffrontementManga
AFTER UPDATE OF etapes ON ClassementManga
FOR EACH ROW
EXECUTE FUNCTION CreerAffrontementManga();
