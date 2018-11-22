package org.chaguala.sigem.modelo

import org.chaguala.sigem.marca.Marca

class Modelo {

    String designacao

    static hasMany = [marcas: Marca]

    static belongsTo = [marca:Marca]

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
