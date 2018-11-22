package org.chaguala.sigem.tipocombustivel

class TipoCombustivel {

    String designacao

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
