<?php
session_start();
$_SESSION['login'] = $_POST['login'];
header('Location:index.php');