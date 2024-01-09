-- Cette procédure ajoute un anime aux favoris d'un profil.

CREATE OR REPLACE PROCEDURE AjouterAnimeFavoriPourProfil(
    IN id_profil INT,
    IN id_anime INT
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO AnimesFav(id_profil, id_anime)
    VALUES (id_profil, id_anime);
END;
$$;


-- Cette procédure ajoute un manga aux favoris d'un profil.

CREATE OR REPLACE PROCEDURE AjouterMangaFavoriPourProfil(
    IN id_profil INT,
    IN id_manga INT
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO MangasFav(id_profil, id_manga)
    VALUES (id_profil, id_manga);
END;
$$;


-- Cette procédure ajoute un personnage aux favoris d'un profil.

CREATE OR REPLACE PROCEDURE AjouterPersonnageFavoriPourProfil(
    IN id_profil INT,
    IN id_personnage INT
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO PersonnagesFav(id_profil, id_personnage)
    VALUES (id_profil, id_personnage);
END;
$$;


-- Cette procédure ajoute un genre aux favoris d'un profil.

CREATE OR REPLACE PROCEDURE AjouterGenreFavoriPourProfil(
    IN id_profil INT,
    IN id_genre INT
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO GenresFav(id_profil, id_genre)
    VALUES (id_profil, id_genre);
END;
$$;


-- Cette procédure ajoute un thème aux favoris d'un profil.

CREATE OR REPLACE PROCEDURE AjouterThemeFavoriPourProfil(
    IN id_profil INT,
    IN id_theme INT
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO ThemesFav(id_profil, id_theme)
    VALUES (id_profil, id_theme);
END;
$$;


CALL AjouterAnimeFavoriPourProfil(1,42203);
CALL AjouterAnimeFavoriPourProfil(1,39587);
CALL AjouterAnimeFavoriPourProfil(1,31240);

CALL AjouterGenreFavoriPourProfil(1,3);