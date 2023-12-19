CREATE OR REPLACE PROCEDURE SupprimerAnimeParID(
    IN idanime INT
)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM AnimeTheme At WHERE At.id_anime = idanime;
    DELETE FROM AnimeGenre Ag WHERE Ag.id_anime = idanime;
    DELETE FROM ClassementAnime Ca WHERE Ca.id_anime = idanime;
    DELETE FROM AffrontementAnime Aa WHERE Aa.id_anime = idanime;

    DELETE FROM Anime A WHERE A.id_anime = idanime;
END;
$$;
