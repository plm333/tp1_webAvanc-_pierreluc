<?php
require_once "Crud.php";

class Livre
{
    public $titre;
    public $auteur;
    public $maison_edition;
    public $prix;

    public function ajouterLivre($titre, $auteur, $maison_edition, $prix){
        $this->titre = $titre;
        $this->auteur = $auteur;
        $this->maison_edition = $maison_edition;
        $this->prix = $prix;
    }

    public function mettreAJourLivre(){
        
    }

    public function effacerLivre(){
        
    }

}