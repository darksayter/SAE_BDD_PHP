<?php
require 'connexion.php';

if (isset($_POST['tournament'])) {
    $selectedTournament = $_POST['tournament'];

    // Récupérer les participants au tournoi anime sélectionné depuis la table de classement
    $stmt = $db->prepare("SELECT id_anime, place FROM ClassementAnime WHERE id_tournoianime = :tournament");
    $stmt->bindParam(':tournament', $selectedTournament);
    $stmt->execute();
    $participants = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo '<h2>Participants au tournoi :</h2>';
    echo '<ul>';
    foreach ($participants as $participant) {
        // Récupérer les détails de l'anime depuis la table Anime
        $stmt = $db->prepare("SELECT title FROM Anime WHERE id_anime = :animeId");
        $stmt->bindParam(':animeId', $participant['id_anime']);
        $stmt->execute();
        $anime = $stmt->fetch(PDO::FETCH_ASSOC);

        echo "<li>{$anime['title']} - Place : {$participant['place']}</li>";
    }
    echo '</ul>';
}
?>
