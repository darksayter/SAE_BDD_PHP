CREATE OR REPLACE PROCEDURE SupprimerAnimeParID(
    IN idanime INT
)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM AnimeTheme At WHERE At.id_anime = idanime;
    DELETE FROM AnimeGenre Ag WHERE Ag.id_anime = idanime;
    DELETE FROM ClassementAnime Ca WHERE Ca.id_anime = idanime;
    DELETE FROM AffrontementAnime Aa WHERE Aa.id_anime1 = idanime;
    DELETE FROM AffrontementAnime Aa WHERE Aa.id_anime2 = idanime;

    DELETE FROM Anime A WHERE A.id_anime = idanime;
END;
$$;


CREATE OR REPLACE PROCEDURE SupprimerMangaParID(
    IN idmanga INT
)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM MangaTheme Mt WHERE Mt.id_manga = idmanga;
    DELETE FROM MangaGenre Mg WHERE Mg.id_manga = idmanga;
    DELETE FROM ClassementManga Cm WHERE Cm.id_manga = idmanga;
    DELETE FROM AffrontementManga Am WHERE Am.id_manga1 = idmanga;
    DELETE FROM AffrontementManga Am WHERE Am.id_manga2 = idmanga;

    DELETE FROM Manga M WHERE M.id_manga = idmanga;
END;
$$;


CREATE OR REPLACE PROCEDURE SupprimerPersonnageParID(
    IN idpersonnage INT
)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM ClassementPersonnage Cp WHERE Cp.id_personnage = idpersonnage;
    DELETE FROM AffrontementPersonnage Ap WHERE Ap.id_personnage1 = idpersonnage;
    DELETE FROM AffrontementPersonnage Ap WHERE Ap.id_personnage2 = idpersonnage;

    DELETE FROM Personnage P WHERE P.id_pers = idpersonnage;
END;
$$;

CALL SupprimerAnimeParID(52421);
CALL SupprimerMangaParID(149372);
CALL SupprimerPersonnageParID(214047);