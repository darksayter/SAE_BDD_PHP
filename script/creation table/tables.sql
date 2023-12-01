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
    genre VARCHAR(255) REFERENCES Genre(id_genre),
    themes VARCHAR(255) REFERENCES Theme(id_theme),
    demographics VARCHAR(255),
    studios VARCHAR(255),
    producers VARCHAR(255),
    licensors VARCHAR(255),
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
    genre VARCHAR(255) REFERENCES Genre(id_genre),
    themes VARCHAR(255) REFERENCES Theme(id_theme),
    demographics VARCHAR(255),
    authors VARCHAR(255),
    serializations VARCHAR(255),
    synopsis TEXT,
    background TEXT,
    main_picture VARCHAR(255)
);

-- Table for Personnages --
CREATE TABLE Personnage (
    id_pers INT PRIMARY KEY,
    name VARCHAR(255),
    nicknames VARCHAR(255),
    favorites INT,
    about TEXT,
    main_picture VARCHAR(255)
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
CREATE TABLE classement (
    id_classement INT PRIMARY KEY,
    etapes INT,
    classement INT,
    etat BOOLEAN
);

-- Table for Affrontement --
CREATE TABLE AffrontementAnime (
    id_affrontementanime INT PRIMARY KEY,
    id_anime1 INT REFERENCES Anime(id_anime),
    id_anime2 INT REFERENCES Anime(id_anime),
    vote_anime1 INT,
    vote_anime2 INT,
    datedebut DATE,
    datefin DATE,
    gagnant INT,
    perdant INT,
    etapes INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementManga (
    id_affrontementmanga INT PRIMARY KEY,
    id_manga1 INT REFERENCES Manga(id_manga),
    id_manga2 INT REFERENCES Manga(id_manga),
    vote_manga1 INT,
    vote_manga2 INT,
    datedebut DATE,
    datefin DATE,
    gagnant INT,
    perdant INT,
    etapes INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementVoiceActor (
    id_affrontementvoiceactor INT PRIMARY KEY,
    id_voiceactor1 INT REFERENCES VoiceActor(id_voiceactor),
    id_voiceactor2 INT REFERENCES VoiceActor(id_voiceactor),
    vote_voiceactor1 INT,
    vote_voiceactor2 INT,
    datedebut DATE,
    datefin DATE,
    gagnant INT,
    perdant INT,
    etapes INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementPersonnage (
    id_affrontementpersonnage INT PRIMARY KEY,
    id_personnage1 INT REFERENCES Personnage(id_pers),
    id_personnage2 INT REFERENCES Personnage(id_pers),
    vote_personnage1 INT,
    vote_personnage2 INT,
    datedebut DATE,
    datefin DATE,
    gagnant INT,
    perdant INT,
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
    prefeepoque VARCHAR(255),
    animefav VARCHAR(255) REFERENCES AnimesFav(id_animefav),
    mangafav VARCHAR(255) REFERENCES MangasFav(id_mangafav),
    persfav VARCHAR(255) REFERENCES PersonnagesFav(id_personnagefav),
    acteurfav VARCHAR(255) REFERENCES VoiceActorsFav(id_voiceactorfav),
    genrefav VARCHAR(255) REFERENCES GenresFav(id_genrefav),
    themefav VARCHAR(255) REFERENCES ThemesFav(id_themefav),
);

-- Table for Genre --
CREATE TABLE Genre(
    id_genre INT PRIMARY KEY,
    genre VARCHAR(255),
    id_anime INT REFERENCES Anime(id_anime)
);

-- Table for Theme --
CREATE TABLE Theme(
    id_theme INT PRIMARY KEY,
    theme VARCHAR(255),
    id_anime INT REFERENCES Anime(id_anime)
);

-- Table for AnimeFav --
CREATE TABLE AnimesFav(
    id_animefav INT PRIMARY KEY,
    id_profil INT REFERENCES Profil(id_profil),
    id_anime INT REFERENCES Anime(id_anime)
);

-- Table for MangaFav --
CREATE TABLE MangasFav(
    id_mangafav INT PRIMARY KEY,
    id_profil INT REFERENCES Profil(id_profil),
    id_manga INT REFERENCES Manga(id_manga)
);

-- Table for PersonnageFav --
CREATE TABLE PersonnagesFav(
    id_personnagefav INT PRIMARY KEY,
    id_profil INT REFERENCES Profil(id_profil),
    id_pers INT REFERENCES Personnage(id_pers)
);

-- Table for VoiceActorFav --
CREATE TABLE VoiceActorsFav(
    id_voiceactorfav INT PRIMARY KEY,
    id_profil INT REFERENCES Profil(id_profil),
    id_voiceactor INT REFERENCES VoiceActor(id_voiceactor)
);

CREATE TABLE GenresFav(
    id_genrefav INT PRIMARY KEY,
    id_profil INT REFERENCES Profil(id_profil),
    id_genre INT REFERENCES Genre(id_genre)
);

CREATE TABLE ThemesFav(
    id_themefav INT PRIMARY KEY,
    id_profil INT REFERENCES Profil(id_profil),
    id_theme INT REFERENCES Theme(id_theme)
);