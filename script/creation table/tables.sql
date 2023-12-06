-- Table for Anime --
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

-- Table for Manga --
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
    main_picture VARCHAR(255)
);

-- Table for Personnages --
CREATE TABLE Personnage (
    id_pers INT PRIMARY KEY,
    name TEXT,
    nicknames TEXT,
    favorites TEXT,
    about TEXT,
    main_picture TEXT
);

-- Table for Voice Actor --
CREATE TABLE VoiceActor (
    id_voiceactor INT PRIMARY KEY,
    name VARCHAR(255),
    birthday DATE,
    favorites INT,
    about TEXT,
    main_picture VARCHAR(255)
);

-- Table for Tournoi --
CREATE TABLE TournoiAnime (
    id_tournoianime INT PRIMARY KEY,
    etapes INT,
    fini BOOLEAN
);

-- Table for Tournoi --
CREATE TABLE TournoiManga (
    id_tournoimanga INT PRIMARY KEY,
    etapes INT,
    fini BOOLEAN
);

-- Table for Tournoi --
CREATE TABLE TournoiVoiceActor (
    id_tournoivoiceactor INT PRIMARY KEY,
    etapes INT,
    fini BOOLEAN
);

-- Table for Tournoi --
CREATE TABLE TournoiPersonnage (
    id_tournoipersonnage INT PRIMARY KEY,
    etapes INT,
    fini BOOLEAN
);

-- Table for Classement --
CREATE TABLE ClassementAnime(
    id_anime INT REFERENCES Anime(id_anime),
    id_tournoianime INT REFERENCES TournoiAnime(id_tournoianime),
    place INT,
    etapes INT
);

-- Table for Classement --
CREATE TABLE ClassementManga(
    id_manga INT REFERENCES Manga(id_manga),
    id_tournoimanga INT REFERENCES TournoiManga(id_tournoimanga),
    place INT,
    etapes INT
);

-- Table for Classement --
CREATE TABLE ClassementVoiceActor(
    id_voiceactor INT REFERENCES VoiceActor(id_voiceactor),
    id_tournoivoiceactor INT REFERENCES TournoiVoiceActor(id_tournoivoiceactor),
    place INT,
    etapes INT
);

-- Table for Classement --
CREATE TABLE ClassementPersonnage(
    id_personnage INT REFERENCES Personnage(id_pers),
    id_tournoipersonnage INT REFERENCES TournoiPersonnage(id_tournoipersonnage),
    place INT,
    etapes INT
);

-- Table for Genre --
CREATE TABLE Genre(
    id_genre INT PRIMARY KEY,
    genre VARCHAR(255)
);

-- Table for Theme --
CREATE TABLE Theme(
    id_theme INT PRIMARY KEY,
    theme VARCHAR(255)
);

-- Table for Affrontement --
CREATE TABLE AffrontementAnime (
    id_anime1 INT REFERENCES Anime(id_anime),
    id_anime2 INT REFERENCES Anime(id_anime),
    id_tournoianime INT REFERENCES TournoiAnime(id_tournoianime),
    vote_anime1 INT,
    vote_anime2 INT,
    etapes INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementManga (
    id_manga1 INT REFERENCES Manga(id_manga),
    id_manga2 INT REFERENCES Manga(id_manga),
    id_tournoimanga INT REFERENCES TournoiManga(id_tournoimanga),
    vote_manga1 INT,
    vote_manga2 INT,
    etapes INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementVoiceActor (
    id_voiceactor1 INT REFERENCES VoiceActor(id_voiceactor),
    id_voiceactor2 INT REFERENCES VoiceActor(id_voiceactor),
    id_tournoivoiceactor INT REFERENCES TournoiVoiceActor(id_tournoivoiceactor),
    vote_voiceactor1 INT,
    vote_voiceactor2 INT,
    etapes INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementPersonnage (
    id_personnage1 INT REFERENCES Personnage(id_pers),
    id_personnage2 INT REFERENCES Personnage(id_pers),
    id_tournoipersonnage INT REFERENCES TournoiPersonnage(id_tournoipersonnage),
    vote_personnage1 INT,
    vote_personnage2 INT,
    etapes INT
);

-- Table for Profil --
CREATE TABLE Profil (
    id_profil INT PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    datenai DATE,
    genre VARCHAR(255),
    prefetempsvisio VARCHAR(255),
    prefeepoque VARCHAR(255)
);

-- Table for AnimeFav --
CREATE TABLE AnimesFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_anime INT REFERENCES Anime(id_anime)
);

-- Table for MangaFav --
CREATE TABLE MangasFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_manga INT REFERENCES Manga(id_manga)
);

-- Table for PersonnageFav --
CREATE TABLE PersonnagesFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_pers INT REFERENCES Personnage(id_pers)
);

-- Table for VoiceActorFav --
CREATE TABLE VoiceActorsFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_voiceactor INT REFERENCES VoiceActor(id_voiceactor)
);

-- Table for GenresFav --
CREATE TABLE GenresFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_genre INT REFERENCES Genre(id_genre)
);

-- Table for ThemesFav --
CREATE TABLE ThemesFav(
    id_profil INT REFERENCES Profil(id_profil),
    id_theme INT REFERENCES Theme(id_theme)
);

-- Table for AnimeGenre --
CREATE TABLE AnimeGenre(
    id_anime INT REFERENCES Anime(id_anime),
    id_genre INT REFERENCES Genre(id_genre)
);

-- Table for AnimeTheme --
CREATE TABLE AnimeTheme(
    id_anime INT REFERENCES Anime(id_anime),
    id_theme INT REFERENCES Theme(id_theme)
);

-- Table for MangaGenre --
CREATE TABLE MangaGenre(
    id_manga INT REFERENCES Manga(id_manga),
    id_genre INT REFERENCES Genre(id_genre)
);

-- Table for MangaTheme --
CREATE TABLE MangaTheme(
    id_manga INT REFERENCES Manga(id_manga),
    id_theme INT REFERENCES Theme(id_theme)
);