package org.chaguala.sigem.distibuicaoAdministrativa

class Bairro {

    String designacao
    Localidade localidade
    PostoAdministrativo postoAdministrativo
    Distrito distrito


    static auditable = true
    static constraints = {
        designacao(blank: false, maxSize: 200)
        localidade(nullable: true)
        postoAdministrativo(nullable: true)
    }

    String toString() {
        return "${designacao}"
    }
}
