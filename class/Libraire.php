<?php
require_once "Crud.php";

class Libraire extends Crud
{
    public $id;

    public function sauvegarderLibraire(){
        if (isset($this->id)) {
            $this->update('libraire', $this->post);
        }else{
            $insert = $this->insert('libraire',$this->post);
            $this->id = $insert;
        }    
        return $this->id;
    }
    
    public function effacerLibraire(){
        $delete = $this->delete('libraire', $this->id);
        $delete;
    }

}

