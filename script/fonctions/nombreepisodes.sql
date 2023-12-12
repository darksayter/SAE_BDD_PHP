CREATE OR REPLACE FUNCTION AnimeAvecLePlusEpisodes(limit_count INT)
RETURNS TABLE (
    id_anime INT,
    title VARCHAR(255),
    episodes INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT a.id_anime, a.title, a.episodes
    FROM Anime a
    WHERE a.episodes IS NOT NULL
    ORDER BY a.episodes DESC
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION MangaAvecLePlusTomes(limit_count INT)
RETURNS TABLE (
    id_manga INT,
    title VARCHAR(255),
    volumes INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT m.id_manga, m.title, m.volumes
    FROM Manga m
    WHERE m.volumes IS NOT NULL
    ORDER BY m.volumes DESC
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM AnimeAvecLePlusEpisodes();
SELECT * FROM MangaAvecLePlusTomes();