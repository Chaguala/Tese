package org.chaguala.sigem.tipoveiculo

class TipoVeiculo {

    String designacao

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
