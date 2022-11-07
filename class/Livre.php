<?php
require_once "Crud.php";

class Livre extends Crud
{
    public $titre;
    public $auteur;
    public $maison_edition;
    public $prix;
    public $id;
    private $post;

    public function __construct($livrePost)
    {
        parent::__construct();
        $this->titre = $livrePost["titre"];
        $this->auteur = $livrePost["auteur"];
        $this->maison_edition = $livrePost["maison_edition"];
        $this->prix = $livrePost["prix"];
        $this->id = $livrePost["id"];
        $this->post = $livrePost;
    }

    public function sauvegarderLivre(){
        if (isset($this->id)) {
            $this->update('livre', $this->post);
        }else{
            $insert = $this->insert('livre',$this->post);
            $this->id = $insert;
        }    
        return $this->id;
    }
    
    public function effacerLivre(){
        $delete = $this->delete('livre', $this->id);
        $delete;
    }

}