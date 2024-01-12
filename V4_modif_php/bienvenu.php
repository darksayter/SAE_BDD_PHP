
<?php 
//On demare la session sur sur cette page 
session_start() ;

//On inclu le header
  require ("header.php");


     //Ensuite on affiche le contenu de la variable session
     echo "<p class ='message'> Bonjour " .  $_SESSION['email'] . "</p>";

     require("assets/HTML/footer.html");
    ?>
</body>
</html>