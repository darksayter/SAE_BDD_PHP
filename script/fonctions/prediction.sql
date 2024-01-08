-- Fonction qui attribue des notes aux animes en fonction des préférences de l'utilisateur et qui suggère ensuite les mangas
-- qui correspondent le plus aux gouts de l'utilisateur

CREATE OR REPLACE FUNCTION NoterAnimes(
    profil_id INT,
    epoque INT,
    watch_time INT        --nous ne l'avons pas encore implémenté mais il est possible que cette fonction évolue
) 
RETURNS TABLE (id_anime INT, note BIGINT) AS $$
DECLARE
    demographics_anime VARCHAR[];
    studios_anime VARCHAR[];
    producers_anime VARCHAR[];
    licensors_anime VARCHAR[];
    genres_anime INT[];
    themes_anime INT[];
    genre INT;
    theme INT;
    genre2 INT;
    theme2 INT;
    demographics2 VARCHAR[];
    studios2 VARCHAR[];
    producers2 VARCHAR[];
    licensors2 VARCHAR[];
    idanime INT;
BEGIN
    -- Parcours des animes en fonction de l'époque spécifiée et regroupement par identifiant anime.
    FOR id_anime, idanime, genres_anime, themes_anime, demographics_anime, studios_anime, producers_anime, licensors_anime IN
        SELECT a.id_anime, a.id_anime, ARRAY_AGG(DISTINCT ang.id_genre), ARRAY_AGG(DISTINCT ant.id_theme), ARRAY_AGG(DISTINCT a.demographics), ARRAY_AGG(DISTINCT a.studios), ARRAY_AGG(DISTINCT a.producers), ARRAY_AGG(DISTINCT a.licensors)
        FROM Anime a
        INNER JOIN AnimeGenre ang ON ang.id_anime = a.id_anime
        INNER JOIN AnimeTheme ant ON ant.id_anime = a.id_anime
        WHERE ((epoque = 1 AND a.premiered_year < 2000) OR (epoque = 2 AND a.premiered_year < 2015 AND a.premiered_year > 2000) OR (epoque = 3 AND a.premiered_year >= 2015))
        GROUP BY a.id_anime
    LOOP
        note := 0;
        -- Attribution des points en fonction des genres favoris de l'utilisateur.
        FOR genre IN SELECT id_genre FROM GenresFav WHERE id_profil = profil_id LOOP
            IF genre = ANY(genres_anime) THEN
                note := note + 5;
            END IF;
        END LOOP;
        -- Attribution des points en fonction des thèmes favoris de l'utilisateur.
        FOR theme IN SELECT id_theme FROM ThemesFav WHERE id_profil = profil_id LOOP
            IF theme = ANY(themes_anime) THEN
                note := note + 5;
            END IF;
        END LOOP;

        -- Attribution de points supplémentaires en fonction des thèmes et genres des animes déjà favoris de l'utilisateur.
        FOR theme2, genre2 IN (
            SELECT DISTINCT amt.id_theme, amg.id_genre FROM AnimeTheme amt, AnimeGenre amg
            WHERE amt.id_anime IN (SELECT af.id_anime FROM animesfav af WHERE af.id_profil = profil_id)
            AND amg.id_anime IN (SELECT af.id_anime FROM animesfav af WHERE af.id_profil = profil_id)) LOOP
            IF theme2 = ANY(themes_anime) THEN
                note := note + 1;
            END IF;
        END LOOP;

        IF watch_time = 0 THEN
            IF (SELECT COUNT(*) FROM Anime a WHERE a.id_anime = idanime AND episodes < 15) > 0 THEN
                note := note + 10;
            END IF;
        ELSIF watch_time = 1 THEN
            IF (SELECT COUNT(*) FROM Anime a WHERE a.id_anime = idanime AND episodes BETWEEN 15 AND 50) > 0 THEN
                note := note + 5;
            END IF;
        ELSIF watch_time = 2 THEN
            IF (SELECT COUNT(*) FROM Anime a WHERE a.id_anime = idanime AND episodes > 50) > 0 THEN
                note := note + 5;
            END IF;
        END IF;

        SELECT ARRAY_AGG(DISTINCT demographics) INTO demographics2 FROM Anime a INNER JOIN animesfav af on af.id_anime = a.id_anime WHERE af.id_profil = profil_id;
        SELECT ARRAY_AGG(DISTINCT studios) INTO studios2 FROM Anime a INNER JOIN animesfav af on af.id_anime = a.id_anime WHERE af.id_profil = profil_id;
        SELECT ARRAY_AGG(DISTINCT REGEXP_REPLACE(producers, '"', '''', 'g')) INTO producers2 
        FROM (
            SELECT unnest(producers) as producers
            FROM Anime a 
            INNER JOIN animesfav af on af.id_anime = a.id_anime 
            WHERE af.id_profil = profil_id
        ) subquery;
        SELECT ARRAY_AGG(DISTINCT licensors) INTO licensors2 FROM Anime a INNER JOIN animesfav af on af.id_anime = a.id_anime WHERE af.id_profil = profil_id;

        FOR i IN 1..array_length(demographics2, 1) LOOP
            IF demographics2[i] = ANY(demographics_anime) THEN
                note := note + 1;
            END IF;
        END LOOP;

        FOR i IN 1..array_length(studios2, 1) LOOP
            IF studios2[i] = ANY(studios_anime) THEN
                note := note + 1;
            END IF;
        END LOOP;

        FOR i IN 1..array_length(producers2, 1) LOOP
            IF producers2[i] = ANY(producers_anime) THEN
                note := note + 1;
            END IF;
        END LOOP;

        FOR i IN 1..array_length(licensors2, 1) LOOP
            IF licensors2[i] = ANY(licensors_anime) THEN
                note := note + 1;
            END IF;
        END LOOP;

        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;




-- Fonction qui attribue des notes aux mangas en fonction des préférences de l'utilisateur et qui suggère ensuite les mangas
-- qui correspondent le plus aux gouts de l'utilisateur

CREATE OR REPLACE FUNCTION NoterMangas(
    profil_id INT,
    epoque INT
) 
RETURNS TABLE (id_manga INT, note BIGINT) AS $$
DECLARE
    genres_manga INT[];
    themes_manga INT[];
    genre INT;
    theme INT;
    genre2 INT;
    theme2 INT;
BEGIN
    -- Parcours des mangas en fonction de l'époque spécifiée et regroupement par identifiant manga.
    FOR id_manga, genres_manga, themes_manga IN
        SELECT m.id_manga, ARRAY_AGG(DISTINCT mg.id_genre), ARRAY_AGG(DISTINCT mt.id_theme)
        FROM Manga m
        INNER JOIN MangaGenre mg ON mg.id_manga = m.id_manga
        INNER JOIN MangaTheme mt ON mt.id_manga = m.id_manga
        WHERE ((epoque = 1 AND m.published_from < '2000-01-01') OR (epoque = 2 AND m.published_from < '2015-01-01' AND m.published_from > '2000-01-01') OR (epoque = 3 AND m.published_from >= '2015-01-01'))
        GROUP BY m.id_manga
    LOOP
        note := 0;
        -- Attribution des points en fonction des genres favoris de l'utilisateur.
        FOR genre IN SELECT id_genre FROM GenresFav WHERE id_profil = profil_id LOOP
            IF genre = ANY(genres_manga) THEN
                note := note + 5;
            END IF;
        END LOOP;
        -- Attribution des points en fonction des thèmes favoris de l'utilisateur.
        FOR theme IN SELECT id_theme FROM ThemesFav WHERE id_profil = profil_id LOOP
            IF theme = ANY(themes_manga) THEN
                note := note + 5;
            END IF;
        END LOOP;

        -- Attribution de points supplémentaires en fonction des thèmes et genres des mangas déjà favoris de l'utilisateur.
        FOR theme2, genre2 IN (
            SELECT DISTINCT mmt.id_theme, mmg.id_genre FROM MangaTheme mmt, MangaGenre mmg
            WHERE mmt.id_manga IN (SELECT mf.id_manga FROM mangasfav mf WHERE mf.id_profil = profil_id)
            AND mmg.id_manga IN (SELECT mf.id_manga FROM mangasfav mf WHERE mf.id_profil = profil_id)) LOOP
            IF theme2 = ANY(themes_manga) THEN
                note := note + 1;
            END IF;
        END LOOP;

        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;





SELECT * FROM NoterAnimes(1,1,1) ORDER BY note DESC LIMIT 10;
SELECT * FROM NoterMangas(1,1) ORDER BY note DESC LIMIT 10;