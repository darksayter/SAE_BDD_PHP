<?php
include 'connexion.php';

if (isset($_POST['tournament'])) {
    $selectedTournament = $_POST['tournament'];

    // Récupérer le nombre d'affrontements dans le tournoi
    $stmt = $db->prepare("SELECT COUNT(*) as count FROM affrontementanime WHERE id_tournoianime = :tournament AND etapes = (SELECT etapes from tournoianime WHERE id_tournoianime = :tournament);");
    $stmt->bindParam(':tournament', $selectedTournament);
    $stmt->execute();
    $numberOfAffrontements = $stmt->fetch(PDO::FETCH_ASSOC)['count'];

    echo $numberOfAffrontements;
}
?>
