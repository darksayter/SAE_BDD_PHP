<?php
session_start();
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/1345c63d83.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./asset/CSS/styles_index.css">
        <title>Anime Tournament</title>
    </head>
    <body>
        <header class="tete">
            <nav class="menu_position">
                <div class="accueil" >
                    <img src="https://fakeimg.pl/250x25/" alt="banniere">
                    <? echo "Bienvenue " . $_SESSION['login']; ?>
                    <a class="liens" href="index.php">ACCUEIL</a>
                    <a href="delog.php" class="liens"><i class="fa-solid fa-arrow-right"></i></a>
                </div>
                <ul class="menus">
                    <a href="anime.php" class="liens">ANIME</a>  
                    <a href="manga.php" class="liens">MANGA</a>
                    <a href="personnage.php" class="liens">PERSONNAGE</a>  
                    <a href="profils.php" class="liens">PROFIL</a>
                </ul>
            </nav>
        </header>