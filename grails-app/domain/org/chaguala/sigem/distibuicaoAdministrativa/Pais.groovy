package org.chaguala.sigem.distibuicaoAdministrativa

class Pais {

    String designacao
    String nacionalidade
    String codigo

    static auditable = true
    static constraints = {
        codigo(maxSize: 20)
        designacao(blank: false, maxSize: 200, unique: true)
        nacionalidade(blank: true, maxSize: 200, unique: true)
    }

    static hasMany = [provincia: Provincia]

    static mapping = {
        provincia cascade: 'delete-orphan'
    }

    String toString() {
        return "${designacao}"
    }
}
