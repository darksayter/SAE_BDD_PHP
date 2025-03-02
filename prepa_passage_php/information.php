<!DOCTYPE html>
<html>
  <link rel="icon" href="./assets/PICTURE/" type="image/x-icon">
  <head>
    <meta charset="utf-8" />
    <title>ANIME TOURNAMENT</title>
    <link rel="stylesheet" href="/asset/CSS/styles_information.css" type="text/css" />
  </head>

    <?
    include 'header.php';
    ?>

  <body>
    <nav class="secondaire">
        <h1>ANIME TOURNAMENT</h1>
        <p><h4>Le but de ce projet est de réaliser des statistiques variées sur le thème des séries d’animation ainsi que de leurs personnages et de leurs staffs. Nous avons également ajouté à cela des statistiques de mangas étant donné que de nombreuses séries d’animation sont tirées de ces derniers.
        </h4></p>
        <h2>Membres : </h2>
            <li>David Pauline</li>
            <li>Duvet Alexandre</li>
            <li>Duchemin Clement</li>
        <h2>Tables : </h2>
            <h3>Anime :</h3>
                <li>id_anime (id, clé primaire, INT)</li>
                <li>title (titre, VARCHAR)</li>
                <li>type (type, VARCHAR)</li>
                <li>score (moyenne des scores, FLOAT)</li>
                <li>scored_by (nombre de personnes ayant données une note, INT)</li>
                <li>status (quantite de personne ayant abandonné en visionnage ou fini, VARCHAR)</li>
                <li>episodes (nombre d’épisodes, INT)</li>
                <li>aired_from (date de début de diffusion, DATE)</li>
                <li>aired_to (date de fin de diffusion, DATE)</li>
                <li>source (matériel original, adaptation?, VARCHAR)</li>
                <li>members (nombre de membres, INT)</li>
                <li>favorites (nombre de favoris, INT)</li>
                <li>duration (durée, VARCHAR)</li>
                <li>rating (évaluation de l’âge des gens l’ayant vu, VARCHAR)</li>
                <li>premiered_year (année de sortie, INT)</li>
                <li>demographics (public visé : adulte; enfant, etc... , VARCHAR)</li>
                <li>studios (le nom du studio, VARCHAR)</li>
                <li>producers (les noms des producers, VARCHAR)</li>
                <li>licensors (les noms des licensors, VARCHAR)</li>
                <li>synopsis (bref résumer, TEXT)</li>
                <li>main_picture (lien image, VARCHAR)</li>
            </li>

            <h3>Manga :</h3>
                <li>id_manga (id, clé primaire, INT)</li>
                <li>title (titre, VARCHAR)</li>
                <li>type (type, VARCHAR)</li>
                <li>score (moyenne des scores, FLOAT)</li>
                <li>scored_by (nombre de personnes ayant données une note, INT)</li>
                <li>status (quantite de personne ayant abandonné en visionnage ou fini, VARCHAR)</li>
                <li>volumes (nombre de volumes, INT)</li>
                <li>chapters (nombre de chapitres, INT)</li>
                <li>published_from (date de début de publication, DATE)</li>
                <li>published_to (date de fin de publication, DATE)</li>
                <li>members (nombre de membres, INT)</li>
                <li>favorites (nombre de favoris, INT)</li>
                <li>demographics (public visé, VARCHAR)</li>
                <li>authors (auteurs, VARCHAR)</li>
                <li>serializations (liste des magazines sur lesquels ça a été publié, VARCHAR)</li>
                <li>synopsis (bref résumer, TEXT)</li>
                <li>background (informations additionnelles, TEXT)</li>
                <li>main_picture (lien image, VARCHAR)</li>

            <h3>Personnages :</h3>
                <li>id_pers (id, clé primaire, INT)</li>
                <li>name (nom, VARCHAR)</li>
                <li>nicknames (surnom, VARCHAR)</li>
                <li>favorites (nombre de personnes l’ayant mis en favoris, INT)</li>
                <li>about (divers, TEXT)</li>
                <li>main_picture (lien image, VARCHAR)</li>
            
            <h3>Genre : </h3>
                <li>id_genre (id, clé primaire, INT)</li>
                <li>genre (nom du genre, VARCHAR)</li>
            
            <h3>Theme : </h3>
                <li>id_theme (id, clé primaire, INT)</li>
                <li>theme (nom du theme, VARCHAR)</li>

            <h3>TournoiAnime : </h3>
                <li>id_tournoianime (id, clé primaire, INT)</li>
                <li>etapes (étape a laquelle est arrivé la série/personnage, INT )</li>
                <li>fini BOOLEAN</li>
            
            <h3>TournoiManga : </h3>
                <li>id_tournoimanga (id, clé primaire, INT)</li>
                <li>etapes (étape a laquelle est arrivé la série/personnage, INT )</li>
                <li>fini BOOLEAN</li>
            
            <h3>TournoiPersonnage : </h3>
                <li>id_tournoipersonnage (id, clé primaire, INT)</li>
                <li>etapes (étape a laquelle est arrivé la série/personnage, INT )</li>
                <li>fini BOOLEAN</li>

            <h3>ClassementAnime : </h3>
                <li>id_anime (l'id de la table Anime, INT)</li>
                <li>id_tournoianime (l'id de la table TournoiAnime, INT)</li>
                <li>place (la place dans le classement, INT)</li>
                <li>etapes (étape a laquelle est arrivé de l'anime, INT)</li>

            <h3>ClassementManga : </h3>
                <li>id_manga (l'id de la table Manga, INT)</li>
                <li>id_tournoimanga (l'id de la table TournoiManga, INT)</li>
                <li>place (la place dans le classement, INT)</li>
                <li>etapes (étape a laquelle est arrivé du manga, INT)</li>

            <h3>ClassementPersonnage : </h3>
                <li>id_personnage (l'id de la table Personnage, INT)</li>
                <li>id_tournoipersonnage (l'id de la table TournoiPersonnage, INT)</li>
                <li>place (la place dans le classement, INT)</li>
                <li>etapes (étape a laquelle est arrivé le personnage, INT)</li>

            <h3>AffrontementAnime : </h3>
                <li>id_anime1 (l'id1 de la table Anime, INT)</li>
                <li>id_anime2 (l'id2 de la table Anime, INT)</li>
                <li>id_tournoianime (l'id de la table TournoiAnime, INT)</li>
                <li>vote_anime1 (nombre de vote(s) pour l'id1, INT)</li>
                <li>vote_anime2 (nombre de vote(s) pour l'id2, INT)</li>
                <li>etapes (étape actuelle de l'affrontement, INT)</li>

            <h3>AffrontementManga : </h3>
                <li>id_manga1 (l'id1 de la table Manga, INT)</li>
                <li>id_manga2 (l'id2 de la table Manga, INT)</li>
                <li>id_tournoimanga (l'id de la table TournoiManga, INT)</li>
                <li>vote_manga1 (nombre de vote(s) pour l'id1, INT)</li>
                <li>vote_manga2 (nombre de vote(s) pour l'id2, INT)</li>
                <li>etapes (étape actuelle de l'affrontement, INT)</li>

            <h3>AffrontementPersonnage : </h3>
                <li>id_personnage1 (l'id1 de la table Manga, INT)</li>
                <li>id_personnage2 (l'id2 de la table Manga, INT)</li>
                <li>id_tournoimanga (l'id de la table TournoiManga, INT)</li>
                <li>vote_personnage1 (nombre de vote(s) pour l'id1, INT)</li>
                <li>vote_personnage2 (nombre de vote(s) pour l'id2, INT)</li>
                <li>etapes (étape actuelle de l'affrontement, INT)</li>

            <h3>Profil : </h3>
                <li>id_profil (id, clé primaire, INT)</li>
                <li>nom (nom, VARCHAR)</li>
                <li>prenom (nom, VARCHAR)</li>
                <li>datenai (date de naissance de l'utilisateur , DATE)</li>
                <li>genre (genre de l'utilisateur si il l'a spécialiser lors de son inscription, VARCHAR)</li>
                <li>"prefetempsvisio (aide a la recommandation des animes a visionner en fonction de leurs nb d'épisodes, VARCHAR)"</li>
                <li>prefeepoque (aide a la recommandation des animes en fonction de leurs date de sortie, VARCHAR)</li>
            
            <h3>AnimeFav : </h3>
                <li>id_profil (l'id de la table Profil, INT)</li>
                <li>id_anime (l'id de la table Anime, INT)</li>

            <h3>MangaFav : </h3>
                <li>id_profil (l'id de la table Profil, INT)</li>
                <li>id_manga (l'id de la table Manga, INT)</li>
            
            <h3>PersonnageFav : </h3>
                <li>id_profil (l'id de la table Profil, INT)</li>
                <li>id_personnage (l'id de la table Personnage, INT)</li>

            <h3>AnimeGenre : </h3>
                <li>id_anime (l'id de la table Anime, INT)</li>
                <li>id_genre (l'id de la table Genre, INT)</li>

            <h3>AnimeTheme : </h3>
                <li>id_anime (l'id de la table Anime, INT)</li>
                <li>id_theme (l'id de la table Theme, INT)</li>

            <h3>MangaGenre : </h3>
                <li>id_manga (l'id de la table Manga, INT)</li>
                <li>id_genre (l'id de la table Genre, INT)</li>

            <h3>MangaTheme: </h3>
                <li>id_manga (l'id de la table Manga, INT)</li>
                <li>id_theme (l'id de la table Theme, INT)</li>

        <h2>Fonctions : </h2>
            <li>Fonction pour obtenir les anime les plus populaires</li>
            <li>Fonction pour obtenir les mangas les plus populaires</li>
            <li>Fonction pour obtenir les personnages les plus populaires</li>
            <li>Fonction pour obtenir les anime avec le plus d'épisodes</li>
            <li>Fonction pour obtenir les mangas avec le plus de volumes</li>
            <li>Fonction pour obtenir les anime avec le moins d'épisodes</li>
            <li>Fonction pour obtenir les mangas avec le moins de volumes</li>
            <li>Fonction permettant de créer un profil type qui suggère des animés, personnages... en accord avec ce même profil</li>
            <li>Fonction permettant de créer un tournoi</li>
            <li>Fonction permettant de simuler un nombre de votes pendant un duel</li>
            <li>Fonction permettant de créer un affrontement</li>
            <li>Fonction pour insérer des informations dans le profil</li>
            <li>Fonction permettant d'insérer des séries,mangas,personnages,acteurs</li>
            <li>Fonction permettant de supprimer des séries,mangas,personnages,acteurs</li>
            <li>Fonction permettant de modifier des séries,mangas,personnages,acteurs</li>
            <li>Fonction permettant de supprimer un profil</li>
            <li>Fonction permettant de modifier un profil</li>
            <li>Fonction sélectionnant les séries... en accord avec les informations du profil</li>
    </nav>
  </body>
  <footer>
    <div class="footer-container">
      <a href="mention_legale.php" class="lien"> Mention légale </a>
      <br>
        <a href="information.php" class="lien"> Information complémentaires </a>
    </div> 
  </footer>
</html>