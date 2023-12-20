CREATE OR REPLACE FUNCTION NoterAnimes(
    profil_id INT,
    epoque INT
    --watchtimes INT
) 
RETURNS TABLE (id_anime INT, note BIGINT) AS $$
DECLARE
    genres_anime INT[];
    themes_anime INT[];
    genre INT;
    theme INT;
    genre2 INT;
    theme2 INT;
BEGIN
    FOR id_anime, genres_anime, themes_anime IN
        SELECT a.id_anime, ARRAY_AGG(DISTINCT ang.id_genre), ARRAY_AGG(DISTINCT ant.id_theme)
        FROM Anime a
        INNER JOIN AnimeGenre ang ON ang.id_anime = a.id_anime
        INNER JOIN AnimeTheme ant ON ant.id_anime = a.id_anime
        WHERE ((epoque = 1 AND a.premiered_year < 2000) OR (epoque = 2 AND a.premiered_year < 2015 AND a.premiered_year > 2000) OR (epoque = 3 AND a.premiered_year >= 2015))
        AND
        GROUP BY a.id_anime
    LOOP
        note := 0;
        FOR genre IN SELECT id_genre FROM GenresFav WHERE id_profil = profil_id LOOP
            IF genre = ANY(genres_anime) THEN
                note := note + 10;
            END IF;
        END LOOP;
        FOR theme IN SELECT id_theme FROM ThemesFav WHERE id_profil = profil_id LOOP
            IF theme = ANY(themes_anime) THEN
                note := note + 10;
            END IF;
        END LOOP;


        FOR theme2, genre2 IN (
            SELECT DISTINCT amt.id_theme, amg.id_genre FROM AnimeTheme amt, AnimeGenre amg
            WHERE amt.id_anime IN (SELECT af.id_anime FROM animesfav af WHERE af.id_profil = profil_id)
            AND amg.id_anime IN (SELECT af.id_anime FROM animesfav af WHERE af.id_profil = profil_id)) LOOP
            IF theme2 = ANY(themes_anime) THEN
                note := note + 1;
            END IF;
        END LOOP;

        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM NoterAnimes(1,1) ORDER BY note DESC LIMIT 10;