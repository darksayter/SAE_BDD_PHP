<?php
// Informations de connexion à la base de données
$host = "database";
$dbname = "anime-tournament";
$user = "anime-tournament";
$password = "y4dfCN6h70qt";

// Chaîne de connexion à la base de données
$dsn = "pgsql:host=$host;port=5432;dbname=$dbname;user=$user;password=$password";

// Connexion à la base de données
$db = new PDO($dsn);