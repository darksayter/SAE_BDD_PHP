-- Table pour Anime --
CREATE TABLE Anime (
    id_anime INT PRIMARY KEY,
    title VARCHAR(255),
    type VARCHAR(255),
    score FLOAT,
    scored_by INT,
    status VARCHAR(255),
    episodes INT,
    aired_from DATE,
    aired_to DATE,
    source VARCHAR(255),
    members INT,
    favorites INT,
    duration VARCHAR(255),
    rating VARCHAR(255),
    premiered_year INT,
    demographics VARCHAR(255)[],
    studios VARCHAR(255)[],
    producers VARCHAR(255)[],
    licensors VARCHAR(255)[],
    synopsis TEXT,
    main_picture VARCHAR(255)
);

-- Table pour Manga --
CREATE TABLE Manga (
    id_manga INT PRIMARY KEY,
    title VARCHAR(255),
    type VARCHAR(255),
    score FLOAT,
    scored_by INT,
    status VARCHAR(255),
    volumes INT,
    chapters INT,
    published_from DATE,
    published_to DATE,
    members INT,
    favorites INT,
    demographics VARCHAR(255)[],
    authors VARCHAR(255)[],
    serializations VARCHAR(255)[],
    synopsis TEXT,
    background TEXT,
    main_picture TEXT
);

-- Table pour Personnages --
CREATE TABLE Personnage (
    id_pers INT PRIMARY KEY,
    name TEXT,
    nicknames TEXT,
    favorites TEXT,
    about TEXT,
    main_picture VARCHAR(255)
);

-- Table pour Profil --
CREATE TABLE Profil (
    id_profil INT PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    datenai DATE,
    genre VARCHAR(255),
    prefetempsvisio VARCHAR(255),
    prefeepoque VARCHAR(255)
);

-- Table pour Genre --
CREATE TABLE Genre(
    id_genre INT PRIMARY KEY,
    genre VARCHAR(255)
);

-- Table pour Theme --
CREATE TABLE Theme(
    id_theme INT PRIMARY KEY,
    theme VARCHAR(255)
);

-- Table pour TournoiAnime --
CREATE TABLE TournoiAnime (
    id_tournoianime INT PRIMARY KEY,
    etapes INT,
    fini BOOLEAN
);

-- Table pour TournoiManga --
CREATE TABLE TournoiManga (
    id_tournoimanga INT PRIMARY KEY,
    etapes INT,
    fini BOOLEAN
);

-- Table pour TournoiPersonnage --
CREATE TABLE TournoiPersonnage (
    id_tournoipersonnage INT PRIMARY KEY,
    etapes INT,
    fini BOOLEAN
);

-- Table pour ClassementAnime --
CREATE TABLE ClassementAnime(
    id_anime INT REFERENCES Anime(id_anime),
    id_tournoianime INT REFERENCES TournoiAnime(id_tournoianime),
    place INT,
    etapes INT
);

-- Table pour ClassementManga --
CREATE TABLE ClassementManga(
    id_manga INT REFERENCES Manga(id_manga),
    id_tournoimanga INT REFERENCES TournoiManga(id_tournoimanga),
    place INT,
    etapes INT
);

-- Table pour ClassementPersonnage --
CREATE TABLE ClassementPersonnage(
    id_personnage INT REFERENCES Personnage(id_pers),
    id_tournoipersonnage INT REFERENCES TournoiPersonnage(id_tournoipersonnage),
    place INT,
    etapes INT
);

-- Table pour AffrontementAnime --
CREATE TABLE AffrontementAnime (
    id_anime1 INT REFERENCES Anime(id_anime),
    id_anime2 INT REFERENCES Anime(id_anime),
    id_tournoianime INT REFERENCES TournoiAnime(id_tournoianime),
    vote_anime1 INT,
    vote_anime2 INT,
    etapes INT
);

-- Table pour AffrontementManga --
CREATE TABLE AffrontementManga (
    id_manga1 INT REFERENCES Manga(id_manga),
    id_manga2 INT REFERENCES Manga(id_manga),
    id_tournoimanga INT REFERENCES TournoiManga(id_tournoimanga),
    vote_manga1 INT,
    vote_manga2 INT,
    etapes INT
);

-- Table pour AffrontementPersonnage --
CREATE TABLE AffrontementPersonnage (
    id_personnage1 INT REFERENCES Personnage(id_pers),
    id_personnage2 INT REFERENCES Personnage(id_pers),
    id_tournoipersonnage INT REFERENCES TournoiPersonnage(id_tournoipersonnage),
    vote_personnage1 INT,
    vote_personnage2 INT,
    etapes INT
);

-- Table pour AnimeFav --
CREATE TABLE AnimesFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_anime INT REFERENCES Anime(id_anime)
);

-- Table pour MangaFav --
CREATE TABLE MangasFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_manga INT REFERENCES Manga(id_manga)
);

-- Table pour PersonnageFav --
CREATE TABLE PersonnagesFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_pers INT REFERENCES Personnage(id_pers)
);

-- Table pour GenresFav --
CREATE TABLE GenresFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_genre INT REFERENCES Genre(id_genre)
);

-- Table pour ThemesFav --
CREATE TABLE ThemesFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_theme INT REFERENCES Theme(id_theme)
);

-- Table pour AnimeGenre --
CREATE TABLE AnimeGenre(
    id_anime INT REFERENCES Anime(id_anime),
    id_genre INT REFERENCES Genre(id_genre)
);

-- Table pour AnimeTheme --
CREATE TABLE AnimeTheme(
    id_anime INT REFERENCES Anime(id_anime),
    id_theme INT REFERENCES Theme(id_theme)
);

-- Table pour MangaGenre --
CREATE TABLE MangaGenre(
    id_manga INT REFERENCES Manga(id_manga),
    id_genre INT REFERENCES Genre(id_genre)
);

-- Table pour MangaTheme --
CREATE TABLE MangaTheme(
    id_manga INT REFERENCES Manga(id_manga),
    id_theme INT REFERENCES Theme(id_theme)
);