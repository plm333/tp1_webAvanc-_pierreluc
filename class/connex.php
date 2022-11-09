<?php

try{
    $dbhost = 'localhost';
    $dbname = 'e2194803';
    $dbuser = 'e2194803';
    $dbpass = 'FqJEn4S0kqPERMpsT8TA';
    $dbport = '3306';
    $pdo = new PDO("mysql:host=$dbhost; dbname=$dbname; port=$dbport; charset=utf8", $dbuser, $dbpass);
}catch(PDOException $e){
    echo "Error : ".$e->getMessage();
    die();
}

?>