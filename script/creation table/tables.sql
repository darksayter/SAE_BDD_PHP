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
    name VARCHAR(255),
    nicknames VARCHAR(255)[],
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

-- Table for Classement --
CREATE TABLE Classement (
    id_classement INT PRIMARY KEY,
    etapes INT,
    classement INT,
    etat BOOLEAN
);

-- Table for Classement --
CREATE TABLE ClassementAnime(
    id_classementanime INT PRIMARY KEY,
    id_anime INT REFERENCES Anime(id_anime),
    id_classement INT REFERENCES Classement(id_classement)
);

-- Table for Classement --
CREATE TABLE ClassementManga(
    id_classementmanga INT PRIMARY KEY,
    id_manga INT REFERENCES Manga(id_manga),
    id_classement INT REFERENCES Classement(id_classement)
);

-- Table for Classement --
CREATE TABLE ClassementVoiceActor(
    id_classementvoiceactor INT PRIMARY KEY,
    id_voiceactor INT REFERENCES VoiceActor(id_voiceactor),
    id_classement INT REFERENCES Classement(id_classement)
);

-- Table for Classement --
CREATE TABLE ClassementPersonnage(
    id_classementpersonnage INT PRIMARY KEY,
    id_personnage INT REFERENCES Personnage(id_pers),
    id_classement INT REFERENCES Classement(id_classement)
);

-- Table for Genre --
CREATE TABLE Genre(
    id_genre INT PRIMARY KEY,
    genre VARCHAR(255)[]
);

-- Table for Theme --
CREATE TABLE Theme(
    id_theme INT PRIMARY KEY,
    theme VARCHAR(255)[]
);

-- Table for Affrontement --
CREATE TABLE Affrontement(
    id_affrontement INT PRIMARY KEY,
    datedebut DATE,
    datefin DATE,
    gagnant INT,
    perdant INT,
    etapes INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementAnime (
    id_affrontementanime INT PRIMARY KEY,
    id_anime1 INT REFERENCES Anime(id_anime),
    id_anime2 INT REFERENCES Anime(id_anime),
    id_affrontement INT REFERENCES Affrontement(id_affrontement),
    vote_anime1 INT,
    vote_anime2 INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementManga (
    id_affrontementmanga INT PRIMARY KEY,
    id_manga1 INT REFERENCES Manga(id_manga),
    id_manga2 INT REFERENCES Manga(id_manga),
    id_affrontement INT REFERENCES Affrontement(id_affrontement),
    vote_manga1 INT,
    vote_manga2 INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementVoiceActor (
    id_affrontementvoiceactor INT PRIMARY KEY,
    id_voiceactor1 INT REFERENCES VoiceActor(id_voiceactor),
    id_voiceactor2 INT REFERENCES VoiceActor(id_voiceactor),
    id_affrontement INT REFERENCES Affrontement(id_affrontement),
    vote_voiceactor1 INT,
    vote_voiceactor2 INT
);

-- Table for Affrontement --
CREATE TABLE AffrontementPersonnage (
    id_affrontementpersonnage INT PRIMARY KEY,
    id_personnage1 INT REFERENCES Personnage(id_pers),
    id_personnage2 INT REFERENCES Personnage(id_pers),
    id_affrontement INT REFERENCES Affrontement(id_affrontement),
    vote_personnage1 INT,
    vote_personnage2 INT
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

CREATE TABLE AnimeGenre(
    id_animegenre INT PRIMARY KEY,
    id_anime INT REFERENCES Anime(id_anime),
    id_genre INT REFERENCES Genre(id_genre)
);

CREATE TABLE AnimeTheme(
    id_animetheme INT PRIMARY KEY,
    id_anime INT REFERENCES Anime(id_anime),
    id_theme INT REFERENCES Theme(id_theme)
);

CREATE TABLE MangaGenre(
    id_magengenre INT PRIMARY KEY,
    id_manga INT REFERENCES Manga(id_manga),
    id_genre INT REFERENCES Genre(id_genre)
);

CREATE TABLE MangaTheme(
    id_magengenre INT PRIMARY KEY,
    id_manga INT REFERENCES Manga(id_manga),
    id_theme INT REFERENCES Theme(id_theme)
);