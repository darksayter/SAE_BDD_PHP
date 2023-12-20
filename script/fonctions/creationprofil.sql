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
    SELECT COALESCE(MAX(id_profil), 0) + 1 INTO nouvel_id FROM Profil;

    INSERT INTO Profil(id_profil, username, password, nom, prenom, datenai, genre, prefetempsvisio, prefeepoque, cree_a)
    VALUES (nouvel_id, username, password, nom, prenom, datenai, genre, prefetempsvisio, prefeepoque, CURRENT_TIMESTAMP);
END;
$$;

CALL CreerProfil(
    'scipionc',
    'sae',
    'Clement',
    'Duchemin',
    '2005-04-01',
    '',
    'moyen',
    'new-gen'
);
