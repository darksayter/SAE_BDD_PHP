<?php
// Nous allons nous connecter à notre base de donnée
require('connexion.php');

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

<?
  require ("header.php");
?>
<body>
   <section>
       <h1> Connexion </h1>
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
require('check_login.php');