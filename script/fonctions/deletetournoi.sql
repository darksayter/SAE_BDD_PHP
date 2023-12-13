CREATE OR REPLACE PROCEDURE deletetournoianime(id int)
AS $$
BEGIN
    DELETE FROM AffrontementAnime WHERE id_tournoianime = id;
    DELETE FROM ClassementAnime WHERE id_tournoianime = id;
    DELETE FROM TournoiAnime WHERE id_tournoianime = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE deletetournoimanga(id int)
AS $$
BEGIN
    DELETE FROM AffrontementManga WHERE id_tournoimanga = id;
    DELETE FROM ClassementManga WHERE id_tournoimanga = id;
    DELETE FROM TournoiManga WHERE id_tournoimanga = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE deletetournoipersonnage(id int)
AS $$
BEGIN
    DELETE FROM AffrontementPersonnage WHERE id_tournoipersonnage = id;
    DELETE FROM ClassementPersonnage WHERE id_tournoipersonnage = id;
    DELETE FROM TournoiPersonnage WHERE id_tournoipersonnage = id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE deletealltournoianime()
AS $$
BEGIN
    DELETE FROM AffrontementAnime;
    DELETE FROM ClassementAnime;
    DELETE FROM TournoiAnime;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE deletealltournoimanga()
AS $$
BEGIN
    DELETE FROM AffrontementManga;
    DELETE FROM ClassementManga;
    DELETE FROM TournoiManga;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE deletealltournoipersonnage()
AS $$
BEGIN
    DELETE FROM AffrontementPersonnage;
    DELETE FROM ClassementPersonnage;
    DELETE FROM TournoiPersonnage;
END;
$$ LANGUAGE plpgsql;