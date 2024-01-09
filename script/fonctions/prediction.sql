-- Fonction qui attribue des notes aux animes en fonction des préférences de l'utilisateur et qui suggère ensuite les mangas
-- qui correspondent le plus aux gouts de l'utilisateur

CREATE OR REPLACE FUNCTION NoterAnimes(
    profil_id INT,
    epoque INT,
    watch_time INT,
    popularite INT,
    typeanime INT,
    airedornot INT
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
    notes INT;
    notespar INT;
BEGIN
    -- Parcours des animes en fonction de l'époque spécifiée et regroupement par identifiant anime.
    FOR id_anime, idanime, notes, notespar, genres_anime, themes_anime, demographics_anime, studios_anime, producers_anime, licensors_anime IN
        SELECT a.id_anime, a.id_anime, ROUND(a.score), scored_by, ARRAY_AGG(DISTINCT ang.id_genre), ARRAY_AGG(DISTINCT ant.id_theme), ARRAY_AGG(DISTINCT a.demographics), ARRAY_AGG(DISTINCT a.studios), ARRAY_AGG(DISTINCT a.producers), ARRAY_AGG(DISTINCT a.licensors)
        FROM Anime a
        INNER JOIN AnimeGenre ang ON ang.id_anime = a.id_anime
        INNER JOIN AnimeTheme ant ON ant.id_anime = a.id_anime
        WHERE ((epoque = 0 AND a.premiered_year < 2000) OR (epoque = 1 AND a.premiered_year < 2015 AND a.premiered_year > 2000) OR (epoque = 2 AND a.premiered_year >= 2015) OR (epoque = 3))
        AND ((typeanime = 0 AND (a.type = 'TV' OR a.type = 'Movie' OR a.type = 'Special' OR a.type = 'ONA' OR a.type = 'OVA')) OR (typeanime = 1 AND (a.type = 'TV' OR a.type = 'Special' OR a.type = 'ONA' OR a.type = 'OVA')) OR (typeanime = 2 AND a.type = 'Movie') OR (typeanime = 3 AND a.type = 'Music') OR (typeanime = 4))
        AND ((airedornot = 0 AND (a.status = 'Finished Airing') OR (a.status = 'Currently Airing')) OR (airedornot = 1 AND (a.status = 'Finished Airing')) OR (airedornot = 2 AND (a.status = 'Currently Airing')) OR (airedornot = 3 AND a.status = 'Not yet aired') OR (airedornot = 4))
        AND a.id_anime NOT IN (SELECT af.id_anime FROM animesfav af)
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

        IF notes IS NOT NULL THEN
            note := note + notes * 4;
        END IF;

        -- Attribution de points supplémentaires en fonction des thèmes et genres des animes déjà favoris de l'utilisateur.
        FOR theme2, genre2 IN (
            SELECT DISTINCT amt.id_theme, amg.id_genre FROM AnimeTheme amt, AnimeGenre amg
            WHERE amt.id_anime IN (SELECT af.id_anime FROM animesfav af WHERE af.id_profil = profil_id)
            AND amg.id_anime IN (SELECT af.id_anime FROM animesfav af WHERE af.id_profil = profil_id)) LOOP
            IF theme2 = ANY(themes_anime) THEN
                note := note + 1;
            END IF;
            IF genre2 = ANY(genres_anime) THEN
                note := note + 1;
            END IF;
        END LOOP;

        IF popularite = 0 THEN
            IF notespar < 1020 AND notespar IS NOT NULL THEN
                note := note + 20;
            ELSIF notespar > 1020 AND notespar < 23199 AND notespar IS NOT NULL THEN
                note := note + 10;
            END IF;
        ELSIF popularite = 1 THEN
            IF notespar > 1020 AND notespar < 23199 AND notespar IS NOT NULL THEN
                note := note + 10;
            END IF;
        ELSIF popularite = 2 THEN
            IF notespar > 23199 AND notespar IS NOT NULL THEN
                note := note + 20;
            ELSIF notespar > 1020 AND notespar < 23199 AND notespar IS NOT NULL THEN
                note := note + 10;
            END IF;
        END IF;

        IF watch_time = 0 THEN
            IF (SELECT COUNT(*) FROM Anime a WHERE a.id_anime = idanime AND episodes < 15) > 0 THEN
                note := note + 10;
            END IF;
        ELSIF watch_time = 1 THEN
            IF (SELECT COUNT(*) FROM Anime a WHERE a.id_anime = idanime AND episodes BETWEEN 15 AND 50) > 0 THEN
                note := note + 10;
            END IF;
        ELSIF watch_time = 2 THEN
            IF (SELECT COUNT(*) FROM Anime a WHERE a.id_anime = idanime AND episodes > 50) > 0 THEN
                note := note + 10;
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
    epoque INT,
    watch_time INT,
    popularite INT,
    typemanga INT,
    airedornot INT
) 
RETURNS TABLE (id_manga INT, note BIGINT) AS $$
DECLARE
    demographics_manga VARCHAR[];
    authors_manga VARCHAR[];
    serializations_manga VARCHAR[];
    genres_manga INT[];
    themes_manga INT[];
    genre INT;
    theme INT;
    genre2 INT;
    theme2 INT;
    demographics2 VARCHAR[];
    authors2 VARCHAR[];
    serializations2 VARCHAR[];
    idmanga INT;
    notes INT;
    notespar INT;
