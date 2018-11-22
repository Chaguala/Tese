package org.chaguala.sigem.tipodocumento

class TipoDocumento {

    String designacao

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
