package org.chaguala.sigem.distibuicaoAdministrativa


class Cidade {

    String designacao
    String descricao
    Distrito distrito


    static auditable = true

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
        descricao(maxSize: 2000)
        distrito(blank: true, nullable: true)
    }

    static belongsTo = [provincia: Provincia]

    String toString() {
        return "${designacao}"
    }
}
