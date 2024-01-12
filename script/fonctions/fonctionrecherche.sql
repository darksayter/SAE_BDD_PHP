-- Fonction qui recherche des animes par nom sans prendre en compte les espaces et caractères spéciaux, 
-- renvoyant une table avec des informations spécifiques.

CREATE OR REPLACE FUNCTION RechercherAnimeParNom(p_nom VARCHAR(255))
RETURNS TABLE (
    id_anime INT,
    title VARCHAR(255),
    type VARCHAR(255),
    score FLOAT
)
AS $$
DECLARE
    cleaned_search_term VARCHAR(255);
BEGIN
    -- Convertir la chaîne de recherche en une version sans caractères spéciaux
    cleaned_search_term := regexp_replace(lower(p_nom), '[^\w]+', '', 'g');

    -- Effectuer la recherche en utilisant la version nettoyée pour la comparaison
    RETURN QUERY
    SELECT a.id_anime, a.title, a.type, a.score
    FROM Anime AS a
    WHERE lower(regexp_replace(a.title, '[^\w]+', '', 'g')) LIKE '%' || cleaned_search_term || '%'
    ORDER BY
        CASE WHEN a.score IS NULL THEN 1 ELSE 0 END, -- Place les scores NULL à la fin
        a.score DESC NULLS LAST; -- Tri par note décroissante (NULLS LAST pour placer les scores NULL en dernier)
END;
$$ LANGUAGE plpgsql;





-- Fonction qui recherche des mangas par nomsans prendre en compte les espaces et caractères spéciaux, 
-- renvoyant une table avec des informations spécifiques.

CREATE OR REPLACE FUNCTION RechercherMangaParNom(p_nom VARCHAR(255))
RETURNS TABLE (
    id_manga INT,
    title VARCHAR(255),
    type VARCHAR(255),
    score FLOAT
)
AS $$
DECLARE
    cleaned_search_term VARCHAR(255);
BEGIN
    -- Convertir la chaîne de recherche en une version sans caractères spéciaux
    cleaned_search_term := regexp_replace(lower(p_nom), '[^\w]+', '', 'g');

    -- Effectuer la recherche en utilisant la version nettoyée pour la comparaison
    RETURN QUERY
    SELECT m.id_manga, m.title, m.type, m.score
    FROM Manga AS m
    WHERE lower(regexp_replace(m.title, '[^\w]+', '', 'g')) LIKE '%' || cleaned_search_term || '%'
    ORDER BY
        CASE WHEN m.score IS NULL THEN 1 ELSE 0 END, -- Place les scores NULL à la fin
        m.score DESC NULLS LAST; -- Tri par note décroissante (NULLS LAST pour placer les scores NULL en dernier)
END;
$$ LANGUAGE plpgsql;




-- Fonction qui recherche des personnages par nomsans prendre en compte les espaces et caractères spéciaux, 
-- renvoyant une table avec des informations spécifiques.

CREATE OR REPLACE FUNCTION RechercherPersonnageParNom(p_nom VARCHAR(255))
RETURNS TABLE (
    id_pers INT,
    name TEXT,
    nicknames TEXT,
    favorites INT
)
AS $$
DECLARE
    cleaned_search_term VARCHAR(255);
BEGIN
    cleaned_search_term := regexp_replace(lower(p_nom), '[^\w]+', '', 'g');

    RETURN QUERY
    SELECT p.id_pers, p.name, p.nicknames, p.favorites
    FROM Personnage AS p
    WHERE lower(regexp_replace(p.name, '[^\w]+', '', 'g')) LIKE '%' || cleaned_search_term || '%'
    ORDER BY
        CASE WHEN p.favorites IS NULL THEN 1 ELSE 0 END, -- Place les favorites NULL à la fin
        p.favorites DESC NULLS LAST; -- Tri par nombre de favoris décroissant (NULLS LAST pour placer les favoris NULL en dernier)
END;
$$ LANGUAGE plpgsql;



SELECT * FROM RechercherAnimeParNom('test') LIMIT 3;
SELECT * FROM RechercherMangaParNom('onepiece') LIMIT 3;
SELECT * FROM RechercherPersonnageParNom('emilia') LIMIT 3;