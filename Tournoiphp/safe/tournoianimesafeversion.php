<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ANIME TOURNAMENT</title>
    <link rel="stylesheet" href="./assets/CSS/styles.css" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<?php
// Inclure le fichier de connexion à la base de données
include 'connexion.php';

// Récupérer la liste des tournois anime depuis la base de données
$stmt = $db->query("SELECT id_tournoianime FROM TournoiAnime;");
$tournaments = $stmt->fetchAll(PDO::FETCH_COLUMN);
?>
<header class="tete">
    <img src="./assets/PICTURE/AnimeTournament_1.png" alt="banniere">
</header>

<!-- NAV NOM DU SITE -->
<nav class="nomSite">
    <!-- NOM DU SITE / LOGO -->
    <ul><a href="index.html">ANIME TOURNAMENT</a>
        <!-- A remplacer par le logo titre du site qui quand on clique dessus sa redirige sur la page d'accueil (index.html)  si possible le placer sur la gauche des btn -->
        <!-- BTN DE CONNEXION -->
        <button class="btn1" type="button" onclick="window.location.href = 'conexion.html';">Login</button>
        <button class="btn2" type="button" onclick="window.location.href = 'conexion.html';">Sign Up</button>
    </ul>
</nav>

<!-- MENU -->
<nav class="principale">
    <ul>
        <!-- ANIME -->
        <li class="deroulant"><a href="anime.html"> Anime </a>
            <ul class="sous">
                <li><a href="classementAnime.html"> Classement </a></li>
                <br>
                <br>
                <li><a href="tournoi_anime.html"> Tournoi</a></li>
            </ul>
        </li>
        <!-- MANGA -->
        <li class="deroulant"><a href="manga.html"> Manga </a>
            <ul class="sous">
                <li><a href="classementManga.html"> Classement </a></li>
                <br>
                <br>
                <li><a href="tournoi_manga.html"> Tournoi </a></li>
            </ul>
        </li>
        <!-- PERSONNAGES -->
        <li class="deroulant"><a href="personnages.html"> Personnages </a>
            <ul class="sous">
                <li><a href="classementPersonnages.html"> Classement </a></li>
                <br>
                <br>
                <li><a href="tournoi_personnages.html"> Tournoi </a></li>
            </ul>
        </li>
    </ul>
</nav>

<body>
    <nav class="contenu">
        <h1>Sélectionnez un tournoi anime :</h1>
        
        <!-- ... Votre code existant ... -->

        <form id="selectTournamentForm">
            <select name="selected_tournament" id="selectedTournament">
                <?php foreach ($tournaments as $tournament): ?>
                    <option value="<?= $tournament ?>">Tournoi #<?= $tournament ?></option>
                <?php endforeach; ?>
            </select>
            <input type="button" value="Sélectionner" onclick="loadParticipants()">
        </form>

        <!-- Conteneur pour les boutons d'affrontement -->
        <div id="affrontementButtons"></div>

        <div id="participantsSection"></div>


        <div id="participantsSection">
        </div>

        <script>
            function loadParticipants() {
            console.log("Chargement des participants...");
            var selectedTournament = $("#selectedTournament").val();

            // Envoyer une requête AJAX pour récupérer les participants du tournoi
            $.ajax({
                type: "POST",
                url: "get_participants.php",
                data: {tournament: selectedTournament},
                success: function (response) {
                    console.log("Réponse des participants : ", response);
                    $("#participantsSection").html(response);

                    // Charger les boutons d'affrontement une fois les participants chargés
                    loadAffrontementButtons(selectedTournament);
                }
            });
        }

        function loadAffrontementButtons(selectedTournament) {
            // Envoyer une requête AJAX pour récupérer le nombre d'affrontements dans le tournoi
            $.ajax({
                type: "POST",
                url: "get_number_of_affrontements.php", // Créez ce fichier pour obtenir le nombre d'affrontements
                data: {tournament: selectedTournament},
                success: function (numberOfAffrontements) {
                    console.log("Nombre d'affrontements : " + numberOfAffrontements);

                    // Générer les boutons d'affrontement
                    var affrontementButtonsHtml = "";
                    for (var i = 1; i <= numberOfAffrontements; i++) {
                        affrontementButtonsHtml += '<input type="button" value="Affrontement ' + i + '" onclick="loadAffrontement(' + i + ')">';
                    }

                    // Injecter les boutons dans le conteneur dédié
                    $("#affrontementButtons").html(affrontementButtonsHtml);
                }
            });
        }

        function loadAffrontement(affrontement) {
            console.log("Chargement de l'affrontement " + affrontement + "...");
            var selectedTournament = $("#selectedTournament").val();

            // Envoyer une requête AJAX pour récupérer les participants de l'affrontement sélectionné
            $.ajax({
                type: "POST",
                url: "get_affrontement.php", // Créez ce fichier pour gérer la récupération des participants de l'affrontement
                data: {tournament: selectedTournament, affrontement: affrontement},
                success: function (response) {
                    console.log("Réponse de l'affrontement " + affrontement + " : ", response);
                    $("#participantsSection").html(response);
                }
            });
        }

        </script>



    </nav>

</body>
</html>