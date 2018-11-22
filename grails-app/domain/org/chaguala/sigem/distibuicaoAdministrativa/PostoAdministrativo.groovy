package org.chaguala.sigem.distibuicaoAdministrativa

class PostoAdministrativo {

    String designacao
    String codigo

    static belongsTo = [distrito: Distrito]

    static hasMany = [localidades: Localidade, bairros: Bairro]

     static auditable = true
    static constraints = {
        codigo(maxSize: 20)
        designacao(blank: false, maxSize: 200, unique: true)
    }

    static mapping = {
        localidades cascade: 'delete-orphan'
        bairros cascade: 'delete-orphan'
    }

    String toString() {
        return "${designacao}"
    }
}
