<?php

require_once "class/Crud.php";

$Crud = new Crud;

$membre = $Crud->select("membre", "nom", "DESC");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des membres</title>
</head>
<body>
    <main>
        <h1>Liste des membres</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Adresse</th>
                    <th>Code Postal</th>
                    <th>Courriel</th>
                    <th>Téléphone</th>
                    <th>Livres empreuntés</th>
                    <th>Type de membre</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    foreach($membre as $row){
                ?>
                    <tr>
                        <td><a href="membre-show.php?id=<?php echo $row['id'] ?>"><?php echo $row['nom'] ?></a></td>
                        <td><?php echo $row['prenom'] ?></td>
                        <td><?php echo $row['adresse'] ?></td>
                        <td><?php echo $row['code_postal'] ?></td>
                        <td><?php echo $row['telephone'] ?></td>
                        <td><?php echo $row['courriel'] ?></td>
                        <td><?php echo $row['num_livre_loue'] ?></td>
                        <td><?php echo $row['type_membre'] ?></td>
                    </tr>
                <?php       
                    }
                ?>
            </tbody>
        </table>
        <p><a href="membre-create.php?id=<?php echo $id; ?>">Ajouter un membre</a></p>
    </main>
</body>
</html>