package org.chaguala.sigem.tipotrassao

class TipoTrassao {

    String designacao

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
