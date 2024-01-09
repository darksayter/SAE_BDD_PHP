-- Supprime tous les affrontements, classements et le tournoi anime associés à un ID de tournoi anime spécifié.

CREATE OR REPLACE PROCEDURE deletetournoianime(id INT)
AS $$
BEGIN
    DELETE FROM AffrontementAnime WHERE id_tournoianime = id;
    DELETE FROM ClassementAnime WHERE id_tournoianime = id;
    DELETE FROM TournoiAnime WHERE id_tournoianime = id;
END;
$$ LANGUAGE plpgsql;


-- Supprime tous les affrontements, classements et le tournoi manga associés à un ID de tournoi manga spécifié.

CREATE OR REPLACE PROCEDURE deletetournoimanga(id INT)
AS $$
BEGIN
    DELETE FROM AffrontementManga WHERE id_tournoimanga = id;
    DELETE FROM ClassementManga WHERE id_tournoimanga = id;
    DELETE FROM TournoiManga WHERE id_tournoimanga = id;
END;
$$ LANGUAGE plpgsql;


-- Supprime tous les affrontements, classements et le tournoi personnage associés à un ID de tournoi personnage spécifié.

CREATE OR REPLACE PROCEDURE deletetournoipersonnage(id INT)
AS $$
BEGIN
    DELETE FROM AffrontementPersonnage WHERE id_tournoipersonnage = id;
    DELETE FROM ClassementPersonnage WHERE id_tournoipersonnage = id;
    DELETE FROM TournoiPersonnage WHERE id_tournoipersonnage = id;
END;
$$ LANGUAGE plpgsql;



-- Supprime tous les affrontements, classements et tournois anime.

CREATE OR REPLACE PROCEDURE deletealltournoianime()
AS $$
BEGIN
    DELETE FROM AffrontementAnime;
    DELETE FROM ClassementAnime;
    DELETE FROM TournoiAnime;
END;
$$ LANGUAGE plpgsql;


-- Supprime tous les affrontements, classements et tournois anime.

CREATE OR REPLACE PROCEDURE deletealltournoianime()
AS $$
BEGIN
    DELETE FROM AffrontementAnime;
    DELETE FROM ClassementAnime;
    DELETE FROM TournoiAnime;
END;
$$ LANGUAGE plpgsql;


-- Supprime tous les affrontements, classements et tournois manga.

CREATE OR REPLACE PROCEDURE deletealltournoimanga()
AS $$
BEGIN
    DELETE FROM AffrontementManga;
    DELETE FROM ClassementManga;
    DELETE FROM TournoiManga;
END;
$$ LANGUAGE plpgsql;
