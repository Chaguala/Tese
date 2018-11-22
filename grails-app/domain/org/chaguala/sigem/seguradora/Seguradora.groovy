package org.chaguala.sigem.seguradora

class Seguradora {

    String nomeseguradora
    Date datacriacao
    String endereco
    String email
    int contacto

    static constraints = {
        nomeseguradora(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${nomeseguradora}"
    }
}
