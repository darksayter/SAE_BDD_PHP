-- Cette procédure crée un nouveau profil utilisateur.

CREATE OR REPLACE PROCEDURE CreerProfil(
    IN username VARCHAR(30),
    IN password VARCHAR(30),
    IN nom VARCHAR(255),
    IN prenom VARCHAR(255),
    IN datenai DATE,
    IN genre VARCHAR(255),
    IN prefetempsvisio VARCHAR(255) DEFAULT NULL,
    IN prefeepoque VARCHAR(255) DEFAULT NULL
)
LANGUAGE plpgsql AS $$
DECLARE
    nouvel_id INT;
BEGIN
    -- Obtenir un nouvel identifiant unique pour le profil
    SELECT COALESCE(MAX(id_profil), 0) + 1 INTO nouvel_id FROM Profil;

    -- Insérer les informations du profil dans la table Profil
    INSERT INTO Profil(id_profil, username, password, nom, prenom, datenai, genre, prefetempsvisio, prefeepoque, cree_a)
    VALUES (nouvel_id, username, password, nom, prenom, datenai, genre, prefetempsvisio, prefeepoque, CURRENT_TIMESTAMP);
END;
$$;



-- Cette procédure modifie les informations d'un profil existant.

CREATE OR REPLACE PROCEDURE ModifierProfil(
    IN p_id_profil INT,
    IN p_username VARCHAR(30),
    IN p_password VARCHAR(30),
    IN p_nom VARCHAR(255),
    IN p_prenom VARCHAR(255),
    IN p_datenai DATE,
    IN p_genre VARCHAR(255),
    IN p_prefetempsvisio VARCHAR(255) DEFAULT NULL,
    IN p_prefeepoque VARCHAR(255) DEFAULT NULL
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Mettre à jour les informations du profil dans la table Profil
    UPDATE Profil
    SET
        username = p_username,
        password = p_password,
        nom = p_nom,
        prenom = p_prenom,
        datenai = p_datenai,
        genre = p_genre,
        prefetempsvisio = p_prefetempsvisio,
        prefeepoque = p_prefeepoque
    WHERE id_profil = p_id_profil;
END;
$$;




-- Cette procédure supprime un profil et les favoris associés par identifiant de profil.

CREATE OR REPLACE PROCEDURE SupprimerProfilParID(
    IN p_id_profil INT
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Supprimer le profil de la table Profil
    DELETE FROM Profil WHERE id_profil = p_id_profil;

    -- Supprimer les favoris associés à ce profil dans différentes tables
    DELETE FROM AnimesFav WHERE id_profil = p_id_profil;
    DELETE FROM MangasFav WHERE id_profil = p_id_profil;
    DELETE FROM PersonnagesFav WHERE id_profil = p_id_profil;
    DELETE FROM GenresFav WHERE id_profil = p_id_profil;
    DELETE FROM ThemesFav WHERE id_profil = p_id_profil;
END;
$$;




CALL CreerProfil(
    'user',
    'sae',
    'test',
    'toto',
    '2005-04-01',
    '',
    'moyen',
    'new-gen'
);


-- Modifier un profil avec un id_profil spécifique
CALL ModifierProfil(
    2,
    'nouveau_username',
    'nouveau_password',
    'NouveauNom',
    'NouveauPrenom',
    '2000-01-01',
    'NouveauGenre',
    'nouveau_prefetempsvisio',
    'nouveau_prefeepoque'
);

-- Supprimer un profil avec un id_profil spécifique
CALL SupprimerProfilParID(1);



-- Cette fonction vérifie l'existence d'un utilisateur en utilisant le nom d'utilisateur et le mot de passe
CREATE OR REPLACE FUNCTION VerifierUtilisateur(
    IN p_username VARCHAR(30),
    IN p_password VARCHAR(30)
)
RETURNS INT
LANGUAGE plpgsql AS $$
DECLARE
    user_id INT;
BEGIN
    -- Vérifier si l'utilisateur existe
    SELECT id_profil INTO user_id
    FROM Profil
    WHERE username = p_username AND password = p_password;

    -- Si l'utilisateur existe, retourner son identifiant, sinon retourner NULL
    RETURN COALESCE(user_id, NULL);
END;
$$;
