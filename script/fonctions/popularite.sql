-- Fonction qui renvoie les anime les plus populaires en fonction du score.

CREATE OR REPLACE FUNCTION AnimeLePlusPopulaire(limit_count INT)
RETURNS TABLE (
    id_anime INT,
    title VARCHAR(255),
    score FLOAT
) AS $$
BEGIN
    -- Sélectionne les animes avec un score non nul, les trie par score décroissant, puis limite le résultat au nombre spécifié.
    RETURN QUERY
    SELECT a.id_anime, a.title, a.score
    FROM Anime a
    WHERE a.score IS NOT NULL
    ORDER BY a.score DESC
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql;




-- Fonction qui renvoie les manga les plus populaires en fonction du score.

CREATE OR REPLACE FUNCTION MangaLePlusPopulaire(limit_count INT)
RETURNS TABLE (
    id_manga INT,
    title VARCHAR(255),
    score FLOAT
) AS $$
BEGIN
    -- Sélectionne les mangas avec un score non nul, les trie par score décroissant, puis limite le résultat au nombre spécifié.
    RETURN QUERY
    SELECT m.id_manga, m.title, m.score
    FROM Manga m
    WHERE m.score IS NOT NULL
    ORDER BY m.score DESC
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql;



-- Fonction qui renvoie les personnages les plus populaires en fonction du nombre de favoris.

CREATE OR REPLACE FUNCTION PersonnageLePlusPopulaire(limit_count INT)
RETURNS TABLE (
    id_pers INT,
    name TEXT,
    favorites INT
) AS $$
BEGIN
    -- Sélectionne les personnages avec un nombre de favoris non nul, les trie par nombre de favoris décroissant, puis limite le résultat au nombre spécifié.
    RETURN QUERY
    SELECT p.id_pers, p.name, p.favorites
    FROM Personnage p
    WHERE p.favorites IS NOT NULL
    ORDER BY p.favorites DESC
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql;




SELECT * FROM AnimeLePlusPopulaire(5);
SELECT * FROM MangaLePlusPopulaire(5);
SELECT * FROM PersonnageLePlusPopulaire(5);
