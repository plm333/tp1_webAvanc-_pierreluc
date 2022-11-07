<?php
require_once "Crud.php";

class Bibliothèque extends Crud
{
    public $nom;

    public function sauvegarderBibliotheque(){
        if (isset($this->id)) {
            $this->update('bibliotheque', $this->post);
        }else{
            $insert = $this->insert('bibliotheque',$this->post);
            $this->id = $insert;
        }    
        return $this->id;
    }
    
    public function effacerBibliotheque(){
        $delete = $this->delete('bibliotheque', $this->id);
        $delete;
    }

}

?>
