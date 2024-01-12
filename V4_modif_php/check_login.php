<?php
session_start();

if (isset($_POST['mdp']) && isset($_POST['pseudo'])) {
    $pseudo = $_POST['pseudo'];
    $mdp = $_POST['mdp'];

    // Connexion à la base de données
    $host = "database";
    $dbname = "anime_tournament";
    $user = "anime_tournament";
    $password = "y4dfCN6h70qt";
    $dsn = "pgsql:host=$host;port=5432;dbname=$dbname;user=$user;password=$password";

    try {
        $con = new PDO($dsn);
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Utiliser une requête préparée pour éviter les injections SQL
        $stmt = $con->prepare("SELECT * FROM profil WHERE pseudo = :pseudo AND mdp = :mdp");
        $stmt->bindParam(':pseudo', $pseudo);
        $stmt->bindParam(':mdp', $mdp);

        // Exécuter la requête
        $stmt->execute();

        // Vérifier si une correspondance a été trouvée
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            // Correspondance trouvée, créer une variable de session
            $_SESSION['pseudo'] = $pseudo;
            header('Location: index.php');
            exit(); // Assurez-vous de terminer le script après la redirection
        } else {
            // Aucune correspondance trouvée, rediriger avec un message d'erreur
            header('Location: login.php?erreur=1');
            exit();
        }
    } catch (PDOException $e) {
        echo 'Connection failed: ' . $e->getMessage();
        die();
    }
}
?>