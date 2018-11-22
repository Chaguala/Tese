package org.chaguala.sigem.distibuicaoAdministrativa

class DistritoUrbano {

    static auditable = true

    String nomeDistrito
    String sigla

    static belongsTo = [cidade: Cidade]
    static hasMany = [bairros: Bairro]

    static mapping = {
        bairros cascade: 'delete-orphan'
    }

    static constraints = {
        nomeDistrito(blank: false, nullable: false, unique: ['cidade'], maxSize: 500)
        sigla(blank: true, nullable: true, maxSize: 200)
    }

    String toString() {
        return "${nomeDistrito}"
    }

}
