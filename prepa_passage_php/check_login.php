<?php
session_start();
// print'<pre>';
// print_r($_POST);
// print'</pre>';
$_SESSION['login'] = $_POST['login'];
header('Location:index.php');