-- Table for Anime --
CREATE TABLE Anime (
    mal_id INT PRIMARY KEY,
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
    genres VARCHAR(255),
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
    mal_id INT PRIMARY KEY,
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
    genres VARCHAR(255),
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
    mal_id INT PRIMARY KEY,
    name VARCHAR(255),
    nicknames VARCHAR(255),
    favorites INT,
    about TEXT,
    main_picture VARCHAR(255)
);

-- Table for Voice Actor --
CREATE TABLE VoiceActor (
    mal_id INT PRIMARY KEY,
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
    mal_id INT PRIMARY KEY
);

-- Table for Affrontement --
CREATE TABLE Affrontement (
    id1 INT,
    id2 INT,
    vote1 INT,
    vote2 INT,
    datedebut DATE,
    datefin DATE,
    gagnant INT,
    perdant INT
);

-- Table for Profil --
CREATE TABLE Profil (
    idprofil INT PRIMARY KEY,
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

-- Table for 