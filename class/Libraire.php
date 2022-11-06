<?php
require_once "Crud.php";

class Libraire
{
    public $nom;
    public $prenom;
    public $adresse;
    public $code_postal;
    public $courriel;
    public $telephone;

    // public function __construct($nom, $prenom, $adresse = null, $code_postal = null, $courriel, $telephone = null)
    // {
    //     $this->nom = $nom;
    //     $this->prenom = $prenom;
    //     $this->adresse = $adresse;
    //     $this->code_postal = $code_postal;
    //     $this->courriel = $courriel;
    //     $this->telephone = $telephone;
    // }

    public function ajouterLibraire($nom, $prenom, $adresse, $code_postal, $courriel, $telephone)
    {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->adresse = $adresse;
        $this->code_postal = $code_postal;
        $this->courriel = $courriel;
        $this->telephone = $telephone;
    }

    public function mettreAJourLibraire(){

    }

    public function effacerLibraire(){
        
    }

}