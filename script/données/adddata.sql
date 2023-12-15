CREATE OR REPLACE PROCEDURE AjouterAnimeAvecThemesGenres(
    titre VARCHAR(255),
    type_anime VARCHAR(255) DEFAULT NULL,
    score FLOAT DEFAULT NULL,
    scored_by INT DEFAULT NULL,
    status VARCHAR(255) DEFAULT NULL,
    episodes INT DEFAULT NULL,
    aired_from DATE DEFAULT NULL,
    aired_to DATE DEFAULT NULL,
    source VARCHAR(255) DEFAULT NULL,
    membres INT DEFAULT NULL,
    favoris INT DEFAULT NULL,
    duree VARCHAR(255) DEFAULT NULL,
    notation VARCHAR(255) DEFAULT NULL,
    annee_premiere INT DEFAULT NULL,
    demographics VARCHAR(255)[] DEFAULT NULL,
    studios VARCHAR(255)[] DEFAULT NULL,
    producteurs VARCHAR(255)[] DEFAULT NULL,
    licencieurs VARCHAR(255)[] DEFAULT NULL,
    synopsis TEXT DEFAULT NULL,
    image_principale VARCHAR(255) DEFAULT NULL,
    themes VARCHAR(255)[] DEFAULT NULL,
    genres VARCHAR(255)[] DEFAULT NULL
)
LANGUAGE plpgsql AS $$
DECLARE
    nouvel_id INT;
    theme_id INT;
    genre_id INT;
BEGIN
    SELECT COALESCE(MAX(id_anime), 0) + 1 INTO nouvel_id FROM Anime;

    INSERT INTO Anime(
        id_anime, title, type, score, scored_by, status, episodes, aired_from, aired_to,
        source, members, favorites, duration, rating, premiered_year, demographics,
        studios, producers, licensors, synopsis, main_picture
    )
    VALUES (
        nouvel_id, titre, type_anime, score, scored_by, status, episodes, aired_from, aired_to,
        source, membres, favoris, duree, notation, annee_premiere, demographics,
        studios, producteurs, licencieurs, synopsis, image_principale
    );
    IF themes IS NOT NULL THEN
        FOREACH theme_id IN ARRAY themes LOOP
            SELECT id_theme INTO theme_id FROM Theme WHERE theme = theme_id;
            IF theme_id IS NOT NULL THEN
                INSERT INTO AnimeTheme(id_anime, id_theme) VALUES (nouvel_id, theme_id);
            END IF;
        END LOOP;
    END IF;

    IF 
    FOREACH genre_id IN ARRAY genres LOOP
        SELECT id_genre INTO genre_id FROM Genre WHERE genre = genre_id;
        IF genre_id IS NOT NULL THEN
            INSERT INTO AnimeGenre(id_anime, id_genre) VALUES (nouvel_id, genre_id);
        END IF;
    END LOOP;
END;
$$;


CALL AjouterAnimeAvecThemesGenres('test');