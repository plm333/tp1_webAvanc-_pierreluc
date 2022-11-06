<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'class/Membre.php';




$Crud = new Membre($_POST);
$update = $Crud->sauvegarder();

echo $update;

header('Location: membre-index.php');
