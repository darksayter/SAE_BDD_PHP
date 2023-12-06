-- Fonction pour obtenir les anime les plus populaires
CREATE FUNCTION AnimeLePlusPopulaire()
RETURNS TABLE (
    id_anime INT,
    title VARCHAR(255),
    score FLOAT
) AS
RETURN (
    SELECT id_anime, title, score
    FROM Anime
    ORDER BY score DESC
    LIMIT 10
);

-- Fonction pour obtenir les mangas les plus populaires
CREATE FUNCTION MangaLePlusPopulaire()
RETURNS TABLE (
    id_manga INT,
    title VARCHAR(255),
    score FLOAT
) AS
RETURN (
    SELECT id_manga, title, score
    FROM Manga
    ORDER BY score DESC
    LIMIT 10
);

-- Fonction pour obtenir les personnages les plus populaires
CREATE FUNCTION PersonnageLePlusPopulaire()
RETURNS TABLE (
    id_personnage INT,
    name VARCHAR(255),
    favorites INT
) AS
RETURN (
    SELECT id_personnage, name, favorites
    FROM Personnage
    ORDER BY favorites DESC
    LIMIT 10
);

-- Fonction pour obtenir les anime les plus souvent abandonnés
CREATE FUNCTION AnimeLePlusAbandone()
RETURNS TABLE (
    id_anime INT,
    title VARCHAR(255),
    status VARCHAR(255)
) AS
RETURN (
    SELECT id_anime, title, status
    FROM Anime
    WHERE status = '' -- Condition
    ORDER BY members DESC
    LIMIT 10
);

-- Fonction pour obtenir les mangas les plus souvent abandonnés
CREATE FUNCTION MangaLePlusAbandone()
RETURNS TABLE (
    id_manga INT,
    title VARCHAR(255),
    status VARCHAR(255)
) AS
RETURN (
    SELECT id_manga, title, status
    FROM Manga
    WHERE status = '' -- Condition
    ORDER BY members DESC
    LIMIT 10
);

-- Fonction pour obtenir les anime avec le plus d'épisodes
CREATE FUNCTION AnimeAvecLePlusEpisodes()
RETURNS TABLE (
    id_anime INT,
    title VARCHAR(255),
    episodes INT
) AS
RETURN (
    SELECT id_anime, title, episodes
    FROM Anime
    ORDER BY episodes DESC
    LIMIT 10
);

-- Fonction pour obtenir les mangas avec le plus de volumes
CREATE FUNCTION MangaAvecLePlusTomes()
RETURNS TABLE (
    id_manga INT,
    title VARCHAR(255),
    volumes INT
) AS
RETURN (
    SELECT id_manga, title, volumes
    FROM Manga
    ORDER BY volumes DESC
    LIMIT 10
);

-- Fonction pour obtenir les anime avec le moins d'épisodes
CREATE FUNCTION AnimeAvecLeMoinsEpisodes()
RETURNS TABLE (
    id_anime INT,
    title VARCHAR(255),
    episodes INT
) AS
RETURN (
    SELECT id_anime, title, episodes
    FROM Anime
    ORDER BY episodes ASC
    LIMIT 10
);

-- Fonction pour obtenir les mangas avec le moins de volumes
CREATE FUNCTION MangaAvecLeMoinsTomes()
RETURNS TABLE (
    id_manga INT,
    title VARCHAR(255),
    volumes INT
) AS
RETURN (
    SELECT id_manga, title, volumes
    FROM Manga
    ORDER BY volumes ASC
    LIMIT 10
);
