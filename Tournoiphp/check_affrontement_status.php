<?php
include 'connexion.php';

if (isset($_POST['tournament']) && isset($_POST['affrontement'])) {
    $selectedTournament = $_POST['tournament'];
    $selectedAffrontement = $_POST['affrontement'];
    $offset = $selectedAffrontement -1;

    // Récupérer le statut de l'affrontement (si les votes de l'animé 1 ou 2 sont différents de 0, alors l'affrontement est terminé)
    $stmt = $db->prepare("SELECT COUNT(*) as count FROM affrontementanime WHERE id_tournoianime = :tournament AND etapes = (SELECT etapes FROM tournoianime WHERE id_tournoianime = :tournament) AND (vote_anime1 != 0 OR vote_anime2 != 0) OFFSET :offset LIMIT :affrontement;");
    $stmt->bindParam(':tournament', $selectedTournament);
    $stmt->execute();
    $count = $stmt->fetch(PDO::FETCH_ASSOC)['count'];

    // Si le nombre de lignes est supérieur à 0, l'affrontement est terminé
    if ($count > 0) {
        echo "termine";
    } else {
        echo "en_cours";
    }
}
?>
