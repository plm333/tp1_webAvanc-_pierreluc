<?php

require_once 'class/Membre.php';

$Crud = new Membre($_POST);
$delete = $Crud->effacer();
