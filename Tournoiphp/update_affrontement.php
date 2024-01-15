<?php
include 'connexion.php';

if (isset($_POST['tournament']) && isset($_POST['anime1']) && isset($_POST['anime2']) && isset($_POST['score1']) && isset($_POST['score2'])) {
    $tournament = $_POST['tournament'];
    $anime1 = $_POST['anime1'];
    $anime2 = $_POST['anime2'];
    $score1 = $_POST['score1'];
    $score2 = $_POST['score2'];

    // Effectuer la mise à jour de l'affrontement
    $stmt = $db->prepare("CALL MettreAJourAffrontementAnime(:tournament, :anime1, :anime2, :score1, :score2)");
    $stmt->bindParam(':tournament', $tournament);
    $stmt->bindParam(':anime1', $anime1);
    $stmt->bindParam(':anime2', $anime2);
    $stmt->bindParam(':score1', $score1);
    $stmt->bindParam(':score2', $score2);

    // Exécuter la procédure stockée
    $stmt->execute();

    // Répondre avec un message de succès (ou autre réponse nécessaire)
    echo "Mise à jour réussie!";
} else {
    // Répondre avec un message d'erreur si les paramètres requis ne sont pas fournis
    echo "Paramètres manquants!";
}
?>
