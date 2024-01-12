<!DOCTYPE html>
<html>
<!-- header.php -->
<?
  require ("header.php");
?>
  <body>

    <!-- CONTENU -->
    <nav class="secondaire">
        <h1>ANIME TOURNAMENT</h1>
        <br>
        <p><h4>Le but de ce projet est de proposer aux utilisateurs qui sont intéresser par les séries de type ANIME ou de lecture MANGA un site internet dynamique en HTML/CSS/PHP avec une base de donnée qui réalise des des tournoi de popularités se basant sur une base de données expliquer si dessous.
        </h4></p>
        <br>
        <h2>Membres : </h2>
            <li>David Pauline</li>
            <li>Duvet Alexandre</li>
            <li>Duchemin Clement</li>
            <br>
        <h1>BASE DE DONNEES</h1>
        <br>
        <h2>Tables : </h2>
        <br>
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
            <br>

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
                <br>
            <h3>Personnages :</h3>
                <li>id_pers (id, clé primaire, INT)</li>
                <li>name (nom, VARCHAR)</li>
                <li>nicknames (surnom, VARCHAR)</li>
                <li>favorites (nombre de personnes l’ayant mis en favoris, INT)</li>
                <li>about (divers, TEXT)</li>
                <li>main_picture (lien image, VARCHAR)</li>
                <br>
            <h3>Genre : </h3>
                <li>id_genre (id, clé primaire, INT)</li>
                <li>genre (nom du genre, VARCHAR)</li>
                <br>
            <h3>Theme : </h3>
                <li>id_theme (id, clé primaire, INT)</li>
                <li>theme (nom du theme, VARCHAR)</li>
                <br>
            <h3>TournoiAnime : </h3>
                <li>id_tournoianime (id, clé primaire, INT)</li>
                <li>etapes (étape a laquelle est arrivé la série/personnage, INT )</li>
                <li>fini BOOLEAN</li>
                <br>
            <h3>TournoiManga : </h3>
                <li>id_tournoimanga (id, clé primaire, INT)</li>
                <li>etapes (étape a laquelle est arrivé la série/personnage, INT )</li>
                <li>fini BOOLEAN</li>
                <br>
            <h3>TournoiPersonnage : </h3>
                <li>id_tournoipersonnage (id, clé primaire, INT)</li>
                <li>etapes (étape a laquelle est arrivé la série/personnage, INT )</li>
                <li>fini BOOLEAN</li>
                <br>
            <h3>ClassementAnime : </h3>
                <li>id_anime (l'id de la table Anime, INT)</li>
                <li>id_tournoianime (l'id de la table TournoiAnime, INT)</li>
                <li>place (la place dans le classement, INT)</li>
                <li>etapes (étape a laquelle est arrivé de l'anime, INT)</li>
                <br>
            <h3>ClassementManga : </h3>
                <li>id_manga (l'id de la table Manga, INT)</li>
                <li>id_tournoimanga (l'id de la table TournoiManga, INT)</li>
                <li>place (la place dans le classement, INT)</li>
                <li>etapes (étape a laquelle est arrivé du manga, INT)</li>
                <br>
            <h3>ClassementPersonnage : </h3>
                <li>id_personnage (l'id de la table Personnage, INT)</li>
                <li>id_tournoipersonnage (l'id de la table TournoiPersonnage, INT)</li>
                <li>place (la place dans le classement, INT)</li>
                <li>etapes (étape a laquelle est arrivé le personnage, INT)</li>
                <br>
            <h3>AffrontementAnime : </h3>
                <li>id_anime1 (l'id1 de la table Anime, INT)</li>
                <li>id_anime2 (l'id2 de la table Anime, INT)</li>
                <li>id_tournoianime (l'id de la table TournoiAnime, INT)</li>
                <li>vote_anime1 (nombre de vote(s) pour l'id1, INT)</li>
                <li>vote_anime2 (nombre de vote(s) pour l'id2, INT)</li>
                <li>etapes (étape actuelle de l'affrontement, INT)</li>
                <br>
            <h3>AffrontementManga : </h3>
                <li>id_manga1 (l'id1 de la table Manga, INT)</li>
                <li>id_manga2 (l'id2 de la table Manga, INT)</li>
                <li>id_tournoimanga (l'id de la table TournoiManga, INT)</li>
                <li>vote_manga1 (nombre de vote(s) pour l'id1, INT)</li>
                <li>vote_manga2 (nombre de vote(s) pour l'id2, INT)</li>
                <li>etapes (étape actuelle de l'affrontement, INT)</li>
                <br>
            <h3>AffrontementPersonnage : </h3>
                <li>id_personnage1 (l'id1 de la table Manga, INT)</li>
                <li>id_personnage2 (l'id2 de la table Manga, INT)</li>
                <li>id_tournoimanga (l'id de la table TournoiManga, INT)</li>
                <li>vote_personnage1 (nombre de vote(s) pour l'id1, INT)</li>
                <li>vote_personnage2 (nombre de vote(s) pour l'id2, INT)</li>
                <li>etapes (étape actuelle de l'affrontement, INT)</li>
                <br>
            <h3>Profil : </h3>
                <li>id_profil (id, clé primaire, INT)</li>
                <li>nom (nom, VARCHAR)</li>
                <li>prenom (nom, VARCHAR)</li>
                <li>datenai (date de naissance de l'utilisateur , DATE)</li>
                <li>genre (genre de l'utilisateur si il l'a spécialiser lors de son inscription, VARCHAR)</li>
                <li>"prefetempsvisio (aide a la recommandation des animes a visionner en fonction de leurs nb d'épisodes, VARCHAR)"</li>
                <li>prefeepoque (aide a la recommandation des animes en fonction de leurs date de sortie, VARCHAR)</li>
                <br>
            <h3>AnimeFav : </h3>
                <li>id_profil (l'id de la table Profil, INT)</li>
                <li>id_anime (l'id de la table Anime, INT)</li>

            <h3>MangaFav : </h3>
                <li>id_profil (l'id de la table Profil, INT)</li>
                <li>id_manga (l'id de la table Manga, INT)</li>
                <br>
            <h3>PersonnageFav : </h3>
                <li>id_profil (l'id de la table Profil, INT)</li>
                <li>id_personnage (l'id de la table Personnage, INT)</li>
                <br>
            <h3>AnimeGenre : </h3>
                <li>id_anime (l'id de la table Anime, INT)</li>
                <li>id_genre (l'id de la table Genre, INT)</li>
                <br>
            <h3>AnimeTheme : </h3>
                <li>id_anime (l'id de la table Anime, INT)</li>
                <li>id_theme (l'id de la table Theme, INT)</li>
                <br>
            <h3>MangaGenre : </h3>
                <li>id_manga (l'id de la table Manga, INT)</li>
                <li>id_genre (l'id de la table Genre, INT)</li>
                <br>
            <h3>MangaTheme: </h3>
                <li>id_manga (l'id de la table Manga, INT)</li>
                <li>id_theme (l'id de la table Theme, INT)</li>
                <br>
        <h2>Fonctions : </h2>
            <li> Fonction pour obtenir les anime les plus populaires (AnimeLePlusPopulaire)</li>
            <li> Fonction pour obtenir les mangas les plus populaires (MangaLePlusPopulaire)</li>
            <li> Fonction pour obtenir les personnages les plus populaires (PersonnageLePlusPopulaire)</li>
            <li> Fonction pour obtenir les anime avec le plus d'épisodes (AnimeAvecLePlusEpisodes)</li>
            <li> Fonction pour obtenir les mangas avec le plus de volumes/tomes (MangaAvecLePlusTomes)</li>
            <li> Fontion pour initialiser un affrontement entre les Anime (InitialiserAffrontementsAnime)</li>
            <li> Fontion pour initialiser un affrontement entre les Manga (InitialiserAffrontementsManga)</li>
            <li> Fontion pour initialiser un affrontement entre les Personnages (InitialiserAffrontementsPersonnage)</li>
            <li> Fontion pour calculer les puissances de 2 (EstPuissanceDeDeux)</li>
            <li> Fontion pour créer un tournoi entre les Anime (CreerTournoiAnime)</li>
            <li> Fontion pour créer un tournoi entre les Manga (CreerTournoiManga)</li>
            <li> Fontion pour créer un tournoi entre les Personnages (CreerTournoiPersonnage)</li>
            <li> Fontion pour supprime un trounoi entre les Anime (deletetournoianime)</li>
            <li> Fontion pour supprime un trounoi entre les Manga (deletetournoimanga)</li>
            <li> Fontion pour supprime un trounoi entre les Personnages (deletetournoipersonnage)</li>
            <li> Fontion qui affiche le nombre de participant pour un tournoi entre Anime (NombreParticipantsTournoiAnime)</li>
            <li> Fontion qui affiche le nombre de participant pour un tournoi entre Manga (NombreParticipantsTournoiManga)</li>
            <li> Fontion qui affiche le nombre de participant pour un tournoi entre Personnages (NombreParticipantsTournoiPersonnage)</li>
            <li> Fontion pour mettre a jour la table affrontement Anime (MettreAJourAffrontementAnime)</li>
            <li> Fontion pour mettre a jour la table affrontement Manga (MettreAJourAffrontementManga)</li>
            <li> Fontion pour mettre a jour la table affrontement Personnages (MettreAJourAffrontementPersonnage)</li>
            <li> Fonction pour ajouter des Anime dans la table anime en plus de lui attribuer un Theme et ou un ou plusieurs Genres (AjouterAnimeAvecThemesGenres)</li>
            <li> Fonction pour ajouter des Manga dans la table manga en plus de lui attribuer un Theme et ou un ou plusieurs Genres (AjouterMangaAvecThemesGenres)</li>
            <li> Fonction pour ajouter des Personnage dans la table personnage (AjouterPersonnage)</li>
            <li> Fonction pour supprimer des Anime par leurs ID (SupprimerAnimeID)</li>
            <li> Fonction pour rechercher des Anime par leur nom (RechercherAnimeParNom)</li>
            <li> Fonction pour rechercher des Manga par leur nom (RechercherMangaParNom)</li>
            <li> Fonction pour rechercher des Personnages par leur nom (RechercherPersonnageParNom)</li>
            <li> Fonction pour supprimer un Anime en fonction de son ID (SupprimerAnimeParID)</li>
            <li> Fonction pour supprimer un Manga en fonction de son ID (SupprimerMangaParID)</li>
            <li> Fonction pour supprimer un Personnage en fonction de son ID (SupprimerPersonnageParID)</li>
            <li> Fonction pour ajouter un Anime Favori dans un Profil d'un utilisateur (AjouterAnimeFavoriPourProfil)</li>
            <li> Fonction pour ajouter un Manga Favori dans un Profil d'un utilisateur (AjouterMangaFavoriPourProfil)</li>
            <li> Fonction pour ajouter un Personnage Favori dans un Profil d'un utilisateur (AjouterPersonnageFavoriPourProfil)</li>
            <li> Fonction pour ajouter un Genre Favori dans un Profil d'utilisateur (AjouterGenreFavoriPourProfil)</li>
            <li> Fonction pour ajouter un Theme Favori pour un Profil d'utilisateur (AjouterThemeFavoriPourProfil)</li>
            <li> Fonction pour noter les Animes (NoterAnimes)</li>
            <li> Fonction pour noter les Animes (NoterMangas)</li>
            <li> Fonction pour créer un Profil pour un utilisateur (CreerProfil)</li>
            <li> Fonction pour modifier un Profil d'un utilisateur (ModifierProfil)</li>
            <li> Fonction pour supprimer un Profil d'un utilisateur en fonction de son ID (SupprimerProfilParID)</li>
            <li> Fonction pour supprimer tout les tournois Anime (deletealltournoianime)</li>
            <li> Fonction pour supprimer tout les tournois Manga (deletealltournoimanga)</li>
            <li> Fonction pour supprimer tout les tournois Personnage (deletealltournoipersonnage)</li>
            <br>
          <h2>Triggers : </h2>
            <li> Trigger pour les victoires ou défaites en affrontement (trigger_victoire_defaite)</li>
            <li> Trigger pour les étapes de chaque séries dans le tournoi (trigger_etapes)</li>
            <li> Trigger pour mettre a jour automatiquement les etapes d'un tournoi (MiseAJourEtapeTournoiTrigger)</li>
            <li> Trigger pour mettre a jour le status d'un Manga (MiseAJourStatutFiniManga)</li>
            <li> Trigger pour mettre a jour le status d'un Personnages (MiseAJourStatutFiniPersonnage)</li>
            <li> Trigger pour mettre a jour le classement Anime (MiseAJourClassementAnime)</li>
            <li> Trigger pour mettre a jour le classement Personnage (MiseAJourClassementPersonnage)</li>
            <li> Trigger pour mettre a jour le classement Manga (MiseAJourClassementManga) </li>
            <li> Trigger pour vérifier et créer un affrontement Anime (VerifierEtCreerAffrontementAnime)</li>
            <li> Trigger pour vérifier et créer un affrontement Personnage (VerifierEtCreerAffrontementPersonnage)</li>
            <li> Trigger pour vérifier et créer un affrontement Manga (VerifierEtCreerAffrontementManga)</li>
            <li> Trigger/Fonction pour vérifier si un affrontement entre Anime et terminé (VerifierAffrontementsAnimeTermines)</li> <!-- Peut subir des modif -->
            <li> Trigger/Fonction pour vérifier si un affrontement entre Manga et terminé (VerifierAffrontementsMangaTermines)</li>
            <li> Trigger/Fonction pour vérifier si un affrontement entre Personnage et terminé (VerifierAffrontementsPersonnageTermines)</li>
            <li> Trigger/Fonction pour mettre a jour l'étape de tournoi Anime (MettreAJourEtapeTournoiAnime)</li>
            <li> Trigger/Fonction pour mettre a jour l'étape de tournoi Manga (MettreAJourEtapeTournoiManga)</li>
            <li> Trigger/Fonction pour mettre a jour l'étape de tournoi Personnage (MettreAJourEtapeTournoiPersonnage)</li>
            <li> Trigger pour mettre a jour l'étape d'un tournoi (MiseAJOurEtapeTournoiTrigger)</li>
        </nav>

  </body>
<!-- footer.php -->
<?php require("assets/HTML/footer.html"); ?>
  
</html>