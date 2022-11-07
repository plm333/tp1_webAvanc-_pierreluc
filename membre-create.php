<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouveau Membre</title>
    <link rel="stylesheet" href="css/style.css">
    
</head>

<body>
    <main>
        <h1>Ajouter un nouveau membre</h1>
        <form action="membre-store.php" method="post">
            <label>Nom
                <input type="text" name="nom">
            </label>
            <label>Prénom
                <input type="text" name="prenom">
            </label>
            <label>Adresse
                <input type="text" name="adresse">
            </label>
            <label>Code Postal
                <input type="text" name="code_postal">
            </label>
            <label>Téléphone
                <input type="text" name="telephone">
            </label>
            <label>Courriel
                <input type="email" name="courriel">
            </label>
            <label>Livres Empreutés
                <input type="text" name="num_livre_loue">
            </label>
            <label>Type de membre
                <input type="text" name="type_membre">
            </label>
            <input type="submit" value="Ajouter">
        </form>
        <p><a href="membre-index.php?id=<?php echo $id; ?>">Retour</a></p>
    </main>
</body>

</html>