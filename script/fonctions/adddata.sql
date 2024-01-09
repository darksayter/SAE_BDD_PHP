-- Cette procédure ajoute un nouvel anime avec ses thèmes et genres associés.

CREATE OR REPLACE PROCEDURE AjouterAnimeAvecThemesGenres(
    titre VARCHAR(255),
    genres VARCHAR(255)[] DEFAULT NULL,
    themes VARCHAR(255)[] DEFAULT NULL,
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
    image_principale VARCHAR(255) DEFAULT NULL
)
LANGUAGE plpgsql AS $$
DECLARE
    nouvel_id INT;
    theme_rec RECORD;
    genre_rec RECORD;
BEGIN
    -- Obtenir un nouvel identifiant unique pour l'anime
    SELECT COALESCE(MAX(id_anime), 0) + 1 INTO nouvel_id FROM Anime;

    -- Insérer les informations de l'anime dans la table Anime
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

    -- Insérer les thèmes associés à l'anime
    IF themes IS NOT NULL THEN
        FOR theme_rec IN SELECT * FROM Theme LOOP
            IF theme_rec.theme = ANY(themes) THEN
                INSERT INTO AnimeTheme(id_anime, id_theme)
                VALUES (nouvel_id, theme_rec.id_theme);
            END IF;
        END LOOP;
    END IF;

    -- Insérer les genres associés à l'anime
    IF genres IS NOT NULL THEN
        FOR genre_rec IN SELECT * FROM Genre LOOP
            IF genre_rec.genre = ANY(genres) THEN
                INSERT INTO AnimeGenre(id_anime, id_genre)
                VALUES (nouvel_id, genre_rec.id_genre);
            END IF;
        END LOOP;
    END IF;
END;
$$;



-- Cette procédure ajoute un nouveau manga avec ses thèmes et genres associés.

CREATE OR REPLACE PROCEDURE AjouterMangaAvecThemesGenres(
    titre VARCHAR(255),
    genres VARCHAR(255)[] DEFAULT NULL,
    themes VARCHAR(255)[] DEFAULT NULL,
    type_manga VARCHAR(255) DEFAULT NULL,
    score FLOAT DEFAULT NULL,
    scored_by INT DEFAULT NULL,
    status VARCHAR(255) DEFAULT NULL,
    chapters INT DEFAULT NULL,
    volumes INT DEFAULT NULL,
    published_from DATE DEFAULT NULL,
    published_to DATE DEFAULT NULL,
    source VARCHAR(255) DEFAULT NULL,
    demographics VARCHAR(255)[] DEFAULT NULL,
    authors VARCHAR(255)[] DEFAULT NULL,
    serialization VARCHAR(255)[] DEFAULT NULL,
    synopsis TEXT DEFAULT NULL,
    image_principale VARCHAR(255) DEFAULT NULL
)
LANGUAGE plpgsql AS $$
DECLARE
    nouvel_id INT;
    theme_rec RECORD;
    genre_rec RECORD;
BEGIN
    -- Obtenir un nouvel identifiant unique pour le manga
    SELECT COALESCE(MAX(id_manga), 0) + 1 INTO nouvel_id FROM Manga;

    -- Insérer les informations du manga dans la table Manga
    INSERT INTO Manga(
        id_manga, title, type, score, scored_by, status, chapters, volumes, published_from, published_to,
        source, demographics, authors, serialization, synopsis, main_picture
    )
    VALUES (
        nouvel_id, titre, type_manga, score, scored_by, status, chapters, volumes, published_from, published_to,
        source, demographics, authors, serialization, synopsis, image_principale
    );

    -- Insérer les thèmes associés au manga
    IF themes IS NOT NULL THEN
        FOR theme_rec IN SELECT * FROM Theme LOOP
            IF theme_rec.theme = ANY(themes) THEN
                INSERT INTO MangaTheme(id_manga, id_theme)
                VALUES (nouvel_id, theme_rec.id_theme);
            END IF;
        END LOOP;
    END IF;

    -- Insérer les genres associés au manga
    IF genres IS NOT NULL THEN
        FOR genre_rec IN SELECT * FROM Genre LOOP
            IF genre_rec.genre = ANY(genres) THEN
                INSERT INTO MangaGenre(id_manga, id_genre)
                VALUES (nouvel_id, genre_rec.id_genre);
            END IF;
        END LOOP;
    END IF;
END;
$$;



-- Cette procédure ajoute un nouveau personnage.

CREATE OR REPLACE PROCEDURE AjouterPersonnage(
    nom TEXT,
    surnoms TEXT DEFAULT NULL,
    favoris INT DEFAULT NULL,
    description TEXT DEFAULT NULL,
    image_principale VARCHAR(255) DEFAULT NULL
)
LANGUAGE plpgsql AS $$
DECLARE
    nouvel_id INT;
BEGIN
    -- Obtenir un nouvel identifiant unique pour le personnage
    SELECT COALESCE(MAX(id_pers), 0) + 1 INTO nouvel_id FROM Personnage;

    -- Insérer les informations du personnage dans la table Personnage
    INSERT INTO Personnage(
        id_pers, name, nicknames, favorites, about, main_picture
    )
    VALUES (
        nouvel_id, nom, surnoms, favoris, description, image_principale
    );
END;
$$;



CALL AjouterMangaAvecThemesGenres('test2', ARRAY['Action', 'Girls Love', 'car']);
CALL AjouterAnimeAvecThemesGenres('test2', ARRAY['Action', 'Girls Love', 'car']);
CALL AjouterPersonnage('test');
SELECT * FROM anime ORDER BY id_anime DESC LIMIT 1;
SELECT * FROM AnimeGenre ORDER BY id_anime DESC LIMIT 3;
SELECT * FROM manga ORDER BY id_manga DESC LIMIT 1;
SELECT * FROM MangaGenre ORDER BY id_manga DESC LIMIT 3;
SELECT * FROM Personnage ORDER BY id_pers DESC LIMIT 1;