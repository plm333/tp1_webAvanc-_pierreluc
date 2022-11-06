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
    <style>
        input{
            display: block;
            margin: 5px;
        }
    </style>
</head>
<body>
<main>
    <h2>Modifier</h2>
        <form action="membre-update.php" method="post">
            <input type="hidden" name="id" value="<?php echo $id;?>">
            <label>Nom 
                <input type="text" name="nom" value="<?php echo $nom;?>">
            </label>
            <label>Prénom 
                <input type="text" name="prenom" value="<?php echo $prenom;?>">
            </label>
            <label>Adresse
                <input type="text" name="adresse" value="<?php echo $adresse;?>">
            </label>
            <label>Code Postal
                <input type="text" name="code_postal" value="<?php echo $code_postal;?>">
            </label>
            <label>Téléphone
                <input type="text" name="telephone" value="<?php echo $telephone;?>">
            </label>
            <label>Courriel
                <input type="email" name="courriel" value="<?php echo $courriel;?>">
            </label>
            <label>Livres empreuntés
                <input type="text" name="num_livre_loue" value="<?php echo $num_livre_loue;?>">
            </label>
            <label>Type de membre
                <input type="text" name="type_membre" value="<?php echo $type_membre;?>">
            </label>
            <input type="submit" value="Modifier">
        </form>
        <form action="membre-delete.php" method="post">
            <input type="hidden" name="id" value="<?php echo $id;?>">
            <input type="submit" value="Effacer">
        </form>
        <p><a href="membre-index.php?id=<?php echo $id; ?>">Retour</a></p>
    </main>
    
</body>
</html>