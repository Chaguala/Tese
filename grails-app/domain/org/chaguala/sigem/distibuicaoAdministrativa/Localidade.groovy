package org.chaguala.sigem.distibuicaoAdministrativa

class Localidade {

    String designacao
    String codigo

    Distrito distrito
    PostoAdministrativo postoAdministrativo

    static hasMany = [bairros: Bairro]
    static auditable = true
    static constraints = {
        codigo(maxSize: 20)
        designacao(blank: false, maxSize: 200, unique: true)
        postoAdministrativo(nullable: true)
    }

    static mapping = {
        bairros cascade: 'delete-orphan'
    }

    String toString() {
        return "${designacao}"
    }
}
