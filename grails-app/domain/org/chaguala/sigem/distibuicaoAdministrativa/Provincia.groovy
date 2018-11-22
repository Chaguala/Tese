package org.chaguala.sigem.distibuicaoAdministrativa


class Provincia implements Serializable {

    String designacao
    String codigo


    static auditable = true
    static constraints = {
        codigo(maxSize: 20)
        designacao(blank: false, maxSize: 200, unique: true)
    }

    static belongsTo = [pais: Pais]

    static hasMany = [distritos: Distrito]

    static mapping = {
        distritos cascade: 'delete-orphan'
    }

    String toString() {
        return "${designacao}"
    }
}
