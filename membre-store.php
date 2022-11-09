<?php

require_once 'class/Membre.php';

$Crud = new Membre($_POST);
$insert = $Crud->sauvegarder();

$insert;

header('Location: index.php');


