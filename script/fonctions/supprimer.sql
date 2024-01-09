-- Procédure qui supprime un anime et toutes ses références par ID.

CREATE OR REPLACE PROCEDURE SupprimerAnimeParID(
    IN idanime INT
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Suppression des entrées dans les tables liées à AnimeTheme, AnimeGenre, ClassementAnime et AffrontementAnime.
    DELETE FROM AnimeTheme At WHERE At.id_anime = idanime;
    DELETE FROM AnimeGenre Ag WHERE Ag.id_anime = idanime;
    DELETE FROM ClassementAnime Ca WHERE Ca.id_anime = idanime;
    DELETE FROM AffrontementAnime Aa WHERE Aa.id_anime1 = idanime;
    DELETE FROM AffrontementAnime Aa WHERE Aa.id_anime2 = idanime;

    -- Suppression de l'entrée dans la table Anime.
    DELETE FROM Anime A WHERE A.id_anime = idanime;
END;
$$;



-- Procédure qui supprime un manga et toutes ses références par ID.

CREATE OR REPLACE PROCEDURE SupprimerMangaParID(
    IN idmanga INT
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Suppression des entrées dans les tables liées à MangaTheme, MangaGenre, ClassementManga et AffrontementManga.
    DELETE FROM MangaTheme Mt WHERE Mt.id_manga = idmanga;
    DELETE FROM MangaGenre Mg WHERE Mg.id_manga = idmanga;
    DELETE FROM ClassementManga Cm WHERE Cm.id_manga = idmanga;
    DELETE FROM AffrontementManga Am WHERE Am.id_manga1 = idmanga;
    DELETE FROM AffrontementManga Am WHERE Am.id_manga2 = idmanga;

    -- Suppression de l'entrée dans la table Manga.
    DELETE FROM Manga M WHERE M.id_manga = idmanga;
END;
$$;



-- Procédure qui supprime un personnage et toutes ses références par ID.

CREATE OR REPLACE PROCEDURE SupprimerPersonnageParID(
    IN idpersonnage INT
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Suppression des entrées dans les tables liées à ClassementPersonnage et AffrontementPersonnage.
    DELETE FROM ClassementPersonnage Cp WHERE Cp.id_personnage = idpersonnage;
    DELETE FROM AffrontementPersonnage Ap WHERE Ap.id_personnage1 = idpersonnage;
    DELETE FROM AffrontementPersonnage Ap WHERE Ap.id_personnage2 = idpersonnage;

    -- Suppression de l'entrée dans la table Personnage.
    DELETE FROM Personnage P WHERE P.id_pers = idpersonnage;
END;
$$;


CALL SupprimerAnimeParID(52421);
CALL SupprimerMangaParID(149372);
CALL SupprimerPersonnageParID(214047);