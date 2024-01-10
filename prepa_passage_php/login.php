<?php
// Nous allons démarrer la session avant toute chose
session_start();

// Nous allons ensuite nous connecter à notre base de donnée
include('connexion.php');

try {
    // Créer une connexion PDO
    $con = new PDO($dsn);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
    die();
}

if (isset($_POST['boutton-valider'])) {
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $erreur = "";

        $stmt = $con->prepare("SELECT * FROM profil WHERE username = :username AND password = :password");
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);

        $stmt->execute();

    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire de connexion</title>
    <link rel="stylesheet" href="./asset/CSS/style_login.css">
</head>
<body>
   <section>
       <h1> Connexion</h1>
       <?php 
       if(isset($erreur)){// si la variable $erreur existe , on affiche le contenu ;
           echo "<p class= 'Erreur'>".$erreur."</p>"  ;
       }
       ?>
       <form action="" method="POST">  <!--on ne mets plus rien au niveau de l'action , pour pouvoir envoyé les données  dans la même page -->
           <label>Pseudo</label>
           <input type="text" name="username">
           <label >Mot de Passe</label>
           <input type="password" name="password">
           <input type="submit" value="Valider" name="boutton-valider">
       </form>
   </section> 
</body>
</html>

<?php
include('check_login.php');
