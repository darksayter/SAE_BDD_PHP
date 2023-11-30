-- Fonction pour obtenir les anime les plus populaires
CREATE FUNCTION AnimeLePlusPopulaire()
RETURNS TABLE (
    mal_id INT,
    title VARCHAR(255),
    score FLOAT
) AS
RETURN (
    SELECT mal_id, title, score
    FROM Anime
    ORDER BY score DESC
    LIMIT 10
);

-- Fonction pour obtenir les mangas les plus populaires
CREATE FUNCTION MangaLePlusPopulaire()
RETURNS TABLE (
    mal_id INT,
    title VARCHAR(255),
    score FLOAT
) AS
RETURN (
    SELECT mal_id, title, score
    FROM Manga
    ORDER BY score DESC
    LIMIT 10
);

-- Fonction pour obtenir les personnages les plus populaires
CREATE FUNCTION PersonnageLePlusPopulaire()
RETURNS TABLE (
    mal_id INT,
    name VARCHAR(255),
    favorites INT
) AS
RETURN (
    SELECT mal_id, name, favorites
    FROM Personnage
    ORDER BY favorites DESC
    LIMIT 10
);

-- Fonction pour obtenir les acteurs les plus populaires
CREATE FUNCTION VoiceActorLePlusPopulaire()
RETURNS TABLE (
    mal_id INT,
    name VARCHAR(255),
    favorites INT
) AS
RETURN (
    SELECT mal_id, name, favorites
    FROM VoiceActor
    ORDER BY favorites DESC
    LIMIT 10
);

-- Fonction pour obtenir les anime les plus souvent abandonnés
CREATE FUNCTION AnimeLePlusAbandone()
RETURNS TABLE (
    mal_id INT,
    title VARCHAR(255),
    status VARCHAR(255)
) AS
RETURN (
    SELECT mal_id, title, status
    FROM Anime
    WHERE status = '' -- Condition
    ORDER BY members DESC
    LIMIT 10
);

-- Fonction pour obtenir les mangas les plus souvent abandonnés
CREATE FUNCTION MangaLePlusAbandone()
RETURNS TABLE (
    mal_id INT,
    title VARCHAR(255),
    status VARCHAR(255)
) AS
RETURN (
    SELECT mal_id, title, status
    FROM Manga
    WHERE status = '' -- Condition
    ORDER BY members DESC
    LIMIT 10
);

-- Fonction pour obtenir les acteurs ayant joué dans le plus de séries
CREATE FUNCTION VoiceActorDansLePlusDeSerie()
RETURNS TABLE (
    mal_id INT,
    name VARCHAR(255),
    series_count INT
) AS
RETURN (
    SELECT va.mal_id, va.name, COUNT(a.mal_id) AS series_count
    FROM VoiceActor va
    JOIN Anime a ON a.mal_id = va.mal_id
    GROUP BY va.mal_id, va.name
    ORDER BY series_count DESC
    LIMIT 10
);

-- Fonction pour obtenir les anime avec le plus d'épisodes
CREATE FUNCTION AnimeAvecLePlusEpisodes()
RETURNS TABLE (
    mal_id INT,
    title VARCHAR(255),
    episodes INT
) AS
RETURN (
    SELECT mal_id, title, episodes
    FROM Anime
    ORDER BY episodes DESC
    LIMIT 10
);

-- Fonction pour obtenir les mangas avec le plus de volumes
CREATE FUNCTION MangaAvecLePlusTomes()
RETURNS TABLE (
    mal_id INT,
    title VARCHAR(255),
    volumes INT
) AS
RETURN (
    SELECT mal_id, title, volumes
    FROM Manga
    ORDER BY volumes DESC
    LIMIT 10
);

-- Fonction pour obtenir les anime avec le moins d'épisodes
CREATE FUNCTION AnimeAvecLePlusEpisodes()
RETURNS TABLE (
    mal_id INT,
    title VARCHAR(255),
    episodes INT
) AS
RETURN (
    SELECT mal_id, title, episodes
    FROM Anime
    ORDER BY episodes ASC
    LIMIT 10
);

-- Fonction pour obtenir les mangas avec le moins de volumes
CREATE FUNCTION MangaAvecLePlusTomes()
RETURNS TABLE (
    mal_id INT,
    title VARCHAR(255),
    volumes INT
) AS
RETURN (
    SELECT mal_id, title, volumes
    FROM Manga
    ORDER BY volumes ASC
    LIMIT 10
);