BEGIN
    -- Parcours des mangas en fonction de l'époque spécifiée et regroupement par identifiant manga.
    FOR id_manga, idmanga, notes, notespar, genres_manga, themes_manga, demographics_manga, authors_manga, serializations_manga IN
        SELECT m.id_manga, m.id_manga, ROUND(m.score), scored_by,  
            COALESCE(ARRAY_AGG(DISTINCT mg.id_genre) FILTER (WHERE mg.id_genre IS NOT NULL), NULL),
            COALESCE(ARRAY_AGG(DISTINCT mt.id_theme) FILTER (WHERE mt.id_theme IS NOT NULL), NULL),
            COALESCE(m.demographics, NULL),
            COALESCE(m.authors, NULL),
            COALESCE(m.serializations, NULL)
        FROM Manga m
        LEFT JOIN MangaGenre mg ON mg.id_manga = m.id_manga
        LEFT JOIN MangaTheme mt ON mt.id_manga = m.id_manga
        WHERE ((epoque = 0 AND m.published_from < '2000-01-01') OR (epoque = 1 AND m.published_from < '2015-01-01' AND m.published_from > '2000-01-01') OR (epoque = 2 AND m.published_from >= '2015-01-01') OR (epoque = 3))
        AND ((typemanga = 0 AND ((m.type = 'Manga') OR (m.type = 'One-shot'))) OR (typemanga = 1 AND (m.type = 'Manhwa')) OR (typemanga = 2 AND m.type = 'Manhua') OR (typemanga = 3 AND m.type = 'Doujinshi') OR (typemanga = 4 AND m.type = 'One-shot') OR (typemanga = 5 AND m.type = 'Novel') OR (typemanga = 6 AND m.type = 'Light Novel') OR (typemanga = 7))
        AND ((airedornot = 0 AND (m.status = 'Publishing')) OR (airedornot = 1 AND (m.status = 'Finished')) OR (airedornot = 2 AND (m.status = 'Not yet published')) OR (airedornot = 3 AND ((m.status = 'Publishing') OR (m.status = 'Finished'))) OR (airedornot = 4))
        AND m.id_manga NOT IN (SELECT mf.id_manga FROM mangasfav mf)
        GROUP BY m.id_manga
    LOOP
        note := 0;
        -- Attribution des points en fonction des genres favoris de l'utilisateur.
        IF genres_manga IS NOT NULL THEN
            FOR genre IN SELECT id_genre FROM GenresFav WHERE id_profil = profil_id LOOP
                IF genre = ANY(genres_manga) THEN
                    note := note + 4;
                END IF;
            END LOOP;
        END IF;
        -- Attribution des points en fonction des thèmes favoris de l'utilisateur.
        IF themes_manga IS NOT NULL THEN
            FOR theme IN SELECT id_theme FROM ThemesFav WHERE id_profil = profil_id LOOP
                IF theme = ANY(themes_manga) THEN
                    note := note + 5;
                END IF;
            END LOOP;
        END IF;
        -- Attribution de points supplémentaires en fonction des thèmes et genres des mangas déjà favoris de l'utilisateur.
        IF genres_manga IS NOT NULL AND themes_manga IS NOT NULL THEN
            FOR theme2, genre2 IN (
                SELECT DISTINCT mmt.id_theme, mmg.id_genre FROM MangaTheme mmt, MangaGenre mmg
                WHERE mmt.id_manga IN (SELECT mf.id_manga FROM mangasfav mf WHERE mf.id_profil = profil_id)
                AND mmg.id_manga IN (SELECT mf.id_manga FROM mangasfav mf WHERE mf.id_profil = profil_id)) LOOP
                IF theme2 = ANY(themes_manga) THEN
                    note := note + 1;
                END IF;
                IF genre2 = ANY(themes_manga) THEN
                    note := note + 1;
                END IF;
            END LOOP;
        END IF;
        
        IF notes IS NOT NULL THEN
            note := note + notes * 5;
        END IF;


        IF watch_time = 0 THEN
            IF (SELECT COUNT(*) FROM Manga m WHERE m.id_manga = idmanga AND (m.chapters < 15 OR m.volumes <2)) > 0 THEN
                note := note + 10;
            END IF;
        ELSIF watch_time = 1 THEN
            IF (SELECT COUNT(*) FROM Manga m WHERE m.id_manga = idmanga AND (m.chapters > 15 OR m.volumes >2) AND (m.chapters < 50 OR m.volumes <5)) > 0 THEN
                note := note + 10;
            END IF;
        ELSIF watch_time = 2 THEN
            IF (SELECT COUNT(*) FROM Anime a WHERE m.id_manga = idmanga AND (m.chapters > 50 OR m.volumes >5)) > 0 THEN
                note := note + 10;
            END IF;
        END IF;


        IF popularite = 0 THEN
            IF notespar < 358 AND notespar IS NOT NULL THEN
                note := note + 20;
            ELSIF notespar > 358 AND notespar < 1721 AND notespar IS NOT NULL THEN
                note := note + 10;
            END IF;
        ELSIF popularite = 1 THEN
            IF notespar > 358 AND notespar < 1721 AND notespar IS NOT NULL THEN
                note := note + 10;
            END IF;
        ELSIF popularite = 2 THEN
            IF notespar > 1721 AND notespar IS NOT NULL THEN
                note := note + 20;
            ELSIF notespar > 358 AND notespar < 1721 AND notespar IS NOT NULL THEN
                note := note + 10;
            END IF;
        END IF;

        SELECT ARRAY_AGG(DISTINCT serializations) FILTER (WHERE serializations != '') INTO serializations2
        FROM (
            SELECT UNNEST(serializations) AS serializations
            FROM Manga m INNER JOIN mangasfav mf on mf.id_manga = m.id_manga WHERE mf.id_profil = profil_id
        ) sub;

        SELECT ARRAY_AGG(DISTINCT demographics) FILTER (WHERE demographics != '') INTO demographics2
        FROM (
            SELECT UNNEST(demographics) AS demographics
            FROM Manga m INNER JOIN mangasfav mf on mf.id_manga = m.id_manga WHERE mf.id_profil = profil_id
        ) sub;
        SELECT ARRAY_AGG(DISTINCT authors) FILTER (WHERE authors != '') INTO authors2
        FROM (
            SELECT UNNEST(authors) AS authors
            FROM Manga m INNER JOIN mangasfav mf on mf.id_manga = m.id_manga WHERE mf.id_profil = profil_id
        ) sub;

        FOR i IN 1..array_length(authors2, 1) LOOP
            IF authors2[i] = ANY(authors_manga) THEN
                note := note + 2;
            END IF;
        END LOOP;

        FOR i IN 1..array_length(serializations2, 1) LOOP
            IF serializations2[i] = ANY(serializations_manga) THEN
                note := note + 1;
            END IF;
        END LOOP;


        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;



SELECT * FROM NoterAnimes(1,3,1,2,2,3) ORDER BY note DESC LIMIT 10;
SELECT * FROM NoterMangas(1,3,3,2,7,4) ORDER BY note DESC LIMIT 10;
