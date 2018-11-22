package org.chaguala.sigem.distibuicaoAdministrativa


class Distrito {

    String designacao
    String codigo

    static auditable = true
    static constraints = {
        codigo(maxSize: 20)
        designacao(blank: false, maxSize: 200, unique: true)
    }

    static belongsTo = [provincia: Provincia]

    static hasMany = [cidades: Cidade, localidades: Localidade,
                      postos : PostoAdministrativo, bairros: Bairro]

    static mapping = {
        cidades cascade: 'delete-orphan'
        localidades cascade: 'delete-orphan'
        postos cascade: 'delete-orphan'
        bairros cascade: 'delete-orphan'
    }

    String toString() {
        return "${designacao}"
    }
}
