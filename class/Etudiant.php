<?php
require_once "Membre.php";

class Etudiant extends Membre
{
    protected $code_permanent;

    public function sauvegarderEtudiant(){
        if (isset($this->id)) {
            $this->update('membre', $this->post);
        }else{
            $insert = $this->insert('membre',$this->post);
            $this->id = $insert;
        }    
        return $this->id;
    }
    
    public function effacerEtudiant(){
        $delete = $this->delete('membre', $this->id);
        $delete;
    }

}

?>