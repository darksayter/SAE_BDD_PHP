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
    genre VARCHAR(255),
    themes VARCHAR(255),
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
    genre VARCHAR(255),
    themes VARCHAR(255),
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
CREATE TABLE Tournoi (
    etapes INT,
    classement INT,
    id_tournoi INT PRIMARY KEY
);

-- Table for Affrontement --
CREATE TABLE Affrontement (
    id_anime1 INT,
    id_anime2 INT,
    vote_anime1 INT,
    vote_anime2 INT,
    datedebut DATE,
    datefin DATE,
    gagnant INT,
    perdant INT
    id_affrontement INT PRIMARY KEY
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
    animefav VARCHAR(255),
    mangafav VARCHAR(255),
    persfav VARCHAR(255),
    acteurfav VARCHAR(255),
    genrefav VARCHAR(255)
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

-- Table for AnimeFav --
CREATE TABLE AnimesFav(
    id_profil INT,
    id_anime1 INT,
    id_anime2 INT,
    id_anime3 INT,
    id_anime4 INT,
    id_anime5 INT,
);

-- Table for MangaFav --
CREATE TABLE MangasFav(
    id_profil INT,
    id_manga1 INT,
    id_manga2 INT,
    id_manga3 INT,
    id_manga4 INT,
    id_manga5 INT,
);

-- Table for PersonnageFav --
CREATE TABLE PersonnagesFav(
    id_profil INT,
    id_pers1 INT,
    id_pers2 INT,
    id_pers3 INT,
    id_pers4 INT,
    id_pers5 INT,
);

-- Table for VoiceActorFav --
CREATE TABLE VoiceActorsFav(
    id_profil INT,
    id_acteur1 INT,
    id_acteur2 INT,
    id_acteur3 INT,
    id_acteur4 INT,
    id_acteur5 INT,
);
