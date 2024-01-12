<?
  require ("header.php");
?>


<?php
// Inclure le fichier de connexion à la base de données
require ("connexion.php");

// Récupérer la liste des tournois anime depuis la base de données
$stmt = $db->query("SELECT id_tournoianime FROM TournoiAnime;");
$tournaments = $stmt->fetchAll(PDO::FETCH_COLUMN);
?>

<body>
    <nav class="contenu">
        <h1>Sélectionnez un tournoi anime :</h1>
        <form id="selectTournamentForm">
            <select name="selected_tournament" id="selectedTournament">
                <?php foreach ($tournaments as $tournament): ?>
                    <option value="<?= $tournament ?>">Tournoi #<?= $tournament ?></option>
                <?php endforeach; ?>
            </select>
            <input type="button" value="Sélectionner" onclick="loadParticipants()">
        </form>

        <div id="participantsSection">
            <!-- La liste des participants sera affichée ici -->
        </div>

        <script>
            function loadParticipants() {
                var selectedTournament = $("#selectedTournament").val();

                // Envoyer une requête AJAX pour récupérer les participants du tournoi
                $.ajax({
                    type: "POST",
                    url: "get_participants.php", // Créez ce fichier pour gérer la récupération des participants
                    data: {tournament: selectedTournament},
                    success: function (response) {
                        $("#participantsSection").html(response);

                        // Ajouter des champs de saisie et un bouton pour chaque paire de participants
                        $(".participants-pair").each(function () {
                            var idAnime1 = $(this).data("anime1");
                            var idAnime2 = $(this).data("anime2");

                            var inputAnime1 = $("<input type='number' placeholder='Score Anime 1'>");
                            var inputAnime2 = $("<input type='number' placeholder='Score Anime 2'>");
                            var confirmButton = $("<button onclick='confirmScores(" + selectedTournament + ", " + idAnime1 + ", " + idAnime2 + ")'>Confirmer</button>");

                            $(this).append(inputAnime1, inputAnime2, confirmButton);
                        });
                    }
                });
            }

            function confirmScores(tournament, anime1, anime2) {
                var scoreAnime1 = $("input[data-anime='" + anime1 + "']").val();
                var scoreAnime2 = $("input[data-anime='" + anime2 + "']").val();

                // Vérifier si les scores sont différents et valides (vous pouvez ajouter plus de validation ici si nécessaire)
                if (scoreAnime1 !== "" && scoreAnime2 !== "" && scoreAnime1 !== scoreAnime2) {
                    // Envoyer une requête AJAX pour mettre à jour l'affrontement
                    $.ajax({
                        type: "POST",
                        url: "update_affrontement.php", // Créez ce fichier pour gérer la mise à jour de l'affrontement
                        data: {
                            tournament: tournament,
                            anime1: anime1,
                            anime2: anime2,
                            scoreAnime1: scoreAnime1,
                            scoreAnime2: scoreAnime2
                        },
                        success: function (response) {
                            alert(response); // Affichez le message de confirmation ou gérez la réponse selon vos besoins
                        }
                    });
                } else {
                    alert("Veuillez entrer des scores valides et différents.");
                }
            }
        </script>
    </nav>

    <?php
  require ("assets/HTML/footer.html");
  ?>
</body>
</html>
