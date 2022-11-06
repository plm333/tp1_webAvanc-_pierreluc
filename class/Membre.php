<?php
require_once "Crud.php";

class Membre
{
    public $nom;
    public $prenom;
    public $adresse;
    public $code_postal;
    public $telephone;
    public $courriel;
    public $num_livre_loue;
    public $type_membre;
    public $id;
    private $crud;
    private $post;
    
    public function __construct($dictionnairePost)
    {
        $this->nom = $dictionnairePost["nom"];
        $this->prenom = $dictionnairePost["prenom"];
        $this->adresse = $dictionnairePost["adresse"];
        $this->code_postal = $dictionnairePost["code_postal"];
        $this->telephone = $dictionnairePost["telephone"];
        $this->courriel = $dictionnairePost["courriel"];
        $this->num_livre_loue = $dictionnairePost["num_livre_loue"];
        $this->type_membre = $dictionnairePost["type_membre"];
        $this->id = $dictionnairePost["id"];
        $this->crud = new Crud;
        $this->post = $dictionnairePost;
    }

    public function sauvegarder(){
        if (isset($this->id)) {
            $this->crud->update('membre', $this->post);
        }else{
            $insert = $this->crud->insert('membre', (array) $this);
            $this->id = $insert;
        }    
        return $this->id;
    }
    
    public function effacer(){
        $delete = $this->crud->delete('membre', $this->id);
        $delete;
    }

}