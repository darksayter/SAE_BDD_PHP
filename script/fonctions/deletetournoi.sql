-- Supprime tous les affrontements, classements et le tournoi anime associés à un ID de tournoi anime spécifié.

CREATE OR REPLACE PROCEDURE deletetournoianime(id INT)
AS $$
BEGIN
    -- Suppression des affrontements anime liés à l'ID du tournoi anime
    DELETE FROM AffrontementAnime WHERE id_tournoianime = id;
    
    -- Suppression des classements anime liés à l'ID du tournoi anime
    DELETE FROM ClassementAnime WHERE id_tournoianime = id;
    
    -- Suppression du tournoi anime lui-même
    DELETE FROM TournoiAnime WHERE id_tournoianime = id;
END;
$$ LANGUAGE plpgsql;


-- Supprime tous les affrontements, classements et le tournoi manga associés à un ID de tournoi manga spécifié.

CREATE OR REPLACE PROCEDURE deletetournoimanga(id INT)
AS $$
BEGIN
    -- Suppression des affrontements manga liés à l'ID du tournoi manga
    DELETE FROM AffrontementManga WHERE id_tournoimanga = id;
    
    -- Suppression des classements manga liés à l'ID du tournoi manga
    DELETE FROM ClassementManga WHERE id_tournoimanga = id;
    
    -- Suppression du tournoi manga lui-même
    DELETE FROM TournoiManga WHERE id_tournoimanga = id;
END;
$$ LANGUAGE plpgsql;


-- Supprime tous les affrontements, classements et le tournoi personnage associés à un ID de tournoi personnage spécifié.

CREATE OR REPLACE PROCEDURE deletetournoipersonnage(id INT)
AS $$
BEGIN
    -- Suppression des affrontements personnage liés à l'ID du tournoi personnage
    DELETE FROM AffrontementPersonnage WHERE id_tournoipersonnage = id;
    
    -- Suppression des classements personnage liés à l'ID du tournoi personnage
    DELETE FROM ClassementPersonnage WHERE id_tournoipersonnage = id;
    
    -- Suppression du tournoi personnage lui-même
    DELETE FROM TournoiPersonnage WHERE id_tournoipersonnage = id;
END;
$$ LANGUAGE plpgsql;



-- Supprime tous les affrontements, classements et tournois anime.

CREATE OR REPLACE PROCEDURE deletealltournoianime()
AS $$
BEGIN
    -- Suppression de tous les affrontements anime
    DELETE FROM AffrontementAnime;
    
    -- Suppression de tous les classements anime
    DELETE FROM ClassementAnime;
    
    -- Suppression de tous les tournois anime
    DELETE FROM TournoiAnime;
END;
$$ LANGUAGE plpgsql;



-- Supprime tous les affrontements, classements et tournois manga.

CREATE OR REPLACE PROCEDURE deletealltournoimanga()
AS $$
BEGIN
    -- Suppression de tous les affrontements manga
    DELETE FROM AffrontementManga;
    
    -- Suppression de tous les classements manga
    DELETE FROM ClassementManga;
    
    -- Suppression de tous les tournois manga
    DELETE FROM TournoiManga;
END;
$$ LANGUAGE plpgsql;



-- Supprime tous les affrontements, classements et tournois personnage.

CREATE OR REPLACE PROCEDURE deletealltournoipersonnage()
AS $$
BEGIN
    -- Suppression de tous les affrontements personnage
    DELETE FROM AffrontementPersonnage;
    
    -- Suppression de tous les classements personnage
    DELETE FROM ClassementPersonnage;
    
    -- Suppression de tous les tournois personnage
    DELETE FROM TournoiPersonnage;
END;
$$ LANGUAGE plpgsql;

