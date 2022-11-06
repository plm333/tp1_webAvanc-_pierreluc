<?php

try{
    $dbhost = 'localhost';
    $dbname = 'eLibrary';
    $dbuser = 'root';
    $dbpass = 'root';
    $dbport = 8889;
    $pdo = new PDO("mysql:host=$dbhost; dbname=$dbname; port=$dbport; charset=utf8", $dbuser, $dbpass);
}catch(PDOException $e){
    echo "Error : ".$e->getMessage();
    die();
}

?>