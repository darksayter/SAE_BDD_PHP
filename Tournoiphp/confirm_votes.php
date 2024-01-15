<?php
include 'connexion.php';

if (isset($_POST['tournament']) && isset($_POST['affrontement']) && isset($_POST['votesAnime1']) && isset($_POST['votesAnime2'])) {
    $selectedTournament = $_POST['tournament'];
    $selectedAffrontement = $_POST['affrontement'];
    $votesAnime1 = $_POST['votesAnime1'];
    $votesAnime2 = $_POST['votesAnime2'];
    $offset = $selectedAffrontement - 1;

    // Récupérer les participants de l'affrontement sélectionné depuis la table affrontementanime
    $stmt = $db->prepare("SELECT id_anime1, id_anime2 FROM affrontementanime WHERE etapes = (SELECT etapes FROM tournoianime WHERE id_tournoianime = :tournament) AND id_tournoianime = :tournament OFFSET :offset LIMIT 1");
    $stmt->bindParam(':tournament', $selectedTournament);
    $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    $affrontement = $stmt->fetch(PDO::FETCH_ASSOC);

    // Utiliser les valeurs des colonnes id_anime1 et id_anime2
    $idAnime1 = $affrontement['id_anime1'];
    $idAnime2 = $affrontement['id_anime2'];

    // Appeler la procédure stockée avec les valeurs
    $stmt = $db->prepare("CALL MettreAJourAffrontementAnime(:tournament, :idAnime1, :idAnime2, :votesAnime1, :votesAnime2)");
    $stmt->bindParam(':tournament', $selectedTournament);
    $stmt->bindParam(':idAnime1', $idAnime1);
    $stmt->bindParam(':idAnime2', $idAnime2);
    $stmt->bindParam(':votesAnime1', $votesAnime1);
    $stmt->bindParam(':votesAnime2', $votesAnime2);
    $stmt->execute();
}
?>
