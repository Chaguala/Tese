package org.chaguala.sigem.tipopedido

class TipoPedido {

    String designacao
    String estado

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
        estado inList: ['','Activo','Inactivo']
    }

    String toString(){
        return "${designacao}"
    }
}
