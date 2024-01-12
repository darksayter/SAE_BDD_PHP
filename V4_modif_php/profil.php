<?
  require ("header.php");
?>


    <body>

        <?php
        $profil = [
            [
                'nom' => "Doe",
                'prenom' => "John",
                'pseudo' => "johndoe",
                'photoUrl' => "https://fakeimg.pl/300x300/"
            ]
            ];

        // Affichage du profil
        echo "<h1>Profil de " , $profil['nom'] , $profil['prenom'] , "(" , $profil['pseudo'] , ") <h1>";
        echo "<img src=" , $profil['photoUrl'] , "alt='Photo de profil'>";

        // Vous pouvez également ajouter d'autres informations sur le profil ici

        require ("assets/HTML/footer.html");
        