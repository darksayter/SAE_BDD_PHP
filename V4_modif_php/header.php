<?php
session_start();

@$keywords=$_GET["keywords"];
@$valider=$_GET["valider"];
if (isset($valider) && !empty(trim($keywords))){
    $words=explode(" ", trim($keywords));
    for ($i=0; $i<count($words);$i++)
        $kw[$i] = "LOWER(title) LIKE '%" . strtolower($words[$i]) . "%'";
    require("connexion.php");
    $res=$db->prepare("select title from Anime where ".implode(" and ",$kw));
    $res->setFetchMode(PDO::FETCH_ASSOC);
    $res->execute();
    $tab=$res->fetchAll();
    $afficher="oui";
}
?>

<link rel="icon" href="./assets/PICTURE/" type="image/x-icon">
  <head>
    <meta charset="utf-8" />
    <title>ANIME TOURNAMENT</title>
    <link rel="stylesheet" href="./assets/CSS/styles.css" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript" src="assets/JAVASCRIPT/date.js"></script>
  </head>

<!-- HEADER -->
<header class="tete">
       <img src="./assets/PICTURE/AnimeTournament_1.png" alt="banniere">
  </header>

  <!-- NAV NOM DU SITE -->
  <nav class="nomSite">
    <!-- NOM DU SITE / LOGO -->
    <ul><a href="index.php">ANIME TOURNAMENT</a> <!-- quand on clique dessus sa redirige sur la page d'accueil (index.html)-->
      <!-- BTN DE CONNEXION -->
      <button class="btn1" type="button" onclick="window.location.href = 'connexion.php';">Login</button>
      <button class="btn2" type="button" onclick="window.location.href = 'connexion.php';">Sign Up</button>
      <!-- une fois que l'utilisateur est connecter ses deux boutons ne seront plus visible, a la place un bouton profil pourra être afficher pour que l'utilisateur accède a son profil ( dans son profil il y aura toutes les informations relatives a l'utilisateur pour qu'il puisse connaîtres les informations que le site possède de son profil ) -->
      <br>
      <span id="date_heure"></span>
      <script type="text/javascript">window.onload = date_heure('date_heure');</script>
    </ul>
  </nav>

  <!-- MENU -->
  <nav class="principale">
    <ul>

      <!-- ANIME -->
      <li class="deroulant"><a href="anime.php"> Anime </a>
        <ul class="sous">
          <li><a href="classementAnime.php"> Classement </a></li>
          <br>
          <br>
          <li><a href="tournoi_anime.php"> Tournoi</a></li>
        </ul>
      </li>
      <!-- MANGA -->
      <li class="deroulant"><a href="manga.php"> Manga </a>
        <ul class="sous">
          <li><a href="classementManga.php"> Classement </a></li>
          <br>
          <br>
          <li><a href="tournoi_manga.php"> Tournoi </a></li>        
        </ul>
      </li>
      <!-- PERSONNAGES -->
      <li class="deroulant"><a href="personnages.php"> Personnages </a>
        <ul class="sous">
          <li><a href="classementPersonnages.php"> Classement </a></li>
          <br>
          <br>
          <li><a href="tournoi_personnages.php"> Tournoi </a></li>
        </ul>
      </li>
      <!-- PROFIL -->
      <!-- <li class="deroulant"><a href="profil.php"> Profil </a>
        <ul class="sous">
          <li><a href="parametres.php"> Paramètres </a></li>
        </ul>
      </li> -->
      <!-- AJOUT D'UNE BARRE DE RECHERCHE -->
      <input class="input_text" type="text">  
    </ul>
  </nav>
  <?php
        require ("recherche.php");
        ?>