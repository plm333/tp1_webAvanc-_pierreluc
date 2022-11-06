<?php
if(isset($_GET['id'])){
    $id = $_GET['id'];
    require_once "class/Crud.php";
    $Crud = new Crud;
    $membre = $Crud->selectId('membre', $id);
    extract($membre);
}else{
    header('Location: membre-index.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <main>
        <p><strong>Nom :</strong><?php echo $nom; ?></p>
        <p><strong>Prénom :</strong><?php echo $prenom; ?></p>
        <p><strong>Adresse :</strong><?php echo $adresse; ?></p>
        <p><strong>Code Postal :</strong><?php echo $code_postal; ?></p>
        <p><strong>Téléphone :</strong><?php echo $telephone; ?></p>
        <p><strong>Courriel : </strong><?php echo $courriel; ?></p>
        <p><strong>Livres Empreutés : </strong><?php echo $num_livre_loue; ?></p>
        <p><strong>Type de membre : </strong><?php echo $type_membre; ?></p>
        <p><a href="membre-edit.php?id=<?php echo $id; ?>">Modifier</a></p>
        <p><a href="membre-index.php?id=<?php echo $id; ?>">Retour</a></p>
    </main>
</body>
</html>