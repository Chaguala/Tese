package org.chaguala.sigem.tiposeguro

class TipoSeguro {

    String designacao

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
