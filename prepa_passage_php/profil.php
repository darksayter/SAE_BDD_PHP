<?
    $title ="Profil";
    $listecss[] = '<link rel="stylesheet" href="./asset/CSS/styles_profil.css" type="text/css" />';
    include 'header.php';
?>


    <body>

        <?php
        $profil = [
            [
                'nom' => 'Doe',
                'prenom' => 'John',
                'pseudo' => 'johndoe',
                'photoUrl' => 'https://fakeimg.pl/300x300/'
            ]
        ];

        // Affichage du profil
        echo "<h1>Profil de " , $profil[0]['nom'] , " " , $profil[0]['prenom'] , " (" , $profil[0]['pseudo'] , ") <h1>";
        echo "<img src=" , $profil[0]['photoUrl'] , " alt='Photo de profil'>";

        
        
        include "footer.php";