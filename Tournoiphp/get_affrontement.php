<?php
include 'connexion.php';

if (isset($_POST['tournament']) && isset($_POST['affrontement'])) {
    $selectedTournament = $_POST['tournament'];
    $selectedAffrontement = $_POST['affrontement'];
    
    // Calculer l'offset
    $offset = $selectedAffrontement - 1;

    // Récupérer les participants de l'affrontement sélectionné depuis la table affrontementanime
    $stmt = $db->prepare("SELECT id_anime1, id_anime2 FROM affrontementanime WHERE etapes = (SELECT etapes FROM tournoianime WHERE id_tournoianime = :tournament) AND id_tournoianime = :tournament OFFSET :offset LIMIT 1");
    $stmt->bindParam(':tournament', $selectedTournament);
    $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    $affrontement = $stmt->fetch(PDO::FETCH_ASSOC);

    echo '<h2>Affrontement ' . $selectedAffrontement . ' :</h2>';
    echo '<ul>';

    // Récupérer les détails de l'anime 1
    $stmt = $db->prepare("SELECT title FROM Anime WHERE id_anime = :animeId");
    $stmt->bindParam(':animeId', $affrontement['id_anime1']);
    $stmt->execute();
    $anime1 = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "<li>{$anime1['title']} - ID: {$affrontement['id_anime1']}</li>";

    // Récupérer les détails de l'anime 2
    $stmt = $db->prepare("SELECT title FROM Anime WHERE id_anime = :animeId");
    $stmt->bindParam(':animeId', $affrontement['id_anime2']);
    $stmt->execute();
    $anime2 = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "<li>{$anime2['title']} - ID: {$affrontement['id_anime2']}</li>";

    echo '</ul>';
}
?>
